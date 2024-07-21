%{
#include <stdio.h>

extern int yylex();
void yyerror(const char *s);

%}

%token STR NUMBER

%type <name> STR
%type <number> NUMBER

%union {
    char name[20];
    int number;
}

%%
prog: stmt
stmt: STR | NUMBER
%%

void yyerror (const char *s) {
   fprintf (stderr, "%s\n", s);
}




