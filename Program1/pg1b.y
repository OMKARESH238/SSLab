%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
%}

%token num
%left '+' '-'
%left '*' '/'

%%
input: exp   {printf("%d\n",$$);exit(0);}
exp:   exp'+'exp   {$$=$1+$3;}
        |exp'-'exp  {$$=$1-$3;}
        |exp'*'exp  {$$=$1*$3;}
        |exp'/'exp  {if($3==0){printf("DivideByZeroError");exit(0);}
                    else $$=$1/$3;}
        |'('exp')'{$$=$2;}
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