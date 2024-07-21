CC=g++
LEXER=flex
PARSER=bison

genLexer: lex.l
	$(LEXER) lex.l

genParser: test.y
	$(PARSER) -d test.y

compile: lex.yy.c test.tab.c main.cpp
	$(CC) -c lex.yy.c test.tab.c main.cpp

link: lex.yy.o test.tab.o
	$(CC) lex.yy.o test.tab.o main.o -o ast

run:
	./ast
