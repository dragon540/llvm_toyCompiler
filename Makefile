CC=gcc
LEXER=flex
PARSER=bison

genLexer: lex.l
	$(LEXER) lex.l

genParser: test.y
	$(PARSER) -d test.y

compile: lex.yy.c test.tab.c
	$(CC) -c lex.yy.c test.tab.c

link: lex.yy.o test.tab.o
	$(CC) lex.yy.o test.tab.o -o ast

run:
	./ast
