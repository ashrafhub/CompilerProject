/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

grammar Expr;

// START:stat
prog:   stat+ ;

stat:   expr NEWLINE
    |   ID '=' expr NEWLINE
    |   NEWLINE
    ;
// END:stat

// START:expr
expr:   multExpr (('+'|'-') multExpr)*
    ; 

multExpr
    :   atom ('*' atom)*
    ; 

atom:   INT 
    |   ID
    |   '(' expr ')'
    ;
// END:expr

// START:tokens
ID  :   ('a'..'z'|'A'..'Z')+ ;
INT :   '0'..'9'+ ;
NEWLINE:'\r'? '\n' ;
WS  :   (' '|'\t')+ {skip();} ;
// END:tokens