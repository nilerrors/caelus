import std.stdio;
import std.algorithm;

import token;
import lexer;

const string program = 
"
    .data
my_var: .word 3

    .text
    .globl main
main:
	li $t1, 3
	sll $t0, $t1, 2			; multipliy $t1 by 4
	addi $t0, $0, 3
";

void main()
{
	Lexer lexer;
	lexer.feed(program);
	foreach (Token token; lexer.lex()) {
		writeln(token);
	}
}
