%{ 
#include "y.tab.h"
%}

%%

while return WHILE;
int|float|char return TYPE;
[a-zA-Z_][a-zA-Z_]* return ID;
[0-9]+ return NUMBER;
"++" return INC;
"--" return DEC;
. return *yytext;
\n return 0;

%%

int yywrap()
{
return 1;
}




 
