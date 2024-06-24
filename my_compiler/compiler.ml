open Ast

let rec compile_expr = function
  | Int n -> Printf.sprintf "PUSH %d\n" n
  | BinOp (op, e1, e2) ->
      let code1 = compile_expr e1 in
      let code2 = compile_expr e2 in
      let op_code = match op with
        | Plus -> "ADD"
        | Minus -> "SUB"
        | Times -> "MUL"
        | Div -> "DIV"
      in
      code1 ^ code2 ^ Printf.sprintf "%s\n" op_code
