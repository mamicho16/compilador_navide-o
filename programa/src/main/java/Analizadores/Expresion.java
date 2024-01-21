/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Analizadores;

/**
 *
 * @author mamic
 */

enum ExpType{
    STRING, INT, FLOAT, BOOL, CHAR, CHARLIST, INTLIST, ERROR;

}

public class Expresion {
    private Object valor;
    private ExpType tipo;
    //private String dir;

    public Expresion(Object valor, ExpType tipo) {
        this.valor = valor;
        this.tipo = tipo;
    }

    // public Expresion(Object valor, ExpType tipo, String dir) {
    //     this.valor = valor;
    //     this.tipo = tipo;
    //     this.dir = dir;
    // }

    // public String getDir() {
    //     return dir;
    // }

    public Object getValor() {
        return valor;
    }

    public ExpType getTipo() {
        return tipo;
    }

    // public void setDir(String dir) {
    //     this.dir = dir;
    // }

    public void setValor(Object valor) {
        this.valor = valor;
    }

    public void setTipo(ExpType tipo) {
        this.tipo = tipo;
    }

    public static ExpType ExpType(String tipo){
        switch(tipo){
            case "int":
                return ExpType.INT;
            case "float":
                return ExpType.FLOAT;
            case "string":
                return ExpType.STRING;
            case "bool":
                return ExpType.BOOL;
            case "char":
                return ExpType.CHAR;
            case "charlist":
                return ExpType.CHARLIST;
            case "intlist":
                return ExpType.INTLIST;
            default:
                return ExpType.ERROR;
        }
    }

    public static ExpType array1(ExpType tipo){
        switch(tipo){
            case INT:
                return ExpType.INTLIST;
            case CHAR:
                return ExpType.CHARLIST;
            default:
                return ExpType.ERROR;
        }
    }

    public static ExpType array2(ExpType tipo){
        switch(tipo){
            case INTLIST:
                return ExpType.INT;
            case CHARLIST:
                return ExpType.CHAR;
            default:
                return ExpType.ERROR;
        }
    }
}
