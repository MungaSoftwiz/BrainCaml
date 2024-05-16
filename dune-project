(lang dune 3.15)

(name BrainCaml)

(generate_opam_files true)

(source
 (github MungaSoftwiz/BrainCaml))

(authors "Boniface Munga")

(maintainers "Boniface Munga")

(license LICENSE)

(package
 (name BrainCaml)
 (synopsis "An OCaml-based interpreter for the Brainfuck esolang")
 (depends ocaml dune)
 (tags
  (topics "OCaml" "functional programming" "Brainfuck" "interpreter"  BrainCaml)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
