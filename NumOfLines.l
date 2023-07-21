%option noyywrap

%{
#include<stdio.h>
int count =0;
%}

%%
\n { count++; }
%%

int main(){
yyin= fopen("abc.txt","r+");
yylex();
printf("Number of lines is %d\n",count+1);
return 0;
}