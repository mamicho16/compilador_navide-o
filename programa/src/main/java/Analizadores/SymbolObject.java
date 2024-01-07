/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Analizadores;

/**
 *
 * @author mamic
 */
public class SymbolObject {
    private String tipoEntrada;
    private String tipoDato; 
    private String nombre;

    public SymbolObject(String tipoEntrada, String tipoDato, String nombre) {
        this.tipoEntrada = tipoEntrada;
        this.tipoDato = tipoDato;
        this.nombre = nombre;
    }
    
    public String getTipoEntrada() {
        return tipoEntrada;
    }

    public String getTipoDato() {
        return tipoDato;
    }

    public String getNombre() {
        return nombre;
    }

    @Override
    public String toString() {
        return tipoEntrada + "\t" + tipoDato + "\t" + nombre;
    }
    
    
}
