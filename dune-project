(lang dune 2.7)
(name oww)

(source (github nymphium/oww))

(package
  (name oww)
  (depends
    (dune (>= 2))
    (ocaml (>= 4.08))

    (utop :dev)
    (ocamlformat :dev)
    (ocaml-lsp-server :dev)))
