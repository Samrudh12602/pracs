%{
#include <stdio.h>
%}

%option noyywrap

%%
[a-zA-Z_][a-zA-Z0-9_]*  { printf("Valid variable name: %s\n", yytext); }
.                      { printf("Invalid character: %s\n", yytext); }
%%

int main()
{
    yylex();
    return 0;
}
