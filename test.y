%{
#include <stdio.h>
extern int yylex();
void yyerror(const char *s);
%}

%token NUMBER CHAR STRING IDEN LEFT_PAREN RIGHT_PAREN LEFT_CURLY RIGHT_CURLY TERMINATE RETURN OTHER

%type <name> STR
%type <number> NUMBER

%union {
    int num;
    char c;
    char str[20];
    char iden[20];
}

%%

prog: stmt
    ;

stmt: NUMBER { printf("statement\n"); }
    ;

%%

void yyerror (const char *s) {
   fprintf (stderr, "%s\n", s);
}



