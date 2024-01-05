/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Programa;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author anon
 */
public class HTMLTable {
    
    public String createTable(ArrayList<String[]> rows) {
        StringBuilder HTMLTable = new StringBuilder();
        
        HTMLTable.append("<html><body><table border='1'>");
        
        HTMLTable.append("<tr><th>Token</th><th>Lexema</th><th>Codigo Token</th><th>Linea</th><th>Columna</th></tr>");
        
        for (String[] row: rows) {
            HTMLTable.append("<tr>");
            for (String cell: row) {
                HTMLTable.append("<td>").append(cell).append("</td>");
            }
            HTMLTable.append("</tr>");
        }
        
        HTMLTable.append("</table></body></html>");
        
        return HTMLTable.toString();
    }
    
    public String createTableSimbols(ArrayList<String[]> rows) {
        StringBuilder HTMLTable = new StringBuilder();
        
        HTMLTable.append("<html><body><table border='1'>");
        
        // Updated header with new column names
        HTMLTable.append("<tr><th>Tabla</th><th>Tipo Entrada</th><th>Tipo Dato</th><th>Nombre</th></tr>");
        
        for (String[] row: rows) {
            HTMLTable.append("<tr>");
            for (String cell: row) {
                HTMLTable.append("<td>").append(cell).append("</td>");
            }
            HTMLTable.append("</tr>");
        }
        
        HTMLTable.append("</table></body></html>");
        
        return HTMLTable.toString();
    }
    
    public void createHTMLFile(String HTMLTable, String filePath) {
        
        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            writer.write(HTMLTable);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
