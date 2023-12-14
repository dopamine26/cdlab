
%{
    #include<stdio.h>
    int flag=0;
    int yylex();
    void yyerror();
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%left '(' ')'

%%
calc : expr { printf("Result = %d\n", $1); 
			  return 0;
			};

expr : expr'+'term { $$ = $1 + $3; }
     | expr'-'term { $$ = $1 - $3; }
     | term { $$ = $1; }
     ;

term : term'*'factor { $$ = $1 * $3; }
     | term'/'factor { $$ = $1 / $3; }
     | factor { $$ = $1; }
     ;

factor : '('expr')' { $$ = $2; }
       | NUMBER { $$ = $1; }
       ;


%%

void main()

{
    printf("\nNikita Johny Kachappilly CS7B Roll 38\n");
    printf("\nEnter Any Arithmetic Expression :\n");
    yyparse();
  //  if(flag==0)
    
//    printf("\nEntered arithmetic expression is Valid\n\n");
}

void yyerror()

{
    printf("\nEntered arithmetic expression is Invalid\n\n");
    flag=1;

}


