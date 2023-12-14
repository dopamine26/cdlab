%{
#include<stdio.h>
int flag = 0;
int yylex();
void yyerror();
%}

%token NUMBER WHILE ID TYPE INC DEC
%left '+' '-'
%left '*' '/'
%left '(' ')'

%%
loop: WHILE'('stmt')''{'body'}';
stmt : TYPE' 'assign|assign|expr|;
assign : ID'='expr;
body : stmt';'body|;

expr : factor'+'factor|factor'-'factor|factor'*'factor|factor'/'factor|factor'<'factor|factor'>'factor|factor INC|factor DEC|factor;
factor : NUMBER|ID;

%%

void main()
{
printf("enter the input\n");
yyparse();
if(flag == 0)
printf("\n Valid expression \n");
}
void yyerror()
{
printf("\n Invalid Expression");
flag = 1;
}

