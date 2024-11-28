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

%type <nodeptr> prog;
%type <stmtptr> stmt;
%type <valueptr> value;
%type <typeptr> type;
%type <eqptr> equal;

%union {
    int num;
    char c;
    char str[20];
    char name[20];

    class StatementNode *stmtptr;
    class TypeNode  *typeptr;
    class ValueNode *valueptr;
    class EqNode *eqptr; 
    class Node *nodeptr;
}

%%

prog: stmt { printf("parsing prog\n"); $$ = new Node(); }
    ;

stmt: type IDEN equal value TERMINATE { printf("parsing stmt\n"); $$ = new StatementNode(); }
    ;

value: NUMBER { printf("number value = %d\n", $1); $$ = new ValueNode(); ($$->val).intVal = $1; }
     | CHAR {printf("char value = %c\n", $1); $$ = new ValueNode(); ($$->val).charVal = $1; }
     | STRING {printf("string value = %s\n", $1); }
     ;

type: INT_TYPE { printf("int\n"); $$ = new TypeNode(); $$->typeId = 1; }
    | CHAR_TYPE {printf("char\n"); $$ = new TypeNode(); $$->typeId = 2; }
    | BOOL_TYPE { printf("bool\n"); $$ = new TypeNode(); $$->typeId = 3; }
    ;

equal: EQUAL { printf("equal\n"); $$ = new EqNode(); }
    ;

%%

void yyerror (const char *s) {
   fprintf (stderr, "%s\n", s);
}

