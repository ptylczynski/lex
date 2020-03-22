%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);
  int col = -1;
  int curr = 0;
%}
%s table

%%

<table>[\ a-zA-Z0-9]{5}" "	{ if(curr == col) ECHO;
				  else ; curr++; }
<table>\n			{ curr = 0; 
				  printf("\n"); }
<INITIAL>[0-9]+				{ BEGIN table;
		  		  sscanf(yytext, "%d", &col); }
			

%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
