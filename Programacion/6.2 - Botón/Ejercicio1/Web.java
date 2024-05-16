package Ejercicio1;

/*Fai un programa con 2 botóns: un “Medra” e outro “Reduce” que aumenten o tamaño da ventá en 50 x 50 pixels,
 ou a reduza na mesma variación.*/

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;import java.awt.event.*;


    public class Web extends JFrame{
        
        //elementos de panel que necesito para hacerlos crecer
        int ancho = 800;
        int largo = 600;

        //Elementos que va a tener la página, un panel y 2 botones
        JButton oboton=new JButton("Aumentar");    	
        JButton oboton2=new JButton("Disminuir");
        JPanel opanel=new JPanel(); //Defino como un panel "invisible para colocar las cosas, pero no es la ventana ojo, por eso luego le digo directamente setsize"     
        	
        
        /** CONSTRUCTOR DE TODA LA PÁGINA WEB CON LOS OBJETOS*/
        public Web() {
            setSize(ancho,largo);//le doy el ancho y el alto la web
            setTitle("Aumentar tamaño premendo nos botóns");//le doy el titulo la web

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

        private class BotonListener implements ActionListener {
            public void actionPerformed(ActionEvent e) {

                ancho = ancho+50;
                largo = largo+50;

                setSize(ancho,largo);
            }

        }


        private class BotonListener2 implements ActionListener {
            public void actionPerformed(ActionEvent e) {

                ancho = ancho-50;
                largo = largo-50;

                setSize(ancho,largo);
            }

        }
    }