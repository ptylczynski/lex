%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);
  int isError = 0;
%}

%s sequence
%%

[01]+		{ ECHO; }
\n		{ if(isError) printf(" Error\n");
		  else printf(" OK\n"); 
		  isError = 0; }
.		{ ECHO; isError = 1; }

%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
