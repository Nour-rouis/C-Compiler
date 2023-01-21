%{
#include <stdio.h>
#include "table-symboles.h"
%}

%token PO PF VIDE PLUS MOINS FOIS DIV AFFECTATION FLECHE AND_OP OR_OP IE_OP SE_OP E_OP NE_OP
%token IDENTIFIER CONSTANT
%token ELSE_TOKEN EXTERN_TOKEN FOR_TOKEN IF_TOKEN INT_TOKEN RETURN_TOKEN SIZEOF_TOKEN STRUCT_TOKEN TYPEDEF_TOKEN VOID_TOKEN WHILE_TOKEN

%left PLUS MOINS
%right FOIS DIV
%left AND_OP OR_OP
%nonassoc E_OP NE_OP IE_OP SE_OP

%start program
%%

statement:
    | declaration
    | function_definition
    ;

declaration:
    | type_specifier init_declarator_list ";"
    ;

type_specifier:
    | INT_TOKEN
    | VOID_TOKEN
    | STRUCT_TOKEN
    ;

init_declarator_list:
    | init_declarator
    | init_declarator_list "," init_declarator
    ;

init_declarator:
    | declarator
    | declarator "=" initializer
    ;

function_definition:
    | type_specifier declarator PO parameter_list PF compound_statement
    | type_specifier declarator compound_statement
    ;

parameter_list:
    | parameter_declaration
    | parameter_list "," parameter_declaration
    ;

parameter_declaration:
    | type_specifier declarator
    ;

compound_statement:
    | "{" statement_list "}"
    | "{" "}"
    ;

statement_list:
    | statement
    | statement_list statement
    ;

declarator:
    | IDENTIFIER
    | "*" declarator
    | declarator "[" CONSTANT "]"
    ;

initializer:
    | CONSTANT
    ;

%%

int yyerror(const char* msg) {
    fprintf(stderr, "Error: %s\n", msg);
    return 1;
}

int main() {
    yyparse();//lancer l'analyseur syntaxique 
    printf("fin de l'analyseur syntaxique");
}
