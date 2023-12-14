%{
#include <stdio.h>
#include <string.h>
%}

%%
^.*Joya.* {
    
    printf("Contains first 4 characters of name as substring\n");
}

.* {
    printf("Doesn't contain first 4 characters of name as substring: %s\n", yytext);
}
%%

int yywrap() {}
int main() {
    printf("Mahesh Krishna C7B Roll no 35\n");
    printf("Enter strings (Ctrl+D or Ctrl+Z to end input):\n");
    yylex();

    return 0;
}

