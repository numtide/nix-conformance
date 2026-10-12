// wire-serve SOCKET SCRIPT [AFTER]: a scripted Nix daemon for the `wire`
// cases (SPEC.md). It listens on SOCKET, prints its pid and goes to the
// background. To each connection it sends SCRIPT, closes its write side and
// reads until the client goes. With AFTER, it sends SCRIPT, reads until the
// end of the client's upload, then sends AFTER: a daemon reads an upload
// before it answers.

#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/un.h>
#include <unistd.h>

// the framed upload of `add-multiple`: a frame of the count 0, then the
// empty frame
static const unsigned char upload_end[24] = {8};

static char * slurp(const char * file, size_t * len)
{
    FILE * f = fopen(file, "rb");
    if (!f)
        return NULL;
    struct stat st;
    if (fstat(fileno(f), &st) != 0)
        return NULL;
    char * buf = malloc(st.st_size + 1);
    *len = fread(buf, 1, st.st_size, f);
    fclose(f);
    return buf;
}

static void send_all(int fd, const char * buf, size_t len)
{
    while (len) {
        ssize_t n = write(fd, buf, len);
        if (n <= 0)
            return;
        buf += n;
        len -= n;
    }
}

static void serve(int fd, const char * script, size_t slen, const char * after, size_t alen)
{
    unsigned char tail[sizeof upload_end] = {0}, buf[4096];
    size_t seen = 0;
    ssize_t n;
    send_all(fd, script, slen);
    if (after) {
        while ((n = read(fd, buf, sizeof buf)) > 0) {
            for (ssize_t i = 0; i < n; i++) {
                memmove(tail, tail + 1, sizeof tail - 1);
                tail[sizeof tail - 1] = buf[i];
            }
            seen += n;
            if (seen >= sizeof tail && memcmp(tail, upload_end, sizeof tail) == 0)
                break;
        }
        send_all(fd, after, alen);
    }
    shutdown(fd, SHUT_WR);
    while (read(fd, buf, sizeof buf) > 0)
        ;
}

int main(int argc, char ** argv)
{
    if (argc != 3 && argc != 4) {
        fprintf(stderr, "usage: wire-serve SOCKET SCRIPT [AFTER]\n");
        return 2;
    }
    size_t slen = 0, alen = 0;
    char * script = slurp(argv[2], &slen);
    char * after = argc == 4 ? slurp(argv[3], &alen) : NULL;
    if (!script || (argc == 4 && !after)) {
        perror("wire-serve");
        return 2;
    }
    struct sockaddr_un addr = {.sun_family = AF_UNIX};
    if (strlen(argv[1]) >= sizeof addr.sun_path) {
        fprintf(stderr, "wire-serve: socket path too long\n");
        return 2;
    }
    strcpy(addr.sun_path, argv[1]);
    int sock = socket(AF_UNIX, SOCK_STREAM, 0);
    if (sock < 0 || bind(sock, (struct sockaddr *) &addr, sizeof addr) != 0 || listen(sock, 8) != 0) {
        perror("wire-serve");
        return 2;
    }
    signal(SIGCHLD, SIG_IGN);
    signal(SIGPIPE, SIG_IGN);
    pid_t pid = fork();
    if (pid < 0)
        return 2;
    if (pid > 0) {
        printf("%d\n", pid);
        return 0;
    }
    // the runner kills the server; this ends one it forgot
    alarm(120);
    freopen("/dev/null", "w", stdout);
    for (;;) {
        int fd = accept(sock, NULL, NULL);
        if (fd < 0)
            continue;
        if (fork() == 0) {
            // a client that never ends its upload, or never goes, gets EOF
            alarm(10);
            close(sock);
            serve(fd, script, slen, after, alen);
            _exit(0);
        }
        close(fd);
    }
}
