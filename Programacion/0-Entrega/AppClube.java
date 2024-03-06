import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;

import javax.print.attribute.standard.JobHoldUntil;
import javax.swing.JOptionPane;

public class AppClube {

    static ArrayList<Actividade> listaActividades = new ArrayList<>();
    static ArrayList<Socio> listaSocios = new ArrayList<>();

    public static void main(String[] args) {
        
        String menu = "Pulsa 1 para xestionar actividades. \n Pulsa 2 para Xestionar Socios. \n Pulsa 3 Para asignar activide a un socio. \n Pulsa 4 Para Mostrar as actividades dun socio concreto. \n Pulsa 5 para saír";
        int respuesta;


        respuesta = Integer.parseInt(JOptionPane.showInputDialog(menu));

        while (respuesta != 5) {

            switch (respuesta) {
                case 1:
                    String menuActividad = "Pulsa A para mostrar as Actividades. \n Pulsa B para engadir unha actividade. \n Pulsa C para borrar unha actividade. \n Pulsa D para gardar as actividades nun ficheiro";
                    String respuestaActi = JOptionPane.showInputDialog(menuActividad);

                    switch (respuestaActi) {
                        case "A":

                             mostrarActividades();

                            break;

                        case "B":

                            introducirActividade();

                            break;

                        case "C":
                            
                            borrarActividade();

                            break;

                        case "D":

                            gardarActividadesFicheiro();
                            
                            break;
                    
                        default:

                            respuestaActi = JOptionPane.showInputDialog("Opción non válida");

                            break;
                    }
                    
                    break;
            
                case 2:

                String menuSocio = "Pulsa A para mostrar os Socios. \n Pulsa B para engadir un socio. \n Pulsa C para borrar. \n Pulsa D para buscar por apelido. \n Pulsa E para gardar as actividades nun ficheiro";
                String respuestaSocio = JOptionPane.showInputDialog(menuSocio);
                    switch (respuestaSocio) {
                        case "A":
                            
                            mostrarSocios();

                            break;
                    
                        case "B":
                        
                            introducirSocio();

                            break;
                            
                        case "C":
                        
                            eliminarSocio();

                            break;

                        case "D":

                            buscarApelido();
                        
                            break;

                        case "E":
                        
                            gardarSociosFichero();

                            break;

                        default:

                            respuestaSocio = JOptionPane.showInputDialog("Opción non válida");

                            break;
                    }

                    break;

                case 3:
                    
                    break;

                case 4:
                    
                    break;
            
                default:

                    respuesta = Integer.parseInt(JOptionPane.showInputDialog("Opción non válida, do 1 ó 5"));

                    break;
            }
            

            respuesta = Integer.parseInt(JOptionPane.showInputDialog(menu));

        }
    }  
    



    //MÉTODOS DE ACTIVIDADES
    public static void introducirActividade(){

        String nomeActividade, salaActividade;
        int horasSemanais;
        double prezoActividade;


        nomeActividade = JOptionPane.showInputDialog("Dime o nome da actividade");
        salaActividade = JOptionPane.showInputDialog("Dime a sala");
        horasSemanais = Integer.parseInt(JOptionPane.showInputDialog("Dime as horas semanais"));
        prezoActividade = Double.parseDouble(JOptionPane.showInputDialog("Dime o prezo"));

        Actividade acti = new Actividade(nomeActividade, horasSemanais, prezoActividade, salaActividade);

        listaActividades.add(acti);

    }

    public static void mostrarActividades(){
        String respuestaCadena = "";

        for (Actividade actividade : listaActividades) {

            respuestaCadena = respuestaCadena + actividade.toString() + "\n";
        }

        JOptionPane.showMessageDialog(null, respuestaCadena);
    }


    public static void borrarActividade(){
       
        int respuestaBorrar = Integer.parseInt(JOptionPane.showInputDialog("Dime o índice da Actividade que queres eliminar"));

        for (int i = 0; i < listaActividades.size(); i++) {
            if (listaActividades.get(i).getCodActividadePrivado() == respuestaBorrar) {

                listaActividades.remove(i);
                
            }
        }

        JOptionPane.showMessageDialog(null, "Actividade eliminada");
    }

    public static void gardarActividadesFicheiro(){

        String respuestaEscribir = JOptionPane.showInputDialog("Dime o nome para o ficheiro");

        try {

            File fileEscritor = new File (respuestaEscribir);
            FileWriter escritorFileWriter = new FileWriter(fileEscritor);
            PrintWriter escritoPrint = new PrintWriter(escritorFileWriter);

            for (Actividade actividade : listaActividades) {
                escritoPrint.println(actividade.toStringParaFichero());

            }

            JOptionPane.showMessageDialog(null, "Ficheiro creado");

            escritoPrint.close();
            escritorFileWriter.close();

        } catch (IOException e) {
            // TODO Auto-generated catch block
            JOptionPane.showMessageDialog(null, "Erro escribindo no ficheiro");
        }


    }



    //METODOS DE SOCIOS

    public static void mostrarSocios(){

        String respuestaCadena = "";

        for (Socio socio : listaSocios) {

            respuestaCadena = respuestaCadena + socio.toString() + "\n";
        }

        JOptionPane.showMessageDialog(null, respuestaCadena);
    };

    public static void introducirSocio(){};


    public static void eliminarSocio(){};

    public static void buscarApelido(){};

    public static void gardarSociosFichero(){};



}