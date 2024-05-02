//5. Empregando os métodos da clase anterior, pide co JOptionPane un usuario e contrasinal,
// simulando oacceso a un contido. Este contrasinal só será válido se ten unha letra maiúscula, un díxito e un cáracter
//que non é nin díxito nin letra, pedíndoo de novo ata que sexa válido co JOptio

import javax.swing.JOptionPane;

public class Ejer5 {

    public static void main(String[] args) {
        
        String respuestaUsuario;
        String respuestaPass;
        char charPass;
        boolean passCorrecta = true;
        boolean existeNumero = false;
        boolean existeMinuscula = false;
        boolean existeCaracter = false;
 
        
        respuestaUsuario = JOptionPane.showInputDialog("Usuario");
        respuestaPass = JOptionPane.showInputDialog("Contrasinal");

        while (!respuestaUsuario.equals("blanco")) {
            
            for (int i = 0; i < respuestaPass.length(); i++) {
                charPass = respuestaPass.charAt(i);
    
                if (Character.isDigit(charPass) == true ) {
                    existeNumero = true;
                }

                if (Character.isLowerCase(charPass) == true) {
                    existeMinuscula = true;
                }

                if (!Character.isLetterOrDigit(charPass) == true) {
                    existeCaracter = true;
                }
    
            }
    
            if (existeNumero == true && existeMinuscula == true && existeCaracter == true) {
                JOptionPane.showMessageDialog(null, "Contrasinal correcto");
                break;
            }
    
            else{
                respuestaPass = JOptionPane.showInputDialog("Contrasinal non valido, introduce outro con numeros, caracter e letras");
            
            } 
        }
        







    }
}