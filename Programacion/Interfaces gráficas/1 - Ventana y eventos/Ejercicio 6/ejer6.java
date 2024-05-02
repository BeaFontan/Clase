/*Modifica o exercicio anterior para que a mensaxe sexa distinta cando se mantén pulsada e cando se libere a tecla.*/

import java.awt.event.*;
import javax.swing.*;


class Elemento extends JFrame{


    public Elemento(){

        setSize(300,250);
        setTitle("Holi");
        addWindowListener(new Escuchador());
        addKeyListener(new EscuchadorTecla());
        addMouseListener(new EscuchadorRaton());

    }


    class Escuchador extends WindowAdapter{

        public void windowClosing(WindowEvent e){
            setTitle("Saíz, finalizando");
            System.exit(0);
        }

    }

    class EscuchadorTecla extends KeyAdapter{

        public void keyPressed(KeyEvent e){
            setTitle("Tecla tocada " + e.getKeyChar());
        }

        public void keyReleased(KeyEvent e) {
            setTitle("Tecla soltada " + e.getKeyChar());
        }


    }

    class EscuchadorRaton extends MouseAdapter{

        public void mouseEntered(MouseEvent e){
            setTitle("Ratón entrou na ventana");
        }

    }

}


public class ejer6 {


    public static void main (String[] args){

        Elemento ele1 = new Elemento();

        ele1.setVisible(true);


    }
    

}



