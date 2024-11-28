%{
#include "node.h"
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

prog: stmt { printf("parsing prog\n"); }
    ;

stmt: type IDEN equal value TERMINATE { printf("parsing stmt\n"); }
    ;

value: NUMBER { printf("number value\n"); }
     | CHAR {printf("char value\n"); }
     | STRING {printf("string value\n"); }
     ;

type: INT_TYPE { printf("int\n"); }
    | CHAR_TYPE {printf("char\n"); }
    | BOOL_TYPE { printf("bool\n"); }
    ;

equal: EQUAL { printf("equal\n"); }
    ;

%%

void yyerror (const char *s) {
   fprintf (stderr, "%s\n", s);
}

