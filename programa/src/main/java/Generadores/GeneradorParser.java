/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Generadores;

/**
 *
 * @author anon
 */
public class GeneradorParser {
    
   public static void main(String[] args)
    {
        String opciones[] = new String[5]; 
        
        //Seleccionamos la opción de dirección de destino
        opciones[0] = "-destdir";
        
        //Le damos la dirección, carpeta donde se va a generar el parser.java & el simbolosxxx.java
        opciones[1] = "src/main/java/Analizadores";
       
        //Seleccionamos la opcion de clase parser
        opciones[2] = "-parser";         
        
        //Le damos nombre a esa clase del paso anterior
        opciones[3] = "Parser"; 
        
        //Le decimos donde se encuentra el archivo .cup 
        opciones[4] = "src/main/java/Analizadores/parser.cup"; 
        
        try 
        {
            java_cup.Main.main(opciones);
        } 
        catch (Exception ex)
        {
            System.out.print(ex);
        }
    }
}

