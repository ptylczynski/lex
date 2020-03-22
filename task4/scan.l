%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);
%}
%s line
%%

<line>"\n"		{ BEGIN 0;
		  	  ECHO; }
<line>.			{ ECHO; }
\ +			{ BEGIN line; }
[a-zA-Z]|[\.,;:\(\)]	{ ECHO;
			  BEGIN line; }

%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
