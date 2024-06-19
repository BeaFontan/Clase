/*1. Fai un programa que inicie un Jframe de 400x400, que permita modificar o seu tamaño cando
a ventá estea activa: 
• a tecla ‘+’ agrandará o tamaño da ventá en 100 pixels para o ancho e o alto. 
• A tecla ´-’ reducirá o tamaño da ventá en 100 píxels tanto o ancho como o alto.
A ventá terá un menú de nome “Opcións”, con 2 submenús: Bloqueada, Desbloqueada. Cando
se preme o submenú Bloqueada cambiará o nome da ventá a “Tamaño bloqueado” e o tamaño
da ventá non poderá cambiar. Para volver a activar o funcionamento das teclas ‘+’ e ‘-’
deberemos seleccionar o submenú “Desbloqueada”, que permitirá a xestión de eventos das
teclas ‘+’ e ‘-’ e cambiará o título da ventá a “Tamaño desbloqueado”.
Cada vez que se seleccione un submenú, deberá quedar deshabilitado: emprega o método
setEnabled( ) para ese submenú, e o outro submenú quedará habilitado.*/

import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import java.awt.event.*;

public class ejer1 extends JFrame{

    int width = 400;
    int height = 400; 
    boolean activada = false;
    int aumento = 100;


    JMenuBar barraMenus = new JMenuBar();
    JMenu menu1 = new JMenu("Opciones");
    JMenuItem item1 = new JMenuItem("Bloqueada");
    JMenuItem item2 = new JMenuItem("Desbloqueada");


    public ejer1 (){

        addEscoitadoresObxectos();

        setSize(width,height);
        menu1.add(item1);
        menu1.add(item2);
        barraMenus.add(menu1);
        setJMenuBar(barraMenus);

    }



    public class EscuchadorVentana implements WindowListener {

        @Override
        public void windowOpened(WindowEvent e) {
            // TODO Auto-generated method stub
            throw new UnsupportedOperationException("Unimplemented method 'windowOpened'");
        }

        @Override
        public void windowClosing(WindowEvent e) {
           System.exit(0);
        }

        @Override
        public void windowClosed(WindowEvent e) {
            // TODO Auto-generated method stub
            throw new UnsupportedOperationException("Unimplemented method 'windowClosed'");
        }

        @Override
        public void windowIconified(WindowEvent e) {
            // TODO Auto-generated method stub
            throw new UnsupportedOperationException("Unimplemented method 'windowIconified'");
        }

        @Override
        public void windowDeiconified(WindowEvent e) {
            // TODO Auto-generated method stub
            throw new UnsupportedOperationException("Unimplemented method 'windowDeiconified'");
        }

        @Override
        public void windowActivated(WindowEvent e) {
          
           activada = true;


        }

        @Override
        public void windowDeactivated(WindowEvent e) {
            // TODO Auto-generated method stub
            throw new UnsupportedOperationException("Unimplemented method 'windowDeactivated'");
        }

    }

    
    public class EscuchadorTecla extends KeyAdapter {

        @Override
        public void keyPressed(KeyEvent e) {
            if (activada == true && e.getKeyChar() == '+' ) {

                setSize(width+=aumento, height+=aumento);
            
            }

            if (activada == true && e.getKeyChar() == '-' ) {

                setSize(width-=aumento, height-=aumento);
        
            }
        }

        
    }

    public class ActionMenu implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
           
            if (e.getSource() == item1) {
                setTitle("Tamaño bloqueado");
                activada=false;
                item1.setEnabled(true);
            }
            else if (e.getSource() == item2) {
                setTitle("Tamaño desbloqueado");
                activada=true;
                item2.setEnabled(true);
            }

        }
    
        
    }
        
    private void addEscoitadoresObxectos() {
  
        addKeyListener(new EscuchadorTecla());
        addWindowListener(new EscuchadorVentana());
        item1.addActionListener(new ActionMenu());
        item2.addActionListener(new ActionMenu());


    }


public static void main(String[] args) {
    
    ejer1 ele1 = new ejer1();
    ele1.setVisible(true);


}




}