/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Analizadores;

/**
 *
 * @author mamic
 */
public class Funcion {
    private String nombre;
    private ExpType retorno;
    private boolean retornaAlgo;
    private ExpType[] parametros;

    public Funcion(String nombre, ExpType retorno, boolean retornaAlgo, ExpType[] parametros) {
        this.nombre = nombre;
        this.retorno = retorno;
        this.retornaAlgo = retornaAlgo;
        this.parametros = parametros;
    }

    public String getNombre() {
        return nombre;
    }

    public ExpType getRetorno() {
        return retorno;
    }

    public boolean isRetornaAlgo() {
        return retornaAlgo;
    }

    public ExpType[] getParametros() {
        return parametros;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setRetorno(ExpType retorno) {
        this.retorno = retorno;
    }

    public void setRetornaAlgo(boolean retornaAlgo) {
        this.retornaAlgo = retornaAlgo;
    }

    public void setParametros(ExpType[] parametros) {
        this.parametros = parametros;
    }

    public void anadirParam(ExpType tipo){
        ExpType[] temp = new ExpType[parametros.length + 1];
        for(int i = 0; i < parametros.length; i++){
            temp[i] = parametros[i];
        }
        temp[parametros.length] = tipo;
        parametros = temp;
    }
}
