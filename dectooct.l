%option noyywrap
%{
#include <stdio.h>
%}

%%

[0-9]+ {
  int decimal = atoi(yytext);
  int octal[100], i = 0, j;

  while (decimal > 0) {
    octal[i] = decimal % 8;
    decimal /= 8;
    i++;
  }

  printf("Octal equivalent: ");
  for (j = i - 1; j >= 0; j--) {
    printf("%d", octal[j]);
  }
  printf("\n");
}

%%

int main(void) {
  yylex();
  return 0;
}
