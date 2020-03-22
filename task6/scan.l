%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);
  int stack[100] = {0};
  int top = 0;
%}
%%

[0-9]+		{ sscanf(yytext, "%d", &stack[top++]); }
\-		{ int right_operand = stack[--top];
	 	  int left_operand = stack[--top];
	  	  stack[top++] = left_operand - right_operand; }
\+		{ int right_operand = stack[--top];
	  	  int left_operand = stack[--top];
	  	  stack[top++] = left_operand + right_operand; }
\/		{ int right_operand = stack[--top];
	  	  int left_operand = stack[--top];
	  	  stack[top++] = left_operand / right_operand; }
\*		{ int right_operand = stack[--top];
	  	  int left_operand = stack[--top];
	  	  stack[top++] = left_operand * right_operand; }
\n		{ printf("%d\n", stack[--top]); top++; }
" "		{ ; }
%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
