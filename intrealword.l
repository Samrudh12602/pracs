%option noyywrap

%{
#include<stdio.h>
%}

%%
[0-9]+ {printf("%d is integer", yytext);}
[0-9]*[.][0-9]+ {printf("%s is real", yytext);}
[A-Za-z]* {printf("%s is Word", yytext);}

%%

int main(){
printf("Enter input:");
yylex();
return 0;
}