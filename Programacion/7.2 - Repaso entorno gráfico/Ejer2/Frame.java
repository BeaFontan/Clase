/*Fai un programa que faga unha calculadora de 2 valores introducidos cada un na súa caixa de
texto (JTextField). A calculadora debe ter unha etiqueta na que se amose o resultado, e 4
botóns “Sumar”, “Restar”, “Multiplicar” e “Dividir”. Cada botón fará o que o seu nome indica
amosando o resultado na etiqueta Resultado. Engade un menú “Opcións” que teña os
seguintes submenús: “Sumar”, “Restar”, “Multiplicar”, “Dividir” e ”Limpar entradas”, que fagan
o que o seu nome indica*/

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import java.awt.event.*;

public class Frame extends JFrame{

private int numero1;
private int numero2;
int resultado;

JPanel panel = new JPanel();
JButton botonSumar = new JButton("Sumar");
JButton botonRestar = new JButton("Restar");
JButton botonMultiplicar = new JButton("Multiplicar");
JButton botonDividir = new JButton("Dividir");
JTextField textoNum1 = new JTextField("Introduce el primer número");
JTextField textoNum2 = new JTextField("Introduce el segundo número");
JLabel labelResultado = new JLabel("Resultado");

public Frame(){

    setSize(800,800);
    setTitle("Calculadora");

    definirColocarElementos();
    addEscoitadores();

}

public void definirColocarElementos(){
    
    getContentPane().add(panel);
    panel.setLayout(null); 

    textoNum1.setBounds(200, 20, 150, 30);
    textoNum2.setBounds(500, 20, 150, 30);
    botonSumar.setBounds(20, 100, 150, 50);
    botonRestar.setBounds(200, 100, 150, 50);
    botonMultiplicar.setBounds(380, 100, 150, 50);
    botonDividir.setBounds(560, 100, 150, 50);
    labelResultado.setBounds(350, 200, 100, 80);

    panel.add(textoNum1);
    panel.add(textoNum2);
    panel.add(botonSumar);
    panel.add(botonRestar);
    panel.add(botonMultiplicar);
    panel.add(botonDividir);
    panel.add(textoNum1);
    panel.add(textoNum2);
    panel.add(labelResultado);


}

public void addEscoitadores() {

    addWindowListener(new EscuchadorVentana());
    botonSumar.addActionListener(new AccionBoton());
    botonRestar.addActionListener(new AccionBoton());
    botonMultiplicar.addActionListener(new AccionBoton());
    botonDividir.addActionListener(new AccionBoton());

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
    }

    
}


public class AccionBoton implements ActionListener{

    @Override
    public void actionPerformed(ActionEvent e) {
        
        numero1 = Integer.parseInt(textoNum1.getText());
        numero2 = Integer.parseInt(textoNum2.getText());


        if (e.getSource() == botonSumar) {
            resultado = numero1 + numero2;

            labelResultado.setText("La suma es" + resultado);


        }
        else if (e.getSource() == botonRestar) {
            resultado = numero1 - numero2;

            labelResultado.setText("La resta es" + resultado);
        }
        else if (e.getSource() == botonMultiplicar) {
            resultado = numero1 * numero2;

            labelResultado.setText("La multiplicación es" + resultado);
        }
        else{
            resultado = numero1 / numero2;
            labelResultado.setText("La división es " + resultado);
        }


    }

}



public static void main(String[] args) {
    Frame frame = new Frame();
    frame.setVisible(true);
}


}