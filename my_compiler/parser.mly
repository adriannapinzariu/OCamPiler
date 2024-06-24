%{
open Ast
%}

%token <int> INT
%token PLUS MINUS TIMES DIV LPAREN RPAREN EOF
%left PLUS MINUS
%left TIMES DIV

%start <Ast.expr> main
%type <Ast.expr> expr

%%

main:
  | expr EOF { $1 }

expr:
  | INT { Int $1 }
  | expr PLUS expr { BinOp (Plus, $1, $3) }
  | expr MINUS expr { BinOp (Minus, $1, $3) }
  | expr TIMES expr { BinOp (Times, $1, $3) }
  | expr DIV expr { BinOp (Div, $1, $3) }
  | LPAREN expr RPAREN { $2 }
