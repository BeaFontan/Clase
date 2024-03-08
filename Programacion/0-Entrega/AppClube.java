import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.swing.JOptionPane;

public class AppClube {

    static ArrayList<Actividade> listaActividades = new ArrayList<>();
    static ArrayList<Socio> listaSocios = new ArrayList<>();

    public static void main(String[] args) {
        
        String menu = "Pulsa 1 para xestionar ACTIVIDADES. \n Pulsa 2 para xestionar SOCIOS. \n Pulsa 3 Para asignar ACTIVIDADE a un SOCIO. \n Pulsa 4 Para mostrar as ACTIVIDADES dun SOCIO concreto. \n Pulsa 5 para saír";
        int respuesta;


        respuesta = Integer.parseInt(JOptionPane.showInputDialog(menu));

        while (respuesta != 5) {

            switch (respuesta) {
                case 1:
                    String menuActividad = "Pulsa A para mostrar as actividades. \n Pulsa B para engadir unha actividade. \n Pulsa C para borrar unha actividade. \n Pulsa D para gardar as actividades nun ficheiro";
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

                String menuSocio = "Pulsa A para mostrar os Socios. \n Pulsa B para engadir un socio. \n Pulsa C para borrar un socio. \n Pulsa D para buscar por apelido. \n Pulsa E para gardar as actividades nun ficheiro";
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
                    
                    int indiceSocio, indiceActividade;

                    indiceSocio = Integer.parseInt(JOptionPane.showInputDialog("Dime o índice do socio"));
                    indiceActividade = Integer.parseInt(JOptionPane.showInputDialog("Dime o índice da actividade que lle queres asignar"));

                    for (int i = 0; i < listaSocios.size(); i++) {//recorro los socios

                        if (listaSocios.get(i).getCodSocioPrivado() == indiceSocio) { //si encuentro el socio que me dice
                            listaSocios.get(indiceSocio).setarrayActividadesInscrito(indiceActividade);

                        }
                    }
        
                    break;

                case 4:
                    
                    indiceSocio = Integer.parseInt(JOptionPane.showInputDialog("Dime o índice do socio que queres mostrar as actividades"));
                    String mostrarActividades="";

                    for (int i = 0; i < listaSocios.size(); i++) {
                        if (listaSocios.get(i).getCodSocioPrivado() == indiceSocio) {
                            mostrarActividades = Socio.arrayActividadesInscrito.toString();
                        }
                        
                    }

                    JOptionPane.showMessageDialog(null, mostrarActividades);

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

        String nomeSocio, salaActividade;
        int horasSemanais;
        double prezoActividade;


        nomeSocio = JOptionPane.showInputDialog("Dime o nome da actividade");
        salaActividade = JOptionPane.showInputDialog("Dime a sala");
        horasSemanais = Integer.parseInt(JOptionPane.showInputDialog("Dime as horas semanais"));
        prezoActividade = Double.parseDouble(JOptionPane.showInputDialog("Dime o prezo"));

        Actividade acti = new Actividade(nomeSocio, horasSemanais, prezoActividade, salaActividade);

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
        boolean bandera = false;

        for (int i = 0; i < listaActividades.size(); i++) {
            if (listaActividades.get(i).getCodActividadePrivado() == respuestaBorrar) {
                listaActividades.remove(i);
                bandera = true;
                break;
            }
        }

        if (bandera == false) {
            JOptionPane.showMessageDialog(null, "Non hay ningunha actividade con ese índice");
        }
        else{        
            JOptionPane.showMessageDialog(null, "Actividade eliminada");
        }

        
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

    public static void introducirSocio(){
        String nomeSocio, apelidosSocio, emailSocio;
        Date dataNacementoSocio;

        nomeSocio = JOptionPane.showInputDialog("Dime o nome do socio");
        apelidosSocio = JOptionPane.showInputDialog("Dime os apelidos do socio");
        emailSocio = JOptionPane.showInputDialog("Dime o email do socio");
        dataNacementoSocio = Date.valueOf(JOptionPane.showInputDialog("Dime a data de nacemento do socio con formado AAAA-MM-DD"));
        
        Socio socio = new Socio(nomeSocio, apelidosSocio, emailSocio, dataNacementoSocio);

        listaSocios.add(socio);

    };

    public static void eliminarSocio(){

        int respuestaBorrar = Integer.parseInt(JOptionPane.showInputDialog("Dime o índice do socio que queres eliminar"));
        boolean bandera = false;

        for (int i = 0; i < listaSocios.size(); i++) {
            if (listaSocios.get(i).getCodSocioPrivado() == respuestaBorrar) {
                listaSocios.remove(i);
                bandera = true;
                break;
            }

        }

        if (bandera == false) {

            JOptionPane.showMessageDialog(null, "Non hay ningún socio con ese apelido");
        }
        else{        
            JOptionPane.showMessageDialog(null, "Socio eliminado");
        }

    };

    public static void buscarApelido(){

        String buscarApelido = JOptionPane.showInputDialog("Dime o apelido que queres buscar");
        String almacenarDatos = "";
        boolean bandera = false;

        for (int i = 0; i < listaSocios.size(); i++) {
            if (listaSocios.get(i).getApelidosSocio().equals(buscarApelido)) {

                almacenarDatos = listaSocios.get(i).toString();
                bandera = true;
                break;
            }
        }
        if (bandera == false) {

            JOptionPane.showMessageDialog(null, "Non hay ningún socio con ese apelido");
        }
        else{        
            JOptionPane.showMessageDialog(null, almacenarDatos);
        }


    };


    //POR HACER
    public static void gardarSociosFichero(){};



}