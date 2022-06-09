%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
%}

%token num
/* %left '+' '-' */
/* %left '*' '/' */
/* %left '(' ')' */

%%
input: E   {printf("%d\n",$$);exit(0);}
E:   E'+'E   {$$=$1+$3;}
        |E'-'E  {$$=$1-$3;}
        |E'*'E  {$$=$1*$3;}
        |E'/'E  {if($3==0){printf("DivideByZeroError");exit(0);}
                    else $$=$1/$3;}
        |'('E')'{$$=$2;}
        |num{$$=$1;}
%%

void main(){
    printf("Enter an expression\n");
    yyparse();
}
int yyerror(){
    printf("InvalidExpression\n");
    return 1;
}