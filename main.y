%{
	#include "stdio.h"
	#include "stdbool.h"

	extern int yylex();
	extern int yyparse();
	extern FILE *yyin;
	extern int line_count;
	extern int column_count;
	extern char *last_input;

	bool error = false;

	void yyerror(const char *s);
%}

// colon token (unused)
%token OPE_DOSP

// arithmetical operators
%token OPE_SUMA
%token OPE_REST
%token OPE_MULT
%token OPE_DIVI
%token OPE_MODU

// boolean operators
%token OPE_OR
%token OPE_AND
%token OPE_MAYQ
%token OPE_MENQ
%token OPE_DIFQ
%token OPE_IGUQ

// reading operator
%token OPE_LECT
// printing is invoked with OPE_MAYQ

// special characters
%token S_REF
%token S_PARI
%token S_PARF
%token S_ARRI
%token S_ARRF
%token S_LLAI
%token S_LLAF
%token S_COMA
%token S_ASIG

//	data types
%token T_DATO
%token NUMERO
%token CADENA

// variables
%token VARIABLE_N

// expresions
%token EXPR_FIN
%token EXPR_REG

// conditions
%token COND_I
%token COND_E
%token COND_EI

// cycles
%token CICLO_M
%token CICLO_P

// functions
%token FUNC_I
%token FUNC_R

// start
%start EXPRESION

%%
EXPRESION
	: EXPRESION EXPRESION
	| ASIGNACION EXPR_FIN
	| DECLARACION EXPR_FIN
	| CONDICION EXPR_FIN
	| CICLO EXPR_FIN
	| FUNCION_INVO EXPR_FIN
	| FUNCION EXPR_FIN
	| REGRESAR EXPR_FIN
	;

EXPR_BL
	: S_LLAI EXPRESION S_LLAF ;

VARIABLE
	: NUMERO
	| CADENA
	| ARREGLO
	| FUNCION_INVO
	;

VARIABLE_V
	: OPERANDO
	| OPERANDO S_COMA VARIABLE_V
	;

VARIABLE_VT
	: T_DATO VARIABLE_N
	| T_DATO VARIABLE_N S_COMA VARIABLE_VT
	;

ARREGLO
	: S_ARRI VARIABLE_V S_ARRF
	;

OPERADOR_ARIT
	: OPE_SUMA
	| OPE_REST
	| OPE_MULT
	| OPE_DIVI
	| OPE_MODU
	;

OPERADOR_BOOL
	: OPE_IGUQ
	| OPE_DIFQ
	| OPE_MAYQ
	| OPE_MENQ
	| OPE_AND
	| OPE_OR
	;

OPERANDO
	: VARIABLE
	| VARIABLE_N
	| OPERACION
	;

OPERACION
	: S_PARI OPERACION S_PARF
	| OPERANDO OPERADOR_ARIT OPERANDO
	; 

COMPARACION
	: S_PARI COMPARACION S_PARF
	| OPERANDO
	| OPERANDO OPERADOR_BOOL OPERANDO
	| COMPARACION OPERADOR_BOOL COMPARACION
	;

ASIGNACION
	: VARIABLE_N S_ASIG VARIABLE
	| VARIABLE_N S_ASIG VARIABLE_N
	| VARIABLE_N S_ASIG OPERACION
	;

DECLARACION
	: T_DATO VARIABLE_N
	| T_DATO ASIGNACION
	;

CONDICION
	: CONDICION_I
	| CONDICION_I CONDICION_E
	| CONDICION_I CONDICION_EI
	| CONDICION_I CONDICION_EI CONDICION_E
	;

CONDICION_I
	: COND_I S_PARI COMPARACION S_PARF EXPR_BL
	;

CONDICION_EI
	: COND_EI S_PARI COMPARACION S_PARF EXPR_BL
	| CONDICION_EI CONDICION_EI
	;

CONDICION_E
	: COND_E S_LLAI EXPRESION S_LLAF
	;

CICLO
	: CICLO_W
	| CICLO_F
	;

CICLO_W
	: CICLO_M S_PARI COMPARACION S_PARF EXPR_BL ;

CICLO_F
	: CICLO_P S_PARI CICLO_F_ARG S_PARF EXPR_BL ;

CICLO_F_ARG
	: ARREGLO S_REF VARIABLE_N
	| DECLARACION EXPR_FIN COMPARACION EXPR_FIN ASIGNACION
	| ASIGNACION EXPR_FIN COMPARACION EXPR_FIN ASIGNACION
	| COMPARACION EXPR_FIN ASIGNACION
	| DECLARACION EXPR_FIN COMPARACION
	| ASIGNACION EXPR_FIN COMPARACION
	| COMPARACION
	;

FUNCION
	: FUNC_I VARIABLE_N S_PARI S_PARF EXPR_BL
	| FUNC_I VARIABLE_N S_PARI VARIABLE_VT S_PARF EXPR_BL
	;

FUNCION_INVO
	: VARIABLE_N S_PARI S_PARF
	| VARIABLE_N S_PARI VARIABLE_V S_PARF
	| FUNCION_NAT
	;

FUNCION_NAT
	: FN_LECT
	| FN_IMPR
	;

FN_LECT
	: OPE_LECT VARIABLE_N ;

FN_IMPR
	: OPE_MAYQ OPERANDO ;

REGRESAR
	: FUNC_R OPERANDO ;
%%

int main(int argc, char **argv) {
	if (! argv[1]) {
		printf("Filename was not supplied\n");
		return -1;
	}
	
	FILE *source = fopen(argv[1], "r");

	if (!source) {
		printf("Error opening %s\n", argv[1]);
		return -1;
	}

	yyin = source;
	do {
		yyparse();
	} while (!feof(yyin));

	if (error)
		printf("Syntax error!\nOn \"%s\" at line %i, column %i\n", last_input, line_count + 1, column_count);
	else
		printf("Success parsing %i lines in %s\n", line_count, argv[1]);
}

void yyerror(const char *m) {
	error = true;
}