/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Generadores;

import jflex.exceptions.SilentExit;

/**
 *
 * @author anon
 */
public class GeneradorLexer {
    
    public static void main(String[] args) 
    {
        String path="src/main/java/Analizadores/lexer.jflex";
        generarLexer(path);
    } 
    
    public static void generarLexer(String path)
    {
        String[] pathArr = {path};
        try {
            jflex.Main.generate(pathArr);
        } catch (SilentExit ex) {
            System.out.println(ex);
        }
        
    } 
}

