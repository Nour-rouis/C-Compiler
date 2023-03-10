%option noyywrap
%option yylineno 

D                       [0-9]
L                       [a-zA-Z_]
H                       [a-fA-F0-9]
E                       [Ee][+-]?{D}+

%{
#include <stdio.h>
#include "structfe.tab.h"
#include "structbe.tab.h"
#include "table-symboles.h"

%}

%%

"else"                  {  return "ELSE"; }
"extern"                {  return "EXTERN"; }
"for"                   {  return "FOR"; }
"if"                    {  return "IF"; }
"int"                   {  return "INT"; }
"return"                {  return "RETURN"; }
"sizeof"                {  return "SIZEOF"; }
"struct"                {  return "STRUCT"; }
"typedef"               {  return "TYPEDEF"; }
"void"                  {  return "VOID"; }
"while"                 {  return "WHILE"; }

{L}({L}|{D})*           { return "IDENTIFIER"; }
{D}+                    { return "CONSTANT"; }

"("                     { return "("; }
")"                     { return ")"; }
"{"                     { return "{"; }
"}"                     { return "}"; }
"+"                     { return "+"; }
"-"                     { return "-"; }
"*"                     { return "*"; }
"/"                     { return "/"; }
"="                     { return "="; }
"->"                    { return "->"; }
"&&"                    { return "AND_OP"; }
"||"                    { return "OR_OP"; }
"<="                    { return "<="; }
">="                    { return ">="; }
"=="                    { return "=="; }
"!="                    { return "!="; }

[ \t\v\n\f\r]           /* ne rien faire */
.                       printf("Erreur lexicale (%s) à la ligne %d\n",yytext,yylineno)
%%
