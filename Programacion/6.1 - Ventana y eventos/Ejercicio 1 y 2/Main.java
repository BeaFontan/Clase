import javax.swing.*;
import java.awt.event.*;


class Oframe extends JFrame{
    public Oframe(){

        setSize(400,300);

        addWindowListener(new OListener());

       setTitle("Título de la página");

    }


    class OListener extends WindowAdapter{

        int contador = 0;
        int modificada = 0;

                public void windowClosing(WindowEvent e){
                    System.out.println("SAIN. FINALIZANDO ");
                    System.exit(0);
                }

                //evento de minimizar, cada vez que se llame a este evento, se cuente y lo pnga en el setTitle
                public void windowIconified(WindowEvent m){

                contador++;
                String[] arrayStrings = new String[] {"unha", "duas", "tres", "catro", "cinco", "seis", "siete", "ocho", "nueve", "diez"};

            
                    setTitle("Modificada " + arrayStrings[contador-1] + " vez");
                
                }
                
    }
}



public class Main {
    public static void main (String[] args){

        Oframe meuframe = new Oframe();

        meuframe.setVisible(true);

        
    }
}