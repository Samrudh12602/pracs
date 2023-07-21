%{
#include <stdio.h>
int keyword_count = 0;
int identifier_count = 0;
int operator_count = 0;
int separator_count = 0;
%}

%%
"char"|"do"|"double"|"else"|"float"|"for"|"if"|"int"|"long"|"return"|"void"|"while"   { keyword_count++; }
[A-Za-z_][A-Za-z0-9_]*   { identifier_count++; }
[+\-*/%]=?|==|!=|<=|>=|&&|\|\|   { operator_count++; }
[;,(){}[\]]   { separator_count++; }

.   /* Ignore any other characters. */

%%

int main() {
    yylex();
    printf("Total Tokens:\n");
    printf("Keywords: %d\n", keyword_count);
    printf("Identifiers: %d\n", identifier_count);
    printf("Operators: %d\n", operator_count);
    printf("Separators: %d\n", separator_count);
    return 0;
}
