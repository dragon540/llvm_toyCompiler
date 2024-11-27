%{
// Lex programs are separrated into three sections by %% delimiters
// 1 - defintition
// 2 - rules
// 3 - user subroutine
%}


%{ // Definitions section 
%}

%{
#include <stdio.h>
//#include "node.h"
#include "test.tab.h"
void showToken(int type);
void printText(char str[]);
%}

%option noyywrap

%%

%{
// rules section
%}

" "                 ;
[0-9]+              { showToken(NUMBER); yylval.num = atoi(yytext); return (NUMBER); }
[a-zA-Z]            { showToken(CHAR); yylval.c = (char)yytext[0]; return (CHAR); }
"return"            { showToken(RETURN); printText(yytext);  return(RETURN); }
["][a-zA-Z]+["]     { showToken(STRING); sscanf(yytext, "%s", yylval.str); return (STRING); }
"int"               { showToken(INT_TYPE); return (INT_TYPE); }
"char"              { showToken(CHAR_TYPE); return (CHAR_TYPE); }
"bool"              { showToken(BOOL_TYPE); return (BOOL_TYPE); }
[a-zA-Z]+           { showToken(IDEN); sscanf(yytext, "%s", yylval.name); return (IDEN); }
"("                 { showToken(LEFT_PAREN); return (LEFT_PAREN); }
")"                 { showToken(RIGHT_PAREN); return (RIGHT_PAREN); }
"{"                 { showToken(LEFT_CURLY); return (LEFT_CURLY); }
"}"                 { showToken(RIGHT_CURLY); return (RIGHT_CURLY); }
";"                 { showToken(TERMINATE);  return (TERMINATE); }
"="                 { showToken(EQUAL);  return (EQUAL); }
.                   { showToken(OTHER); return (OTHER); }

%%

// user subroutine section
 
void showToken(int type) {
	printf("TYPE : %d\nVALUE : %s\n", type, yytext);
}

void printText(char str[]) {
	printf("%s\n", str);
}
