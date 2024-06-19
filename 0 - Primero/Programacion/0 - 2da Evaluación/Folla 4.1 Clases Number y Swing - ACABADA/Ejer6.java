//6. Fai un programa que faga repetidamente conversións de euros a dólares ou viceversa, empregando
//JoptionPane. O valor numérico do resultado deberá ter sempre un ancho de 7 en total, con 2 decimais.
//O programa deberá preguntar que tipo de cambio quere facer, de cada vez, ou se quere saír do
//programa: mostra un menú con varias liñas empregando “\n” en linux (ou “\r\n” en Windows).
//Tamén podes empregar “%n” se empregas o método da clase String.format()

import java.util.Locale;

import javax.swing.JOptionPane;

public class Ejer6 {
    public static void main(String[] args) {
        
        double euros;
        double dolares;
        double totalEuros;
        double totalDolares;
        String menu = "Pulsa A para pasar a euros \n Pulsa B se queres pasar a dolares \n Pulsa C para sair";

        String respuesta;

        respuesta = JOptionPane.showInputDialog(menu);

        while (!respuesta.equals("C")) {
            
            switch (respuesta) {
                case "A":
                                
                    respuesta = JOptionPane.showInputDialog("Dime o importe en dolares");

                    dolares = Double.parseDouble(respuesta);

                    totalEuros = dolares * 1.09;

                    String resultadoEurosString = Double.toString(totalEuros);

                    resultadoEurosString = String.format( Locale.FRANCE, "O importe en euros é: %.2f%n", totalEuros);
            

                    JOptionPane.showMessageDialog(null, resultadoEurosString);
                    
                    break;

                case "B":

                    respuesta = JOptionPane.showInputDialog("Dime o importe en euros");

                    euros = Double.parseDouble(respuesta);

                    totalDolares = euros * 0.92;

                    String resultadoDolaresString = Double.toString(totalDolares);

                    resultadoDolaresString = String.format( Locale.FRANCE, "O importe en euros é: %.2f%n", totalDolares);
            

                    JOptionPane.showMessageDialog(null, resultadoDolaresString);
                    
                    break;

            }

            respuesta = JOptionPane.showInputDialog(menu);

        }
    }
}