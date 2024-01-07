/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Programa;

import Analizadores.Lexer;
import Analizadores.Parser;
import Analizadores.sym;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java_cup.runtime.Symbol;

/**
 *
 * @author anon
 */
public class App {
    
    public static void main(String[] args) {
        // Rutas de los archivos a leer y crear
        String fileName = "src/main/java/Programa/test.txt";
        String outputFile = "src/main/java/Programa/resultados.html";
    
        System.out.println("Leyendo archivo: " + fileName);
        
        // Variable para almacenar los resultados de los tokens
        ArrayList<String[]> results = new ArrayList<>();
        
        try (BufferedReader reader = new BufferedReader(new FileReader(fileName))) {
            Lexer lex = new Lexer(reader);
            
            int i = 0;
            Symbol token;
            
            while (true) {
                try {
                    token = lex.next_token();
                    // Si el token simbolo es diferente a 0 (aun no ha terminado de leer) y si es invalido
                    if (token.sym != 0 && token.sym == sym.err_malcriado) {
                        System.err.println("En la linea " + token.left + ", columna " + token.right + " el token: " + token.value + " es invalido.");
                    // Si no ha terminado de leer crea las filas para la tabla
                    } else if (token.sym != 0) {
                        String[] row = new String[5];
                        row[0] = sym.terminalNames[token.sym];
                        row[1] = token.value.toString();
                        row[2] = Integer.toString(token.sym);
                        row[3] = Integer.toString(token.left);
                        row[4] = Integer.toString(token.right);
                        results.add(row);
                    // Se termina de leer y muestra en consola los lexemas encontrados
                    } else {
                        System.out.println("Cantidad de lexemas encontrados: " +i);
                        break;
                    }
                } catch (Exception e) {
                    System.err.println(e.getMessage());
                    break;
                }
                i++;
            }
            
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        // Instancia la clase para crear la tabla HTML 
        HTMLTable tableGenerator = new HTMLTable();
        // Crea la tabla con los resultos
        String table = tableGenerator.createTable(results);
        // Escribe el archivo HTML con los resultados guardados
        tableGenerator.createHTMLFile(table, outputFile);
        System.out.println("Tabla HTML con resultados guardada en: " + outputFile);
        
        
        System.out.println("Leyendo archivo de sintaxis: " + fileName);
        try (BufferedReader reader = new BufferedReader(new FileReader(fileName))) {
            Lexer lexer = new Lexer(reader);
            Parser parsing = new Parser(lexer);
            parsing.parse();
            // Si no hay error, fue exitoso el analisis
            System.out.println("Archivo analizado y creado exitosamente.");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error al analizar el archivo. No se puede generar por gramatica.");
        }
    }
   
}
