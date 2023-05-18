%{
#include <stdio.h>

int yylex();
void yyerror(const char* s);

%}

%token NUMBER

%%
program: expr { printf("%d\n", $1); }
        ;

expr: term { $$ = $1; }
    | expr '+' term { $$ = $1 + $3; }
    | expr '-' term { $$ = $1 - $3; }
    ;

term: factor { $$ = $1; }
    | term '*' factor { $$ = $1 * $3; }
    | term '/' factor { $$ = $1 / $3; }
    ;

factor: NUMBER { $$ = $1; }
       | '(' expr ')' { $$ = $2; }
       ;

%%

void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
}
