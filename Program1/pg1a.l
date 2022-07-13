%{
#include<stdio.h>
int v=0,op=0,id=0;
%}

%%
[0-9]+  {id++;printf("\nIdentifier:");ECHO;}
[\+\-\*\/\=]    {op++;printf("\nOperator:");ECHO;}
"(" {v++;}
")" {v--;}
.|\n    {return 0;}
%%

void main(){
    printf("Enter the expression:\n");
    yylex();
    if((op+1)==id&&v==0){
        printf("\nIdentifiers -> %d\nOperators -> %d",id,op);
        printf("\nExpression is Valid");
    }
    else
        printf("\nExpression is Invalid");
}
int yywrap(){return 1;}