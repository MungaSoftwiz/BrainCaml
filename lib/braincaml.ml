(* lib/braincaml.ml *)

  type bf_cell = int
  type bf_pointer = int
  type bf_memory = bf_cell array

  let initialize_memory () : bf_memory =
    Array.make 30000 0

  let rec execute_instruction (program : string) (pointer : bf_pointer) (prog_index : int) (memory : bf_memory) : int =
    match program.[prog_index] with
      | '>' -> execute_instruction program (pointer + 1) (prog_index + 1) memory
      | '<' -> execute_instruction program (pointer - 1) (prog_index + 1) memory
      | '+' ->
        memory.(pointer) <- memory.(pointer) + 1;
        execute_instruction program pointer (prog_index + 1) memory
      | '-' ->
        memory.(pointer) <- memory.(pointer) - 1;
        execute_instruction program pointer (prog_index + 1) memory
      | '.' ->
        print_char (Char.chr memory.(pointer));
        execute_instruction program pointer (prog_index + 1) memory
      | ',' ->
        memory.(pointer) <- Char.code (read_line ()).[0];
        execute_instruction program pointer (prog_index + 1) memory
      | '[' ->
        if memory.(pointer) = 0 then
          let rec find_matching_bracket (index : int) (counter : int) : int =
            match program.[index] with
            | '[' -> find_matching_bracket (index + 1) (counter + 1)
            | ']' ->
              if counter = 0 then
                index + 1
              else
                find_matching_bracket (index + 1) (counter - 1)
            | _ -> find_matching_bracket (index + 1) counter
          in
          let new_index = find_matching_bracket (prog_index + 1) 0 in
          execute_instruction program pointer new_index memory
        else
          execute_instruction program pointer (prog_index + 1) memory
      | ']' ->
        if memory.(pointer) <> 0 then
          let rec find_matching_bracket (index : int) (counter : int) : int =
            match program.[index] with
            | ']' -> find_matching_bracket (index - 1) (counter + 1)
            | '[' ->
              if counter = 0 then
                index + 1
              else
                find_matching_bracket (index - 1) (counter - 1)
            | _ -> find_matching_bracket (index - 1) counter
          in
          let new_index = find_matching_bracket (prog_index - 1) 0 in
          execute_instruction program pointer new_index memory
        else
          execute_instruction program pointer (prog_index + 1) memory
      | _ -> execute_instruction program pointer (prog_index + 1) memory

  let execute_program (program : string) : unit =
    let memory = initialize_memory () in
    let _ = execute_instruction program 0 0 memory in
    ()