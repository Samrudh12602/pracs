%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>

int positive_count = 0;
int negative_count = 0;
%}

%%
[+-]?[0-9]+(\.[0-9]+)?   {
                            double num = atof(yytext);
                            if (num > 0)
                                positive_count++;
                            else if (num < 0)
                                negative_count++;
                         }

\n    { 
                            printf("Positive count: %d\n", positive_count);
                            printf("Negative count: %d\n", negative_count);
                            positive_count = 0; // Reset the counts for the next input
                            negative_count = 0;
                         }

.    ; 
%%

int main() {
    char buffer[1024];
    printf("Enter numbers (separated by spaces): ");
    yyin = stdin;
    yylex();
    return 0;
}
