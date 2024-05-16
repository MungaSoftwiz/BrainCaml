(* lib/braincaml.mli *)

(** The Braincaml module provides functions for executing Brainfuck programs. *)

type bf_cell
type bf_pointer
type bf_memory

val initialize_memory : unit -> bf_memory
val execute_program : string -> unit
