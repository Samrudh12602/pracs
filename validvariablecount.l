%option noyywrap

%{
#include <stdio.h>
int count = 0;
%}

%%
[a-zA-Z_][a-zA-Z0-9_]*  { count++; }
.                      { /* ignore other characters */ }
%%

int main(int argc, char **argv)
{
    if (argc < 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }
    FILE *fp = fopen(argv[1], "r");
    if (!fp) {
        printf("Error: unable to open file '%s'\n", argv[1]);
        return 1;
    }
    yyin = fp;
    yylex();
    printf("Number of valid variable names: %d\n", count);
    fclose(fp);
    return 0;
}
