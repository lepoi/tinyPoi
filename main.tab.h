/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_MAIN_TAB_H_INCLUDED
# define YY_YY_MAIN_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    OPE_DOSP = 258,
    OPE_SUMA = 259,
    OPE_REST = 260,
    OPE_MULT = 261,
    OPE_DIVI = 262,
    OPE_MODU = 263,
    OPE_OR = 264,
    OPE_AND = 265,
    OPE_MAYQ = 266,
    OPE_MENQ = 267,
    OPE_DIFQ = 268,
    OPE_IGUQ = 269,
    OPE_LECT = 270,
    S_REF = 271,
    S_PARI = 272,
    S_PARF = 273,
    S_ARRI = 274,
    S_ARRF = 275,
    S_LLAI = 276,
    S_LLAF = 277,
    S_COMA = 278,
    S_ASIG = 279,
    T_DATO = 280,
    NUMERO = 281,
    CADENA = 282,
    VARIABLE_N = 283,
    EXPR_FIN = 284,
    EXPR_REG = 285,
    COND_I = 286,
    COND_E = 287,
    COND_EI = 288,
    CICLO_M = 289,
    CICLO_P = 290,
    FUNC_I = 291,
    FUNC_R = 292
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_MAIN_TAB_H_INCLUDED  */
