package Analizadores;
import java_cup.runtime.*;

%class Lexer
%public
%unicode
%cup
%line
%column

%{
    StringBuffer string = new StringBuffer();

    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}
    
// Expresiones Regulares

// Operadores aritmeticos binarios
SUMA = \+
RESTA = -
DIVISION = \/
MULTIPLICACION = \*
MODULO = \~
POTENCIA = \*\*

// Operadores arimeticos unarios
SUMASUMA = \+\+
RESTARESTA = --

// Operadores relacionales
MENOR = <
MENORIGUAL = =<
MAYOR = >
MAYORIGUAL = =>
IGUAL = ==
DIFERENTE = !=

DIGIT = [0-9]


// Operadores logicos

AND = \^
OR = #
NOT = !

// Identificador

IDENTIFICADOR = [:jletter:] [:jletterdigit:]*

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace     = {LineTerminator} | [ \t\f]

/* comments 
Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}

TraditionalComment   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
// Comment can be the last line of the file, without line terminator.
EndOfLineComment     = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/**" {CommentContent} "*"+ "/"
CommentContent       = ( [^*] | \*+ [^/*] )*
*/
\
Comment = {CustomSingleLineComment} | {CustomMultiLineComment}

CustomSingleLineComment = "@"{InputCharacter}*
CustomMultiLineComment = "/_"( [^_] | _ [^/] | / [^_] | _ / | _ _ [^/] | _ [^_])*"_/"

Identifier = [:jletter:] [:jletterdigit:]*

Numero = 0 | -?[1-9]{DIGITO}*
DecIntegerLiteral = 0 | [1-9][0-9]*

Parentesis1 = \(
Parentesis2 = \)
Cuadrado1 = \[
Cuadrado2 = \] 
Llave1 = \{
Llave2 = \}
Pipe = \|
Separador = \,
Asignador = \<\=

%state STRING

%%

/* keywords */
<YYINITIAL> "boolean"            { return symbol(sym.bool_kringle); }
<YYINITIAL> "int"                { return symbol(sym.int_noel); }
<YYINITIAL> "float"              { return symbol(sym.float_nicolas); }
<YYINITIAL> "string"             { return symbol(sym.string_sinterklaas); }
<YYINITIAL> "char"               { return symbol(sym.char_pascuero); }
<YYINITIAL> "null"               { return symbol(sym.null_joulupukki); }
<YYINITIAL> "struct"             { return symbol(sym.struct_colacho); }
<YYINITIAL> "if"                 { return symbol(sym.if_elfo); }
<YYINITIAL> "else"               { return symbol(sym.else_duende); }
<YYINITIAL> "elif"               { return symbol(sym.elif_hada); }
<YYINITIAL> "while"              { return symbol(sym.while_repite); }
<YYINITIAL> "for"                { return symbol(sym.for_envuelve); }
<YYINITIAL> "do"                 { return symbol(sym.do_hace); }
<YYINITIAL> "until"              { return symbol(sym.until_revisa); }
<YYINITIAL> "switch"             { return symbol(sym.switch_gorro); }
<YYINITIAL> "case"               { return symbol(sym.case_estrella); }
<YYINITIAL> "default"            { return symbol(sym.default_navidad); }
<YYINITIAL> "return"             { return symbol(sym.return_envia); }
<YYINITIAL> "in"                 { return symbol(sym.in_envuelto); }
<YYINITIAL> "break"              { return symbol(sym.break_corta); }
<YYINITIAL> "print"              { return symbol(sym.print_narra); }
<YYINITIAL> "read"               { return symbol(sym.read_escucha); }
<YYINITIAL> "main"               { return symbol(sym.main_fiestas); }
<YYINITIAL> "true"               { return symbol(sym.l_true_olentzero); }
<YYINITIAL> "false"              { return symbol(sym.l_false_jesus); }
<YYINITIAL> "void"               { return symbol(sym.void_painatal); }

<YYINITIAL> {
  /* identifiers */ 
  {Identifier}                   { return symbol(sym.IDENTIFIER); }
  
  /* literals */
  {DecIntegerLiteral}            { return symbol(sym.INTEGER_LITERAL); }
  \"                             { string.setLength(0); yybegin(STRING); }

  /* operators */
  {SUMA}                         { return symbol(sym.suma_rudolph); }
  {RESTA}                        { return symbol(sym.resta_dasher); }
  {DIVISION}                     { return symbol(sym.division_dancer); }
  {MULTIPLICACION}               { return symbol(sym.multiplicacion_prancer); }
  {MODULO}                       { return symbol(sym.modulo_vixen); }
  {POTENCIA}                     { return symbol(sym.potencia_comet); }
  {SUMASUMA}                     { return symbol(sym.aumentar_quien); }
  {RESTARESTA}                   { return symbol(sym.disminuir_grinch); }
  {MENOR}                        { return symbol(sym.menor_fizz); }
  {MENORIGUAL}                   { return symbol(sym.menor_igual_mistle); }
  {MAYOR}                        { return symbol(sym.mayor_jingle); }
  {MAYORIGUAL}                   { return symbol(sym.mayor_igual_blinky); }
  {IGUAL}                        { return symbol(sym.igual_twinkle); }
  {DIFERENTE}                    { return symbol(sym.diferente_sparkle); }
  {AND}                          { return symbol(sym.and_melchor); }
  {OR}                           { return symbol(sym.or_gaspar); }
  {NOT}                          { return symbol(sym.not_baltasar); }
  {Parentesis1}                  { return symbol(sym.redondo_abre_cuento); }
  {Parentesis2}                  { return symbol(sym.redondo_cierra_cuento); }
  {Cuadrado1}                    { return symbol(sym.cuadrado_abre_empaque); }
  {Cuadrado2}                    { return symbol(sym.cuadrado_cierra_empaque); }
  {Llave1}                       { return symbol(sym.llave_abre_regalo); }
  {Llave2}                       { return symbol(sym.llave_cierra_regalo); }
  {Pipe}                         { return symbol(sym.fin_regalo); }
  {Separador}                    { return symbol(sym.separador_luces); }

  /* comments */
  {Comment}                      { /* ignore */ }
  
  /* whitespace */
  {WhiteSpace}                   { /* ignore */ }
}

<STRING> {
  \"                             { yybegin(YYINITIAL); 
                                    return symbol(sym.l_string_sinterklaas, 
                                    string.toString()); }
  [^\n\r\"\\]+                   { string.append( yytext() ); }
  \\t                            { string.append('\t'); }
  \\n                            { string.append('\n'); }

  \\r                            { string.append('\r'); }
  \\\"                           { string.append('\"'); }
  \\                             { string.append('\\'); }
}

/* error fallback */
[^]                              { return symbol(sym.err_malcriado, yytext()); }