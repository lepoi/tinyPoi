# tinyPoi

tinyPoi is a lexer for a fictional (for now) programming language I call "poi", it is also an assingment for my Automata Theory course.

The grammar itself was be made in Spanish as per our teacher's request.

Also, keep in mind that this is meant to be installed UNIX-like systems only.

## Installation

	git clone https://github.com/lepoi/tinyPoi.git
	cd tinyPoi
	make

## Running

	./tinyPoi example.poi

### Data Types

tinyPoi uses two data types:

>'cad' for cadena (string)

>works pretty much as you'd expect it to.

>'num' for número (number)

>includes both integer and floating point numbers.

Data types can also be converted to array structures of the same type appending '[]' to the type name.

### Operators

**arithmetic operators**

	'+' => addition
	'-' => subtraction 
	'\*' => product
	'/' => division
	'%' => modulo
**boolean operators**

	'&' => AND 
	'|' => OR 
	'\>' => greater than
	'<' => less than
	'==' => equal to
	'!' => different than
**special operators**

	'=>' => reference
	'?' => read user input

### Conditions

Keywords change from English to Spanish:

>'if' => 'si'

>'else if' => 'sino'

>'else' => 'no'

>All of there work the way you'd expect

Conditions end in ; (semi-colon);

	si ((n % 3 == 0) & (n % 5 == 0)) {
		"fizzbuzz\n";
	}
	sino (n % 3 == 0) {
		"fizz\n";
	}
	sino (n % 5 == 0) {
		"buzz\n";
	};

### Cycles

Keywords change from English to Spanish:

>'while' => 'mientras'

>works exactly like a while would

>'for' => 'para'

>there's one little difference here: the expressions on both sides of the cycle's declaration are optional and the last expression of the declaration does not need a terminator semi-colon.

>also, para can be invoked with an array as parameter, then given the refefrence operator (=>) and a variable name to use inside its cycles, pretty much a foreach


	num i = 0;
	mientras (i < n) {
		i = i + 1;
	}
	para (num i = 0; i < n; i = i + 1) {
		> i;
	};

### Functions

Declaring and invoking functions is pretty much the same as in C, the difference being we don't declare a return data type and declaration ends in ; (semi-colon).

	funcion fizzbuzz (num n) {
		para (num i = 0; i < n; i = i + 1) {
			si ((n % 3 == 0) & (n % 5 == 0)) {
				> "fizzbuzz\n";
			}
			sino (n % 3 == 0) {
				> "fizz\n";
			}
			sino (n % 5 == 0) {
				> "buzz\n";
			};
		};
	};

	fizzbuzz(100);

### Printing

The symbol \> declares the native function for printing a given value, variable or operation.

	> "Hello world!";

### Reading

The symbol ? declares the native function for reading user input and setting the input a variable.

	? variable_name;