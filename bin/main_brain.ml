(* bin/main.ml *)

open Braincaml

let print_usage (filename : string) : unit =
  let usage_msg = "Usage: " ^ filename ^ " <filename>" in
  print_endline usage_msg

let run_interpreter (filename : string) : unit =
  try
    let ic = open_in filename in
    let program = really_input_string ic (in_channel_length ic) in
    close_in ic ; execute_program program
  with
  | Sys_error err ->
      print_endline ("Error: " ^ err)
  | End_of_file ->
      ()

let _ =
  if Array.length Sys.argv <> 2 then print_usage Sys.argv.(0)
  else run_interpreter Sys.argv.(1)
