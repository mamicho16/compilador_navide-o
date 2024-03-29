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

    public int getLine(){
        return yyline;
    }

    public int getColumn(){
        return yycolumn;
    }
%}
    
// Expresiones Regulares

// Operadores aritmeticos binarios
SUMA = \+
RESTA = \-
DIVISION = \/
MULTIPLICACION = \*
MODULO = \~
POTENCIA = \*\*

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


LineTerminator = [\n\r\u2028\u2029]
InputCharacter = [^{LineTerminator}]
WhiteSpace     = {LineTerminator} | [ \t\f]


Comment = {CustomMultiLineComment} | {CustomSingleLineComment} | {DocComment}
CustomMultiLineComment = "/\_" [^\_] ~"\_/" | "/\_" "\_"+ "/"
CustomSingleLineComment = "@"{InputCharacter}*
DocComment = "/\_\_" {Content} "\_"+ "/"
Content = ([^\_] | \_+ [^/\_])*

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
<YYINITIAL> "function"           { return symbol(sym.function_regalo, "function"); }
<YYINITIAL> "local"              { return symbol(sym.local_arbol, "local"); }
<YYINITIAL> "boolean"            { return symbol(sym.bool_kringle, "boolean"); }
<YYINITIAL> "int"                { return symbol(sym.int_noel, "int"); }
<YYINITIAL> "float"              { return symbol(sym.float_nicolas, "float"); }
<YYINITIAL> "string"             { return symbol(sym.string_sinterklaas, "string"); }
<YYINITIAL> "char"               { return symbol(sym.char_pascuero, "char"); }
<YYINITIAL> "if"                 { return symbol(sym.if_elfo, "if"); }
<YYINITIAL> "elif"               { return symbol(sym.elif_hada, "elif"); }
<YYINITIAL> "else"               { return symbol(sym.else_duende, "else"); }
<YYINITIAL> "for"                { return symbol(sym.for_envuelve, "for"); }
<YYINITIAL> "do"                 { return symbol(sym.do_hace, "do"); }
<YYINITIAL> "until"              { return symbol(sym.until_revisa, "until"); }
<YYINITIAL> "false"              { return symbol(sym.l_false_jesus, "false"); }
<YYINITIAL> "main"               { return symbol(sym.main_fiestas, "main"); }
<YYINITIAL> "true"               { return symbol(sym.l_true_olentzero, "true"); }
<YYINITIAL> "read"               { return symbol(sym.read_escucha, "read"); }
<YYINITIAL> "break"              { return symbol(sym.break_corta, "break"); }
<YYINITIAL> "print"              { return symbol(sym.print_narra, "print"); }
<YYINITIAL> "return"             { return symbol(sym.return_envia, "return"); }

<YYINITIAL> {
   \" { string.setLength(0); yybegin(STRING); }
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