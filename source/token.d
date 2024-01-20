module token;

enum TokenType
{
    illegal = "illegal",
    eol = "<eol>",
    eof = "<eof>",
    
    identifier = "<identifier>",
    instruction = "<instruction>",
    register = "<register>",        // starts with $
    directive = "<directive>",      // starts with .
    label = "<label>",              // ends with :

    integer = "<integer>",
    ascii_string = "<string>",

    comma = ",",
}


struct Token
{
    TokenType type;
    string literal;
}
