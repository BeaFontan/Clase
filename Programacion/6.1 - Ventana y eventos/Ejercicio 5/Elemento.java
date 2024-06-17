/*Fai un programa que nun frame mostre no título unha mensaxe cando se preme unha tecla co frame como ventá activa, 
e outro diferente cando o rato entra no espacio da ventá. A túas clases Listener deberán ser 
subclases de WindowAdapter, de KeyAdapter e de MouseAdapter.*/

import java.awt.event.*;
import javax.swing.*;


class Elemento extends JFrame{



    public Elemento(){

        setSize(300,250);
        setTitle("Hola que tal");
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

    }

    class EscuchadorRaton extends MouseAdapter{

        public void mouseEntered(MouseEvent e){
            setTitle("Ratón entrou na ventana");
        }

    }

}

