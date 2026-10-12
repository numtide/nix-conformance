# Daemon replies to a worker-protocol client

The cases of the `wire` op (SPEC.md). Each case is a scripted daemon:
`CASE.bin` holds its bytes, `CASE.op` the operation the client runs, and
`CASE.exp` the answer of Nix 2.34.8's client. `make-cases` writes the
`.op`, `.bin` and `.after` files; `./expect` writes the `.exp` files.

| Cases | What the daemon does |
|:---|:---|
| `connect-*` | the handshake: trust flags, features, protocol 1.17 to 1.40, a wrong magic or major version, a truncated reply, stderr frames, and an error after the handshake or after `SetOptions` |
| `path-info-*` | `QueryPathInfo`: each field, the three hash forms, bad hashes, store paths, signatures and content addresses, a `bool` of 2, and stderr frames |
| `valid-paths-*`, `substitute` | `QueryValidPaths`: duplicates, paths the client did not ask for, a bad path |
| `missing-*`, `output-map-*`, `substitutable-*` | `QueryMissing`, `QueryDerivationOutputMap`, `QuerySubstitutablePathInfos` |
| `build-*` | `BuildPathsWithResults` at 1.36 to 1.38: each status, a message on a success, output sets, CPU times, a bad realisation |
| `indirect-root-*` | `AddIndirectRoot` |
| `nar-*` | `NarFromPath`: bytes after the NAR, a truncated NAR, a bad magic |
| `add-multiple-*` | `AddMultipleToStore`: the reply after the upload |

Some answers that a new client may not expect:

- An error after `QueryPathInfo` whose message holds `is not valid` is
  `none`, not `error`: old daemons signal an invalid path so
  (`BasicClientConnection::queryPathInfo`).
- A daemon at 1.18 to 1.34 is accepted, without a trust flag; 1.17 is
  refused (`WorkerProto::minimum`).
- The message of a successful build result is dropped.
- `AddIndirectRoot` takes any integer as its reply.
- Bytes after the NAR of `NarFromPath` are not read.

The replies on which Nix's own client crashes are in
`nix-bugs/daemon-client/`, not here.
