import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextField;

import java.awt.event.*;
import java.util.ArrayList;

public class Frame extends JFrame{

ArrayList<Usuario> arrayUsuarios = new ArrayList<Usuario>();

JPanel panel = new JPanel();
JButton boton = new JButton("Novo Usuario");
JTextField textoEmail = new JTextField("Email");
JTextField textoPass = new JTextField("Contrasinal");
JButton botonUsuarios = new JButton("Mostrar usuarios");

public Frame(){

    setSize(800,800);
    setTitle("Usuarios");

    colocarElementos();
    addEscoitadores();

}

private void colocarElementos() {
    getContentPane().add(panel);
    panel.setLayout(null);


    textoEmail.setBounds(20, 20, 200, 30);
    textoPass.setBounds(20, 70, 200, 30);
    boton.setBounds(20, 130, 200, 70);
    botonUsuarios.setBounds(20, 220, 200, 70);

    panel.add(boton);
    panel.add(textoEmail);
    panel.add(textoPass);
    panel.add(botonUsuarios);


}

private void addEscoitadores() {
    addWindowListener(new EscuchadorVentana());

}

public class EscuchadorVentana implements WindowListener{

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
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'windowActivated'");
    }

    @Override
    public void windowDeactivated(WindowEvent e) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'windowDeactivated'");
    }}


public class AccionesComponentes implements ActionListener{

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == botonUsuarios) {

            

        }
    }}

 

public static void main(String[] args) {
    Frame frame = new Frame();
    frame.setVisible(true);
}


}