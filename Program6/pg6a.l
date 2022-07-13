%{
#include<stdio.h>
int sl=0;
int ml=0;
%}

%%
"/*"[a-zA-Z0-9 \t\n]*"*/"   ml++;
"//".*  sl++;
%%
void main(){
    yyin = fopen("f1.c","r");
    yyout = fopen("f2.c","w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    printf("\nNumber of Single Line Comments are = %d",sl);
    printf("\nNumber of Multi Line Comments are = %d",ml);
}
int yywrap(){return 1;}