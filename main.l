%{
	#include "stdio.h"
	#include "main.tab.h"
	//#define YY_DECL extern "C" int yylex()

	int line_count = 1;
	int column_count = 0;
	char *last_input;
%}

%%

\"(\\\"|[^\"])*\"	{ column_count += strlen(yytext); last_input = yytext; return CADENA; }
\;		{ column_count++; last_input = yytext; return EXPR_FIN; }
\:		{ column_count++; last_input = yytext; return OPE_DOSP; }
\+		{ column_count++; last_input = yytext; return OPE_SUMA; }
\-		{ column_count++; last_input = yytext; return OPE_REST; }
\*		{ column_count++; last_input = yytext; return OPE_MULT; }
\/		{ column_count++; last_input = yytext; return OPE_DIVI; }
\%		{ column_count++; last_input = yytext; return OPE_MODU; }
\|		{ column_count++; last_input = yytext; return OPE_OR; }
\&		{ column_count++; last_input = yytext; return OPE_AND; }
\!		{ column_count++; last_input = yytext; return OPE_DIFQ; }
\>		{ column_count++; last_input = yytext; return OPE_MAYQ; }
\<		{ column_count++; last_input = yytext; return OPE_MENQ; }
==		{ column_count += 2; last_input = yytext; return OPE_IGUQ; }
\?		{ column_count++; last_input = yytext; return OPE_LECT; }

\=\>	{ column_count += 2; last_input = yytext; return S_REF; }
\(		{ column_count++; last_input = yytext; return S_PARI; }
\)		{ column_count++; last_input = yytext; return S_PARF; }
\[		{ column_count++; last_input = yytext; return S_ARRI; }
\]		{ column_count++; last_input = yytext; return S_ARRF; }
\{		{ column_count++; last_input = yytext; return S_LLAI; }
\}		{ column_count++; last_input = yytext; return S_LLAF; }
\,		{ column_count++; last_input = yytext; return S_COMA; }
\=		{ column_count++; last_input = yytext; return S_ASIG; }

[0-9]+(\.?[0-9]+)?	{ column_count += strlen(yytext); last_input = yytext; return NUMERO; }

sino	{ column_count += 4; last_input = yytext; return COND_EI; }
si		{ column_count += 2; last_input = yytext; return COND_I; }
no		{ column_count += 2; last_input = yytext; return COND_E; }

mientras	{ column_count += 4; last_input = yytext; return CICLO_M; }
para		{ column_count += 4; last_input = yytext; return CICLO_P; }

funcion	{ column_count += 7; last_input = yytext; return FUNC_I; }
regresa { column_count += 7; last_input = yytext; return FUNC_R; }

num(\[\])?[^a-zA-Z10-9]	{ column_count += strlen(yytext); last_input = yytext; return T_DATO; }
cad(\[\])?[^a-zA-Z10-9]	{ column_count += strlen(yytext); last_input = yytext; return T_DATO; }
[a-zA-Z_][a-zA-Z10-9_]*	{ column_count += strlen(yytext); last_input = yytext; return VARIABLE_N; }

\n		{ line_count++; column_count = 0; }
. 		column_count += 1;

%%

//printf("found %s\n", yytext);