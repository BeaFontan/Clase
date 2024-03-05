import java.util.ArrayList;

import javax.print.attribute.standard.JobHoldUntil;
import javax.swing.JOptionPane;

public class AppClube {

    static ArrayList<Actividade> listaActividades = new ArrayList<>();

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
                            
                            break;

                        case "D":
                            
                            break;
                    
                        default:

                            respuestaActi = JOptionPane.showInputDialog("Opción non válida, pulsa A, B, C ou D");

                            break;
                    }
                    
                    break;
            
                case 2:
                    
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
       


    }

    public static void gardarActividadesFicheiro(){};


}