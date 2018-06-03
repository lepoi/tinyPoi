GRAMATICA TINYPOI

Digito_positivo: 
	1
	2
	3
	4
	5
	6
	7
	8
	9
Digito: 
	0
	Digito_positivo
Signo: 
	+
	-
	
Numero: 
	Numero_signo
	Numero_real
Numero_entero: 
	Digito
	Digito_positivo Numero_entero_siguientes
Numero_entero_siguientes: 
	Digito
	Numero_entero_siguientes Digito
Numero_signo: 
	Numero_entero
	Numero_signo Numero_entero
	Numero_signo Numero_real
Numero_real: 
	Numero_signo . Numero_decimal
Numero_decimal: 
	Digito
	Numero_decimal Digito 

Caracter: 
	Caracter_alfa
	Digito
	.
	,

	:
	;
	/
	?
	!
	@
	#
	$
	%
	^
	&
	*
	(
	)
	[
	]
	{
	}
	<
	>
	-
	_
	=
	+
	`
	~
Caracter_alfa: 
	a
	b
	c
	d
	e
	f
	g
	h
	i
	j
	k
	l
	m
	n
	o
	p
	q
	r
	t
	u
	v
	w
	x
	y
	z
	A
	B
	C
	D
	E
	F
	G
	H
	I
	J
	K
	L
	M
	N
	O
	P
	Q
	R
	S
	T
	U
	V
	W
	X
	Y
	Z
Caracteres: 
	Caracter
	Caracter Caracteres
Cadena: 
	" Caracteres "

Arreglo: 
	[ Arreglo_siguientes ]
Arreglo_siguientes: 
	Variable
	Variable_variable
	Variable , Arreglo_siguientes
	Variable_nombre , Arreglo_siguientes

Variable: 
	( Variable )
	Numero
	Cadena
	Arreglo
Variable_nombre: 
	( Variable_nombre )
	Caracter_alfa
	Caracter_alfa Variable_nombre_siguientes
Variable_nombre_siguientes: 
	Caracter_alfa Variable_nombre_siguientes
	Digito Variable_nombre_siguientes

Operando: 
	Variable
	Variable_nombre
Operador
	Operador_numerico
	Operador_booleano
Operador_numerico: 
	+
	-
	*
	/
	^
	%
Operador_booleano: 
	&
	|
Operacion_numerica: 
	( Operacion_numerica )
	Operando Operador_numerico Operando
	Operando Operador_numerico Operacion
	Operacion Operador_numerico Operando

Operador_comparador: 
	!
	==
	<
	>
Comparacion: 
	( Comparacion )
	Variable Operador_comparador Variable
	Variable Operador_comparador Comparacion
	Comparacion Operador_comparador Variable 
	Comparacion Operador_booleano Comparacion

Expresion: 
	Condicion ;
	Declaracion ;
	Asignacion ;
	Funcion ;
	Funcion_invocacion ;
	Ciclo ;
	regresa Variable ;
	regresa Variable_nombre ;
	Expresion Expresion

Condicion: 
	si ( Comparacion ) { Expresion }
	si ( Comparacion ) { Expresion } no { Expresion }
	si ( Comparacion ) { Expresion } sino { Expresion }
	si ( Comparacion ) { Expresion } sino { Expresion } no { Expresion }
Ciclo: 
	Ciclo_while
	Ciclo_for
Ciclo_while: 
	mientras ( Comparacion ) { Expresion }
Ciclo_for: 
	para ( Declaracion ; Comparacion ; Asignacion ) { Expresion }
	para ( Asignacion ; Comparacion ; Asignacion ) { Expresion }
	para ( ; Comparacion ; Asignacion ) { Expresion }
	para ( Declaracion ; Comparacion ; ) { Expresion }
	para ( Asignacion ; Comparacion ; ) { Expresion }
	para ( ; Comparacion ; ) { Expresion }

Tipo_dato:
	Num
	Cad
	[]
Declaracion:
	Tipo_dato Variable_nombre
	Tipo_dato Asignacion
Asignacion:
	Variable_nombre = Variable
	Variable_nombre = Funcion

Funcion: 
	funcion Variable_nombre ( ) { Expresion }
	funcion Variable_nombre( Argumentos ) { Expresion }
Funcion_invocacion: 
	Variable_nombre ( )
	Variable_nombre ( Argumentos )

Argumentos: 
	Tipo_dato Variable_nombre
	Tipo_dato Variable_nombre, Argumentos

Lectura: 
	? Variable_nombre
Impresion: 
	> Variable
	> Variable_nombre

START:
	Expresion