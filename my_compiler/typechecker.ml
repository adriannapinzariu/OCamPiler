open Ast

exception TypeError of string

let rec typecheck_expr = function
  | Int _ -> ()
  | BinOp (_, e1, e2) ->
      typecheck_expr e1;
      typecheck_expr e2
