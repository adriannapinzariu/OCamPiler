open Lexer
open Parser
open Typechecker
open Compiler

let () =
  let lexbuf = Lexing.from_channel stdin in
  try
    let ast = Parser.main Lexer.tokenize lexbuf in
    typecheck_expr ast;
    let code = compile_expr ast in
    print_string code
  with
  | Lexer.Error msg ->
      Printf.eprintf "Lexer error: %s\n" msg; exit 1
  | Parser.Error ->
      Printf.eprintf "Parser error\n"; exit 1
  | Typechecker.TypeError msg ->
      Printf.eprintf "Type error: %s\n" msg; exit 1
