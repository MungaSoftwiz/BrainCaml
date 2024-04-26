# BrainCaml - WIP

BrainCaml is a work-in-progress program designed to practice functional
programming concepts in OCaml. It serves as an interpreter for the Brainfuck
esolang, allowing users to write and execute Brainfuck programs within the
OCaml environment.

## Functional Programming Practice

BrainCaml provides an opportunity to dive into functional programming principles
such as immutability, pattern matching, recursion, and higher order functions.
By implementing a Brainfuck interpreter, I aim to gain hands-on experience in
applying these concepts to solve real-world problems.

## Features

- Interprets Brainfuck programs written in a concise, minimalistic syntax.
- Supports all standard Brainfuck commands: `>`, `<`, `+`, `-`, `.`, `,`, `[`, and `]`.
- Utilizes functional programming techniques to ensure clean, modular, and
efficient code.

## Usage

1. Clone the repository to your local machine.
2. Compile the OCaml source files using `ocamlopt`.
3. Run the compiled executable, passing the path to a Brainfuck program file
as an argument.

```
$ ocamlopt -o braincaml braincaml.ml
$ ./braincaml example.bf
```
