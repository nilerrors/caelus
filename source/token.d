module token;

enum TokenType
{
    illegal = "illegal",
    eol = "<eol>",
    eof = "<eof>",
    
    identifier = "<identifier>",
    instruction = "<instruction>",
    register = "<register>",        // starts with $

    integer = "<integer>",
    ascii_string = "<string>",

    dot = ".",
    colon = ":",
    comma = ",",
}


struct Token
{
    TokenType type;
    string literal;
}
