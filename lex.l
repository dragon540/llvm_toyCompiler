%{
#include <stdio.h>
//#include "node.h"
#include "test.tab.h"
void showToken(int type);
%}

%option noyywrap

%%

" "                 ;
[0-9]+              { showToken(NUMBER); yylval.num = atoi(yytext); return (NUMBER); }
[a-zA-Z]            { showToken(CHAR); yylval.c = yytext[0]; return (CHAR); }
["][a-zA-Z]+["]     { showToken(STRING); sscanf(yytext, "%s", yylval.str); return (STRING); }
"int"               { showToken(INT_TYPE); sscanf(yytext, "%s", yylval.dtype); return (INT_TYPE); }
"char"              { showToken(CHAR_TYPE); sscanf(yytext, "%s", yylval.dtype); return (CHAR_TYPE); }
"bool"              { showToken(BOOL_TYPE); sscanf(yytext, "%s", yylval.dtype); return (BOOL_TYPE); }
[a-zA-Z]+           { showToken(IDEN); sscanf(yytext, "%s", yylval.iden); return (IDEN); }
"("                 { showToken(LEFT_PAREN); return (LEFT_PAREN); }
")"                 { showToken(RIGHT_PAREN); return (RIGHT_PAREN); }
"{"                 { showToken(LEFT_CURLY); return (LEFT_CURLY); }
"}"                 { showToken(RIGHT_CURLY); return (RIGHT_CURLY); }
";"                 { showToken(TERMINATE); yylval.term = yytext[0]; return (TERMINATE); }
"="                 { showToken(EQUAL); yylval.plus = yytext[0]; return (EQUAL); }
"return"            { showToken(RETURN); return (RETURN); }
.                   { showToken(OTHER); return (OTHER); }

%%

void showToken(int type) {
    int a = 66;
    /**
	printf("TYPE : %d\nVALUE : %s\n", type, yytext);
	**/
}

/**int main() {
    yylex();
    return 0;
}**/
