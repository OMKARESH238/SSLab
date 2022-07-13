%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
%}
%token A B
%%
input: S'\n'    {printf("Successful Grammar\n");exit(0);}
S:  C B|B
C:  A C|A
%%
void main(){
    printf("\nEnter a String");
    yyparse();
}
int yyerror(){
    printf("\nError");
    return 1;
} 