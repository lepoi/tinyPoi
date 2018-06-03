.DEFAULT_GOAL := main

main.tab.c main.tab.h: main.y
	bison -d -Wnone main.y

lex.yy.c: main.l main.tab.h
	flex main.l

main: lex.yy.c main.tab.c main.tab.h
	gcc main.tab.c lex.yy.c -lfl -o tinyPoi