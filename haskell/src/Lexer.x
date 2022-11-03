{
-- Analisador lexical para a calculador simples
module Lexer where
}

%wrapper "basic"

$white =  [\ \t\n\r]
$digit =  [0-9]	

tokens :-

$white+   ;   -- ignorar carateres "brancos"

"+"       { \_ -> TOK_PLUS }
"-"       { \_ -> TOK_MINUS }
"*"       { \_ -> TOK_MULT }
"/"       { \_ -> TOK_DIV }
"("       { \_ -> TOK_LPAREN }
")"       { \_ -> TOK_RPAREN }
"sqrt"    { \s -> TOK_SQRT }
"exp"     { \s -> TOK_EXP }
"log"     { \s -> TOK_LOG }

$digit+ 		    { \s -> TOK_NUM (read s) }
$digit+"."$digit+   { \s -> TOK_NUM (read s) }

{
data Token = TOK_PLUS
     	   | TOK_MINUS
  	   	   | TOK_MULT
  	   	   | TOK_DIV
  	   	   | TOK_LPAREN
  	   	   | TOK_RPAREN
  	   	   | TOK_NUM Float
		   | TOK_SQRT  
		   | TOK_EXP 
		   | TOK_LOG 
		   deriving(Eq, Show)
}
