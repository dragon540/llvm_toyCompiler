%{
#include <stdio.h>
extern int yylex();
void yyerror(const char *s);
%}

%token<num> NUMBER
%token<c> CHAR
%token RETURN
%token<str> STRING
%token INT_TYPE
%token CHAR_TYPE
%token BOOL_TYPE
%token<name> IDEN
%token LEFT_PAREN
%token RIGHT_PAREN
%token LEFT_CURLY
%token RIGHT_CURLY
%token TERMINATE
%token EQUAL
%token OTHER

%union {
    int num;
    char c;
    char str[20];
    char name[20];
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

