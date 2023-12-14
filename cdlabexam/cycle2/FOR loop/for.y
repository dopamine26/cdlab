%{
    #include<stdio.h>
    int flag=0;
    int yylex();
    void yyerror();
%}

%token NUMBER FOR ID TYPE INC DEC
%left '+' '-'
%left '*' '/'
%left '(' ')'

%%
for : FOR'('stmt';'stmt';'stmt')''{'body'}';
stmt: TYPE' 'assign | assign | expr |;
assign: ID'='expr;
body: stmt';'body | ;


expr : factor'+'factor
     | factor'-'factor
     | factor'*'factor
     | factor'/'factor
     | factor'<'factor
     | factor'>'factor
     | factor INC
     | factor DEC
     | factor
     ;



factor : '('expr')' 
       | NUMBER
       | ID
       ;


%%

void main()

{
    printf("\nNikita Johny Kachappilly CS7B 38\n");
    printf("\nEnter input:\n");
    yyparse();
    if(flag==0)
        printf("\nValid Expression \n");
}

void yyerror()

{
    printf("\nInvalid Expression\n");
    flag=1;

}
