package Analizadores;
import java_cup.runtime.*;

%%

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
RESTA = \-
DIVISION = \/
MULTIPLICACION = \*
MODULO = \~
POTENCIA = \\

// Operadores arimeticos unarios
SUMASUMA = \+\+
RESTARESTA = \-\-

// Operadores relacionales
MENOR = \<
MENORIGUAL = \=\<
MAYOR = \>
MAYORIGUAL = \=\>
IGUAL = \=\=
DIFERENTE = \!\=

DIGITO = [0-9]


// Operadores logicos

AND = \^
OR = \#
NOT = \!


LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace     = {LineTerminator} | [ \t\f]


Comment = {CustomSingleLineComment} | {CustomMultiLineComment}

CustomSingleLineComment = "@"{InputCharacter}*
// CustomMultiLineComment = "/_"( [^_] | _ [^/] | / [^_] | _ / | _ _ [^/] | _ [^_])*"_/"

CustomMultiLineComment = "s"
Identifier = [:jletter:] [:jletterdigit:]*
Numero = 0 | -?[1-9]{DIGITO}*
FloatLiteral = -? (0 "." {DIGITO}+ | [1-9] {DIGITO}* "." {DIGITO}+)
CharLiteral = \' {InputCharacter} \'

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
<YYINITIAL> "boolean"            { return symbol(sym.bool_kringle, "boolean"); }
<YYINITIAL> "int"                { return symbol(sym.int_noel, "int"); }
<YYINITIAL> "float"              { return symbol(sym.float_nicolas, "float"); }
<YYINITIAL> "string"             { return symbol(sym.string_sinterklaas, "string"); }
<YYINITIAL> "struct"             { return symbol(sym.struct_colacho, "struct"); }
<YYINITIAL> "char"               { return symbol(sym.char_pascuero, "char"); }
<YYINITIAL> "null"               { return symbol(sym.null_joulupukki, "null"); }
<YYINITIAL> "if"                 { return symbol(sym.if_elfo, "if"); }
<YYINITIAL> "elif"               { return symbol(sym.elif_hada, "elif"); }
<YYINITIAL> "else"               { return symbol(sym.else_duende, "else"); }
<YYINITIAL> "for"                { return symbol(sym.for_envuelve, "for"); }
<YYINITIAL> "while"              { return symbol(sym.while_repite, "while"); }
<YYINITIAL> "do"                 { return symbol(sym.do_hace, "do"); }
<YYINITIAL> "case"               { return symbol(sym.case_estrella, "case"); }
<YYINITIAL> "switch"             { return symbol(sym.switch_gorro, "switch"); }
<YYINITIAL> "until"              { return symbol(sym.until_revisa, "until"); }
<YYINITIAL> "default"            { return symbol(sym.default_navidad, "default"); }
<YYINITIAL> "void"               { return symbol(sym.void_painatal, "void"); }
<YYINITIAL> "false"              { return symbol(sym.l_false_jesus, "false"); }
<YYINITIAL> "main"               { return symbol(sym.main_fiestas, "main"); }
<YYINITIAL> "true"               { return symbol(sym.l_true_olentzero, "true"); }
<YYINITIAL> "read"               { return symbol(sym.read_escucha, "read"); }
<YYINITIAL> "break"              { return symbol(sym.break_corta, "break"); }
<YYINITIAL> "print"              { return symbol(sym.print_narra, "print"); }
<YYINITIAL> "return"             { return symbol(sym.return_envia, "return"); }
<YYINITIAL> "in"                 { return symbol(sym.in_envuelto, "in"); }

<YYINITIAL> {
  {Comment}                      { /* ignore */ }
  {WhiteSpace}                   { /* ignore */ }

  /* identifiers */ 
  {Identifier}                   { return symbol(sym.identificador_persona, yytext()); }
  
  /* operators */
  {SUMA}                         { return symbol(sym.suma_rudolph, yytext()); }
  {RESTA}                        { return symbol(sym.resta_dasher, yytext()); }
  {DIVISION}                     { return symbol(sym.division_dancer, yytext()); }
  {MULTIPLICACION}               { return symbol(sym.multiplicacion_prancer, yytext()); }
  {MODULO}                       { return symbol(sym.modulo_vixen, yytext()); }
  {POTENCIA}                     { return symbol(sym.potencia_comet, yytext()); }
  {SUMASUMA}                     { return symbol(sym.aumentar_quien, yytext()); }
  {RESTARESTA}                   { return symbol(sym.disminuir_grinch, yytext()); }
  {MENOR}                        { return symbol(sym.menor_fizz, yytext()); }
  {MENORIGUAL}                   { return symbol(sym.menor_igual_mistle, yytext()); }
  {MAYOR}                        { return symbol(sym.mayor_jingle, yytext()); }
  {MAYORIGUAL}                   { return symbol(sym.mayor_igual_blinky, yytext()); }
  {IGUAL}                        { return symbol(sym.igual_twinkle, yytext()); }
  {DIFERENTE}                    { return symbol(sym.diferente_sparkle, yytext()); }
  {AND}                          { return symbol(sym.and_melchor, yytext()); }
  {OR}                           { return symbol(sym.or_gaspar, yytext()); }
  {NOT}                          { return symbol(sym.not_baltasar, yytext()); }
  {Parentesis1}                  { return symbol(sym.redondo_abre_cuento, yytext()); }
  {Parentesis2}                  { return symbol(sym.redondo_cierra_cuento, yytext()); }
  {Cuadrado1}                    { return symbol(sym.cuadrado_abre_empaque, yytext()); }
  {Cuadrado2}                    { return symbol(sym.cuadrado_cierra_empaque, yytext()); }
  {Llave1}                       { return symbol(sym.llave_abre_regalo, yytext()); }
  {Llave2}                       { return symbol(sym.llave_cierra_regalo, yytext()); }
  {Pipe}                         { return symbol(sym.fin_regalo, yytext()); }
  {Separador}                    { return symbol(sym.separador_luces, yytext()); }
  {Asignador}                    { return symbol(sym.asignar_entrega, yytext()); }

  /* comments */
  {Comment}                      { /* ignore */ }
  
  /* whitespace */
  {WhiteSpace}                   { /* ignore */ }

  {Numero}                       { return symbol(sym.l_int_noel, yytext()); }
  {FloatLiteral}                 { return symbol(sym.l_float_nicolas, yytext()); }
  {CharLiteral}                  { return symbol(sym.l_char_pascuero, yytext()); } 
}

<STRING> {
  \"                             { yybegin(YYINITIAL); return symbol(sym.l_string_sinterklaas, string.toString()); }
  [^\n\r\"\\]                    { string.append( yytext() ); }
  \\t                            { string.append("\t"); }
  \\n                            { string.append("\n"); }
  \\r                            { string.append("\r"); }
  \\\"                           { string.append("\""); }
  \\                             { string.append("\\"); }
}

// error fallback
[^]                              { return symbol(sym.err_malcriado, yytext()); }