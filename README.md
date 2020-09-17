Oww
===

Oww is a web service written in OCaml.

とりあえず Opium 0.17 の例をクリーンアーキテクチャぽい階層にした｡

# Build and Run

```shell-session
$ dune external-lib-deps --missing
$ dune exe oww &
$ curl http://localhost:3000/person/john_doe/42
{"name":"john_doe","age":42}
```

# LICENSE
MIT

