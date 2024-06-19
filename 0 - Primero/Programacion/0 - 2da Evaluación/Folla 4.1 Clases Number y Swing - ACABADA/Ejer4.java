//4. Emprega a clase JOptionPane para ir pedindo unha letra por teclado (se son varias, 
//o programa collerá a primeira). Despois emprega os métodos da clase Character para formar
 //unha cadea de texto que indique se o carácter é ou non unha letra, se está en minúsculas
 // ou maiúsculas, e se é ou non un número.


import java.time.LocalDate;

import javax.swing.JOptionPane;

public class Ejer4 {
 
    public static void main(String[] args) {
        
        String respuesta;
        char respuestaChar;
        String cadena = "";
    
        
        respuesta = JOptionPane.showInputDialog("Dime unha letra");
        
        //Convierto la respuesta String en char para usar la clase Character
        respuestaChar = respuesta.charAt(0);
            //con esta función ya te coge el char de la posición 0, así ya controlas que solo coja la primera


        //Comprobación de si é un número
        if (Character.isDigit(respuestaChar) == true) {
            cadena = "É un número";
            
        }
   
        else{
            cadena = "Non é un número";
            
        }


        //comprobación de si es una letra
        if (Character.isLetter(respuestaChar) == true) {
            cadena = "És una letra ";
        }
        else{
            cadena = "No es una letra ";
            
        }




        //Comprobación si es mayúscula o minúscula
        if (Character.isUpperCase(respuestaChar) == true) {
            cadena = cadena + " Está en mayúscula";
        }

        else{
            cadena = cadena + " Está en minúscula";
        }


        JOptionPane.showMessageDialog(null, cadena);


    }
 }