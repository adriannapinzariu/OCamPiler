type binop = Plus | Minus | Times | Div

type expr =
  | Int of int
  | BinOp of binop * expr * expr
