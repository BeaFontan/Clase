import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import java.awt.event.*;

public class Frame2 extends JFrame{

    Boolean activo = false;
    public static final double PI = 3.1416;

    JPanel panel = new JPanel();
    JTextField textoRadio = new JTextField("Introduce radio");
    JTextField textoAltura = new JTextField("Introduce altura");
    JButton boton = new JButton("Calcular");
    JLabel labelVolume = new JLabel("Volume");
    JLabel labelSuperficie = new JLabel("Superficie");

    JMenuBar barraMenu = new JMenuBar();
    JMenu menuOpciones = new JMenu("Opciones");
    JMenuItem limpiarItem = new JMenuItem("Limpar campos");


    public Frame2(){
        setSize(800,800);
        setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
        setTitle("CAlcular volumen");
        colocarElementos();
        addListeners();


    }

    private void colocarElementos() {
   
        getContentPane().add(panel);
        panel.setLayout(null);

        textoRadio.setBounds(20, 10, 100, 30);
        textoAltura.setBounds(20, 50, 100, 30);
        boton.setBounds(20, 90, 200, 100);
        labelSuperficie.setBounds(20, 150, 500, 100);
        labelVolume.setBounds(20, 250, 500, 100);

        panel.add(textoRadio);
        panel.add(textoAltura);
        panel.add(boton);
        panel.add(labelSuperficie);
        panel.add(labelVolume);

        barraMenu.add(menuOpciones);
        menuOpciones.add(limpiarItem);
        setJMenuBar(barraMenu);


        
    }

    private void addListeners() {

        addWindowListener(new EscuchadorVentana());
        boton.addActionListener(new Acciones());
        limpiarItem.addActionListener(new Acciones());


    }
  
    public class EscuchadorVentana implements WindowListener{

        @Override
        public void windowOpened(WindowEvent e) {
            // TODO Auto-generated method stub
            throw new UnsupportedOperationException("Unimplemented method 'windowOpened'");
        }

        @Override
        public void windowClosing(WindowEvent e) {
            
            int respuesta = JOptionPane.showConfirmDialog(null, "quieres cerrar la aplicación", "confirmación", JOptionPane.YES_NO_OPTION);

            if(respuesta == JOptionPane.YES_OPTION){
                System.exit(0);
            }
          
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
            activo = true;
        }

        @Override
        public void windowDeactivated(WindowEvent e) {
            // TODO Auto-generated method stub
            throw new UnsupportedOperationException("Unimplemented method 'windowDeactivated'");
        }




    }


    public class Acciones implements ActionListener{

        @Override
        public void actionPerformed(ActionEvent e) {
        
            if(e.getSource() == limpiarItem){
                textoRadio.setText("");
                textoAltura.setText("");
                labelVolume.setText("");
                labelSuperficie.setText("");
            }

            if(e.getSource() == boton){}

            double volume = Double.parseDouble(textoAltura.getText())*Double.parseDouble(textoRadio.getText())*Double.parseDouble(textoRadio.getText())*PI;
            labelVolume.setText("El volumen es " + volume);

            double superficie = Double.parseDouble(textoAltura.getText())*Double.parseDouble(textoRadio.getText())*2*PI*Double.parseDouble(textoRadio.getText())*Double.parseDouble(textoRadio.getText());
            labelSuperficie.setText("La superficie es " + superficie);

        }}

    public static void main(String[] args) {
        Frame2 frame = new Frame2();
        frame.setVisible(true);
    }
    


}

