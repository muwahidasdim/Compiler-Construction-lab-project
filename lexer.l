%{
#include <stdio.h>
#include "parser.tab.h" // Include the token definitions from the parser
%}

%%
[ \t\n]       ; // Skip whitespace

[0-9]+        { yylval = atoi(yytext); return NUMBER; }
[+\-*/()]    { return *yytext; }

.             { fprintf(stderr, "Unexpected character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}
