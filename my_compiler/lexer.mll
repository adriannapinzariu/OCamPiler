{
  open Parser
}

rule tokenize = parse
  | [' ' '\t' '\n' '\r'] { tokenize lexbuf }
  | '+' { PLUS }
  | '-' { MINUS }
  | '*' { TIMES }
  | '/' { DIV }
  | '(' { LPAREN }
  | ')' { RPAREN }
  | ['0'-'9']+ as lxm { INT (int_of_string lxm) }
  | eof { EOF }
  | _ { raise (Failure "Unexpected character") }
