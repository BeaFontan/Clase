/*Como ves non é preciso que o rato estea dentro da ventá para que se executen os eventos de teclado. Fai un programa 
que para un frame altere o seu tamaño cando se pulse unha tecla, cambiando o tamaño entre 300 x 200 e 500 x 300, só cando 
o rato estea dentro da ventá. Podes empregar un atributo booleano “ratoDentro” que vale true ou false dependendo se o rato está dentro da ventá,
 empregando ese valor no Listener do evento das teclas.*/

 import java.awt.event.*;
 import javax.swing.*;


class Elemento extends JFrame{

    boolean ratoDentro = false;

    public Elemento(){

        setSize(300,200);
        setTitle("Holi");
        addMouseListener(new EscuchadorRaton());
        addKeyListener(new EscuchadorTeclado());

    }



    class EscuchadorRaton extends MouseAdapter{

        public void mouseEntered(MouseEvent e){
            ratoDentro = true;

        }

        @Override
        public void mouseExited(MouseEvent e) {
            ratoDentro = false;
            setSize(300,200);
        }

        
    }

    class EscuchadorTeclado extends KeyAdapter{

        @Override
        public void keyPressed(KeyEvent e) {
            if (ratoDentro == true) {
                setSize(500, 300);
                
            }
        }
   
    }

}



public class Ejer7{


    public static void main (String[] args){

        Elemento ele1 = new Elemento();

        ele1.setVisible(true);


    }
    

}



    
