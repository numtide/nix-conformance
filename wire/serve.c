// wire-serve SOCKET SCRIPT [AFTER]: a scripted Nix daemon for the `wire`
// cases (SPEC.md). It listens on SOCKET, prints its pid and goes to the
// background. To each connection it sends SCRIPT. With AFTER, it answers
// each AddTempRoot and sends AFTER once the operation has arrived.

#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/un.h>
#include <unistd.h>

enum { SET_OPTIONS = 19, ADD_TEMP_ROOT = 11, ADD_MULTIPLE = 44, LAST = 0x616c7473 };

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

static void send_all(int fd, const void * buf, size_t len)
{
    const char * p = buf;
    while (len) {
        ssize_t n = write(fd, p, len);
        if (n <= 0)
            return;
        p += n;
        len -= n;
    }
}

static int skip(FILE * in, uint64_t n)
{
    for (; n; n--)
        if (getc(in) == EOF)
            return -1;
    return 0;
}

static int u64(FILE * in, uint64_t * v)
{
    unsigned char b[8];
    if (fread(b, 1, 8, in) != 8)
        return -1;
    *v = 0;
    for (int i = 7; i >= 0; i--)
        *v = *v << 8 | b[i];
    return 0;
}

static int str(FILE * in)
{
    uint64_t n;
    return u64(in, &n) || skip(in, (n + 7) / 8 * 8);
}

static int strs(FILE * in, uint64_t per)
{
    uint64_t n;
    if (u64(in, &n))
        return -1;
    for (n *= per; n; n--)
        if (str(in))
            return -1;
    return 0;
}

// Reads the client up to its operation; `minor` is the script's version.
static int await_op(FILE * in, int fd, uint64_t minor)
{
    static const uint64_t root_reply[2] = {LAST, 1};
    uint64_t v, op;
    if (u64(in, &v) || u64(in, &v))
        return -1;
    if ((v & 0xff) < minor)
        minor = v & 0xff;
    if ((minor >= 38 && strs(in, 1)) || (minor >= 14 && u64(in, &v)) || (minor >= 11 && u64(in, &v)))
        return -1;
    for (;;) {
        if (u64(in, &op))
            return -1;
        if (op == SET_OPTIONS) {
            if (skip(in, 12 * 8) || strs(in, 2))
                return -1;
        } else if (op == ADD_TEMP_ROOT) {
            if (str(in))
                return -1;
            send_all(fd, root_reply, sizeof root_reply);
        } else if (op == ADD_MULTIPLE) {
            // two flags, then frames up to the empty one
            if (u64(in, &v) || u64(in, &v))
                return -1;
            do
                if (u64(in, &v) || skip(in, v))
                    return -1;
            while (v);
            return 0;
        } else
            return 0;
    }
}

static void serve(int fd, const char * script, size_t slen, const char * after, size_t alen)
{
    char buf[4096];
    send_all(fd, script, slen);
    if (after) {
        uint64_t minor = slen >= 16 ? (unsigned char) script[8] : 0;
        FILE * in = fdopen(dup(fd), "rb");
        if (in && await_op(in, fd, minor) == 0)
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
