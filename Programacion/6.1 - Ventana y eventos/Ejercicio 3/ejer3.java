import javax.swing.JFrame;
import java.awt.event.*;

class Elemento extends JFrame {
    public int width = 300;
    public int height = 250;
    public int incremento = 50;


    public Elemento() {
        setSize(width, height);
        setTitle("Tamaño modificable");
        addWindowListener(new ListenerMio());
    }

    class ListenerMio implements WindowListener {
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
           
            setSize(width+=incremento, height+=incremento);
            setTitle("Tamaño modificable");
            
            if (width == 700 && height == 650) {
                setTitle("No es posible modificar el tamaño");
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e1) {
                    e1.printStackTrace();
                }
                System.exit(0);
                
            }
        }

        @Override
        public void windowDeactivated(WindowEvent e) {}
    }
}

public class ejer3 {
    public static void main(String[] args) {
        Elemento ele1 = new Elemento();
        ele1.setVisible(true);

        Elemento ele2 = new Elemento();
        ele2.setVisible(true);
    }
}
