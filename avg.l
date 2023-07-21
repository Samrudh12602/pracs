%{
#include <stdio.h>
#include <stdlib.h>
double sum = 0;
int count = 0;
%}

%option noyywrap

%%

[0-9]+ { 
    sum += atof(yytext);
    count++;
}

\n { printf("Average: %.2f\n", sum/count); sum = count = 0; }

. ;

%%

int main() {
yylex();
    return 0;
}
