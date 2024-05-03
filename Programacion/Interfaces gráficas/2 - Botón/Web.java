//Fai un programa con unha ventá na que se mostran 2 botóns, un que poña “Pechar” e outro “Minimízame”. Cando se pulse “Pechar” a ventá debe pecharse.
//Cando “Minimízame” debe minimizarse. (Mira a axuda do método setExtendedState() de JFrame, herdado de Frame)

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import java.awt.event.*;


public class Web extends JFrame{
        


    //Elementos que va a tener la página, un panel y 2 botones
    JButton oboton=new JButton("Pechar");    	
    JButton oboton2=new JButton("Minimízame");
    JPanel opanel=new JPanel(); //Defino como un panel "invisible para colocar las cosas, pero no es la ventana ojo, por eso luego le digo directamente setsize"     
        
    
    /** CONSTRUCTOR DE TODA LA PÁGINA WEB CON LOS OBJETOS*/
    public Web() {
        setSize(700,600);//le doy el ancho y el alto la web
        setTitle("Minimizar y cerrar");//le doy el titulo la web

        defineCaracteristicasObxectos();
        colocaObxectos();
        addEscoitadoresObxectos();      
    }
    

    //función para definir las características de los objetos
    public void defineCaracteristicasObxectos(){

        oboton.setBounds(50,40,160,50);  	// pos X, pos Y, ANCHO E ALTO.

        oboton2.setBounds(50,100,160,50); 

        opanel.setLayout(null); // NECESARIO PARA QUE OS OBXECTOS NON SE MOVAN CANDO OS COLOQUEMOS
    }
    

    //Función para colocar los objetos
    public void colocaObxectos( ) { 

        opanel.add(oboton);
        opanel.add(oboton2);
        
        getContentPane().add(opanel); // FACEMOS QUE O PANEL DO FRAME SEXA O PANEL QUE DEFINIMOS NOS.
    }
    


    //Función para ligar los objetos a los escuchadores
    public void addEscoitadoresObxectos( ) {

        addWindowListener(new VentaListener( ) );

        //le añadimos los escuchadores que hemos definido para los botones
        oboton.addActionListener(new BotonListener( ) );
        oboton2.addActionListener(new BotonListener2());

    }
    

    // DEFINIMOS LOS EVENTOS QUE VAN A TENER LOS ELEMENTOS
    private class VentaListener extends WindowAdapter{
        public void windowClosing(WindowEvent e) {
            System.exit(0);//paramos el programa cuando se cierra la página
        }
    }

    //listener del botón 1 "Pechar"
    private class BotonListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {

          

        }

    }

    //listener del botón 2 "Minimizar"
    private class BotonListener2 implements ActionListener {
        public void actionPerformed(ActionEvent e) {

            setExtendedState(1);  
           
        }

    }


    //Main

    public static void main(String[] args) {

        //creamos el objeto Web, y lo mostramos.

        Web web=new Web();
   
        web.setVisible(true); 
        
    }

}
    
