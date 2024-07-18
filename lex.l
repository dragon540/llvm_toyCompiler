%{
#include <stdio.h>
#include "node.h"
void showError();
void printInt();
void printInt();
%}

%%

[a-zA-Z]+     { printStr();  return (STRING); }
[0-9]+        { printInt();  return (NUMBER); }
.             { showError(); return (OTHER); }

%%

void showError() {
	printf("Invalid token\n");
}

void printInt() {
	printf("integer\n");
}

void printStr() {
        printf("string\n");
}

