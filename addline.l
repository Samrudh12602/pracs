%{
#include <stdio.h>
int line_num = 0;
%}

%option noyywrap

%%

\n { printf("%d: %s", ++line_num, yytext); }

. { printf("%s", yytext); }

%%

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <input file>\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (!input_file) {
        fprintf(stderr, "Error opening input file: %s\n", argv[1]);
        return 1;
    }

    yyin = input_file;
    yylex();
    fclose(input_file);
    return 0;
}
