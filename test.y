%{
#include <stdio.h>
extern int yylex();
void yyerror(const char *s);
%}

%token NUMBER CHAR STRING INT_TYPE CHAR_TYPE BOOL_TYPE IDEN LEFT_PAREN RIGHT_PAREN LEFT_CURLY RIGHT_CURLY TERMINATE EQUAL RETURN OTHER

%type <name> STRING
%type <number> NUMBER
%type <iden> IDEN
%type <c> TERMINATE
%type <dtype> INT_TYPE
%type <dtype> CHAR_TYPE
%type <dtype> BOOL_TYPE

%union {
    int num;
    char c;
    char str[20];
    char iden[20];
    char term;
    char plus;
    char dtype[10];
}

%%

prog: stmt
    ;

stmt: type IDEN equal NUMBER TERMINATE { printf("statement\n"); }
    ;

type: INT_TYPE | CHAR_TYPE | BOOL_TYPE
    ;

equal: EQUAL
    ;

%%

void yyerror (const char *s) {
   fprintf (stderr, "%s\n", s);
}



