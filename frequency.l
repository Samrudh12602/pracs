%option noyywrap
%{
#include <stdio.h>
#include <string.h>
int c = 0;
char* word;
%}
%%
[a-zA-Z]+ {
    if (strcasecmp(yytext, word) == 0)
        c++;
}
.|\n {}
%%
int main(int argc, char* argv[]) {  
    word = "POC";
    FILE* file = fopen("abc.txt", "r");
    if (!file) {
        printf("Error opening file: abc.txt\n");
        return 1;
    }
    yyin = file;
    yylex();
    printf("The occurrence of the word '%s' in the file 'abc.txt' is %d\n", word, c);

    fclose(file);
    return 0;
}