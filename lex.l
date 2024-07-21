%{
#include <stdio.h>
#include "node.h"
#include "test.tab.h"
void showToken(int type);
%}

%option noyywrap

%%

[0-9]+              { showToken(INT); yylval.number = atoi(yytext); return (INT); }
[a-zA-Z]            { showToken(CHAR); return (CHAR); }
["]+[a-zA-Z]+["]    { showToken(STRING); return (STRING); }
"("                 { showToken(LEFT_PAREN); return (LEFT_PAREN); }
")"                 { showToken(RIGHT_PAREN); return (RIGHT_PAREN); }
"{"                 { showToken(LEFT_CURLY); return (LEFT_CURLY); }
"}"                 { showToken(RIGHT_CURLY); return (RIGHT_CURLY); }
";"                 { showToken(TERMINATE); return (TERMINATE); }
"return"            { showToken(RETURN); return (RETURN); }
.                   { showToken(OTHER); return (OTHER); }

%%

void showToken(int type) {
	printf("TYPE : %d\nVALUE : %s\n", type, yytext);
}

int main() {
    yylex();
    return 0;
}
