%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);
%}
%s found
%%

<found>\n			{ BEGIN 0; }
<found>.			{ ECHO; }
\ *[0-9]+\ *\n			{ long int liczba;
				  sscanf(yytext, "%ld", &liczba);
				  if((liczba % 5) == 0) printf("%s(+)\n", yytext);
				  else printf("%s(-)\n", yytext);  }
.+				{ ECHO; }

%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
