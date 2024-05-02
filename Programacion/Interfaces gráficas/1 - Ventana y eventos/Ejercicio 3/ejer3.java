
/*Fai un programa que abra 2 JFrames de 300 x 250, de título “Tamaño modificable”. A túa clase deberá implementar a interface WindowListener.
 Os 2 frames deberán modificar o seu tamaño cada vez que son activadas, incrementando en 50 pixels tanto o alto como o ancho. O tamaño máximo 
 será 700 x 650. Cando se chegue ao tamaño máximo non modificarán máis o tamaño, mostrando no seu título unha mensaxe de que xa non o modifican.*/

import javax.swing.JFrame;
import java.awt.event.*;

class Elemento extends JFrame{

    public int width = 300;
    public int height = 250; 



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
        
            if (width > 700 || height > 650) {
                
                setTitle("No es posible modificar el tamaño");

                System.exit(0);
            }
            else{
                width = width +50;

                height = height +50;

                setSize(width,height);

            }

        }

        @Override
        public void windowDeactivated(WindowEvent e) {}

                
    }
}



public class ejer3 {


    public static void main (String[] args){

        Elemento ele1 = new Elemento();

        ele1.setVisible(true);

        
        Elemento ele2 = new Elemento();
   
        ele2.setVisible(true);


        
    }
    
    
}