module lexer;

import std.conv : to;

import util;
import token;
import register;
import directive;
import instruction;

const uint ASCII_0 = 48;
const uint ASCII_9 = 57;
const uint ASCII_LC_A = 97;
const uint ASCII_LC_Z = 122;
const uint ASCII_UC_A = 65;
const uint ASCII_UC_Z = 90;

struct Lexer
{
    ulong pos;
    ulong len;
    string code;
    Token[] tokens;

    void feed(const string code) {
        this.code = code;
        this.len = code.length;
    }

    Token[] lex() {
        while (this.pos < this.len) {
            this.handleCurrentToken();
            this.pos++;
        }

        tokens ~= Token(TokenType.eof, "");

        return tokens;
    }

    void handleCurrentToken() {
        switch (code[this.pos]) {
            case ' ', '\t':
                return;
            case '\n':
                tokens ~= Token(TokenType.eol, "\n");
                return;
            case ',':
                tokens ~= Token(TokenType.comma, ",");
                return;
            case '.':
                this.handleDirective();
                return;
            case ';':
                this.skipUntil('\n');
                return;
            case '$':
                this.handleRegister();
                return;
            case ASCII_0: .. case ASCII_9:
                this.handleInt();
                return;
            case '_':
            case ASCII_UC_A: .. case ASCII_UC_Z:
            case ASCII_LC_A: .. case ASCII_LC_Z:
                this.handleIdentifier();
                return;
            default:
                break;
        }

        tokens ~= Token(TokenType.illegal, to!string(code[this.pos]));
    }

    void handleRegister() {
        string name = "$";
        
        while (this.canPeek() && (this.peekIsInt() || this.peekIsLowercaseLetter())) {
            this.pos++;
            name ~= this.code[this.pos];
        }

        if (name.findInList(registers))
        tokens ~= Token(TokenType.register, name);
    }

    void handleDirective() {
        string name = ".";

        while (this.canPeek() && this.peekIsLowercaseLetter()) {
            this.pos++;
            name ~= this.code[this.pos];
        }

        if (name.findInList(directives)) {
            tokens ~= Token(TokenType.directive, name);
            return;
        }
        
        tokens ~= Token(TokenType.illegal, name);
    }
    
    void handleInt() {
        string integer = "";
        integer ~= this.code[this.pos];

        while (this.canPeek() && this.peekIsInt()) {
            this.pos++;
            integer ~= this.code[this.pos];
        }

        tokens ~= Token(TokenType.integer, integer);
    }

    void handleIdentifier() {
        string name = "";
        name ~= this.code[this.pos];
        
        while (this.canPeek() && (this.peekIsInt() || this.peekIsLetter() || this.peek() == '_')) {
            this.pos++;
            name ~= this.code[this.pos];
        }
        
        this.skipSpacing();
        if (this.canPeek() && this.peek() == ':') {
            this.pos++;
            tokens ~= Token(TokenType.label, name);
            return;
        }
        if (name.findInList(instructions)) {
            tokens ~= Token(TokenType.instruction, name);
            return;
        }

        tokens ~= Token(TokenType.identifier, name);
    }

    void skipSpacing() {
        while (this.canPeek() && this.isSpacing()) {
            this.pos++;
        }
    }

    bool isSpacing() {
        return this.code[this.pos] == ' ' || this.code[this.pos] == '\t';
    }

    bool canPeek() {
        return this.pos + 1 < this.len;
    }

    // assumes canPeek call is preceded
    char peek() {
        return this.code[this.pos + 1];
    }

    bool peekIsInt() {
        return ASCII_0 <= this.peek() && this.peek() <= ASCII_9;
    }

    bool peekIsLetter() {
        return (ASCII_LC_A <= this.peek() && this.peek() <= ASCII_LC_Z) || 
                (ASCII_UC_A <= this.peek() && this.peek() <= ASCII_UC_Z);
    }

    bool peekIsLowercaseLetter() {
        return ASCII_LC_A <= this.peek() && this.peek() <= ASCII_LC_Z;
    }

    void skipUntil(char untilChar) {
        if (this.canPeek() && this.peek() != untilChar) {
            this.pos++;
            skipUntil(untilChar);
        }
    }
}
