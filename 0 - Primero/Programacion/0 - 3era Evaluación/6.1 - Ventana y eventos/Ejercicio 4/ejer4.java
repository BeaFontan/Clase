/*Modifica o exercicio anterior para que as ventás modifiquen o tamaño cada dúas veces que son activadas. Cando cheguen a 700 x 650, reduciran o tamaño en 50 pixels tanto para 
o ancho como para o alto, Só ata o seu tamaño orixinal de 300 x 250. Despois deberán volver incrementar o seu tamaño, tamén cada dúas veces.*/

import javax.swing.JFrame;
import java.awt.event.*;

class Elemento extends JFrame{

    public int width = 300;
    public int height = 250; 
    public boolean crecer = true;
    public int contador = 0;


    public Elemento(){

        setSize(width,height);
        setTitle("Tamaño modificable");


        addWindowListener(new ListenerMio());


    }

    class ListenerMio implements WindowListener{

        @Override
        public void windowOpened(WindowEvent e) {}

        @Override
        public void windowClosing(WindowEvent e) {}

        @Override
        public void windowClosed(WindowEvent e) {}

        @Override
        public void windowIconified(WindowEvent e) {}

        @Override
        public void windowDeiconified(WindowEvent e) {}

        @Override
        public void windowActivated(WindowEvent e) {
        
            contador++;

            if (contador % 2 == 0) {
                if (crecer == true) {
              
                    width = width +50;
    
                    height = height +50;
    
                    setSize(width,height);
    
                    if (width == 700 || height == 650) {
                        crecer = false;
                    }
    
                }
            
                else {
    
                    width = width -50;
    
                    height = height -50;
    
                    setSize(width,height);
    
                }
            }


        }

        @Override
        public void windowDeactivated(WindowEvent e) {}

                
    }
}


public class ejer4 {


    public static void main (String[] args){

        Elemento ele1 = new Elemento();

        ele1.setVisible(true);

        
        Elemento ele2 = new Elemento();
   
        ele2.setVisible(true);

        
    }
    

}