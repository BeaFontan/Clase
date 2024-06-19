import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

public class AppClube {

    //Hola Nacho, entrégoche o que me deu tempo a facer. Faltan moitas escepcións e as validacións e controlar alguns funcionamientos do programa como tal. No tempo que tiven foi o mellor que puden facer.
    //Hubéseme gustado moito que puxeras esta actividade con mais tempo, e non  me refiro a tempo de clase. Gustaríame poder planificala, programala como é debido e que funcione ben, pero no tempo dado e cos exames foi 
    //imposible facer mais.
    //Unha actividade que me resultaría moi interesante e de moita utilidade para aprender, convertiuse nun foco de ansiedade dende o meu punto de vista. Xa sabes que non é nada personal.



    static ArrayList<Actividade> listaActividades = new ArrayList<>();
    static ArrayList<Socio> listaSocios = new ArrayList<>();
    static File ficheroActividades;
    static Path ficheroSocios;

    public static void main(String[] args) {

        //--------------------------------------------------------------------------JAVA IOOOOOOOOOOOOOO----------------------------------------------------------------------

        // cargar fichero actividades

        ficheroActividades = new File("actividades.txt");

        if (!ficheroActividades.exists()) {
            try {

                ficheroActividades.createNewFile();

            } catch (IOException e) {
                JOptionPane.showMessageDialog(null, "Non se pudo encontrar o arquivo" + e.getMessage());
            }

        }//si existe, lo leo y cargo los datos
        else {

            try (BufferedReader brActividades = new BufferedReader(new FileReader(ficheroActividades))) {
                String linea = brActividades.readLine();
         
                while (linea != null) {
                    String[] datosAtributos = linea.trim().split(";");
                    Actividade datoIndiceArray = new Actividade(datosAtributos[0], Integer.parseInt(datosAtributos[1]), Double.parseDouble(datosAtributos[2]), datosAtributos[3]);
                    listaActividades.add(datoIndiceArray);

                    linea = brActividades.readLine();
                }

                brActividades.close();
            } catch (IOException e) {
                JOptionPane.showMessageDialog(null, "Erro ó leer o archivo" + e.getMessage());
            }
        }


//---------------------------------------------------------------------------------JAVA NIO---------------------------------------------------------------------------------------------------------

        //Leer socios
        ficheroSocios= Paths.get("socios.txt");


        if (!Files.exists(ficheroSocios)) {
            try {

                Files.createFile(ficheroSocios);

            } catch (IOException e) {
                JOptionPane.showMessageDialog(null, "Erro ó leer o archivo" + e.getMessage());
                e.printStackTrace();
            }

        }//si existe, lo leo y cargo los datos
        else {


            Charset charset = Charset.forName("ISO-8859-1"); // alfabeto Europa occidental
            try {
                // non nos preocupamos nin de abrir nin de pechar ningun recurso
                List<String> lines = Files.readAllLines(ficheroSocios, charset);

                for (int i = 0; i < lines.size(); i += 2) {
                    String[] datosAtributos = lines.get(i).trim().split(";");
                    String[] datosArray = lines.get(i+1).trim().split(",");

                    Socio socio = new Socio(datosAtributos[0], datosAtributos[1], datosAtributos[2], Date.valueOf(datosAtributos[3]));

                    listaSocios.add(socio);

                    for (int j = 1; j < datosArray.length; j++) {
                        int indiceActividad = Integer.parseInt(datosArray[j]);
                        socio.setarrayActividadesInscrito(indiceActividad);
                    }


                }
            } catch (IOException e) {
                JOptionPane.showMessageDialog(null, "Erro escribindo no archivo" + e.getMessage());
            }
        }





        //Menús

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

                    String submenuSocio = "Pulsa + para asignar datoIndiceArray a un socio. \n Pulsa - para quitar datoIndiceArray do socio";
                    String respuestaSubmenuSocio = JOptionPane.showInputDialog(submenuSocio);

                    int indiceSocio, indiceActividade;
                    boolean bandera = false;

                    switch (respuestaSubmenuSocio) {
                        //caso para añadir datoIndiceArray a un socio
                        case "+":

                            indiceSocio = Integer.parseInt(JOptionPane.showInputDialog("Dime o índice do socio para agregar"));
                            indiceActividade = Integer.parseInt(JOptionPane.showInputDialog("Dime o índice da actividade que lle queres asignar"));

                            for (int i = 0; i < listaSocios.size(); i++) {
                                //Si encuentra en la lista de socios el indice que me dan
                                if (listaSocios.get(i).getCodSocioPrivado() == indiceSocio) {
                                    //accedo al array de actividades de socio y añado el índice de la datoIndiceArray que me dan
                                    listaSocios.get(i).setarrayActividadesInscrito(indiceActividade);
                                    bandera = true;
                                }
                            }

                            if (bandera == false) {

                                JOptionPane.showMessageDialog(null, "No se ha podido asignar la datoIndiceArray.");
                            } else {
                                JOptionPane.showMessageDialog(null, "Actividad agregada al socio.");
                            }

                            break;

                            //Caso para borrar datoIndiceArray de un socio
                        case "-":

                            indiceSocio = Integer.parseInt(JOptionPane.showInputDialog("Dime o índice do socio para desagregar"));
                            indiceActividade = Integer.parseInt(JOptionPane.showInputDialog("Dime o índice da actividade que lle queres quitar"));

                            for (int i = 0; i < listaSocios.size(); i++) {

                                if (listaSocios.get(i).getCodSocioPrivado() == indiceSocio) {
                                    listaSocios.get(i).borrarArrayActividadesInscrito(indiceActividade);
                                    bandera = true;
                                }
                            }

                            if (bandera == false) {

                                JOptionPane.showMessageDialog(null, "No se ha podido eliminar la datoIndiceArray");
                            } else {
                                JOptionPane.showMessageDialog(null, "Actividad agregada al socio.");
                            }

                            break;

                        default:

                            JOptionPane.showMessageDialog(null, "Opción non válida");

                            break;
                    }

                    break;

                case 4:  // mostrar las actividades que tiene un socio
                    indiceSocio = Integer.parseInt(JOptionPane.showInputDialog("Dime o índice do socio do que queres mostrar as actividades"));
                    String cadeaMostrarActividadesDoSocio = "O Socio ten as seguintes actividades: ";

                    for (int i = 0; i < listaSocios.size(); i++) {
                        if (listaSocios.get(i).getCodSocioPrivado() == indiceSocio) {
                            int[] actividadesSocio = listaSocios.get(i).getarrayActividadesInscrito();
                            for (int j = 0; j < actividadesSocio.length; j++) {
                                if (actividadesSocio[j] != 0) { 
                                    
                                    cadeaMostrarActividadesDoSocio += listaActividades.get(actividadesSocio[j] - 1).toString() + "\n";
                                }
                            }
                            bandera = true;
                            break;
                        }
                    }

                    JOptionPane.showMessageDialog(null, cadeaMostrarActividadesDoSocio);

                    break;

                default:

                    respuesta = Integer.parseInt(JOptionPane.showInputDialog("Opción non válida, do 1 ó 5"));

                    break;
            }

            respuesta = Integer.parseInt(JOptionPane.showInputDialog(menu));

        }
    }

    //MÉTODOS DE ACTIVIDADES
    public static void introducirActividade() {

        String nomeActividade, salaActividade;
        int horasSemanais;
        double prezoActividade;

        nomeActividade = JOptionPane.showInputDialog("Dime o nome da actividade");
        horasSemanais = Integer.parseInt(JOptionPane.showInputDialog("Dime as horas semanais"));
        prezoActividade = Double.parseDouble(JOptionPane.showInputDialog("Dime o prezo"));
        salaActividade = JOptionPane.showInputDialog("Dime a sala");

        Actividade acti = new Actividade(nomeActividade, horasSemanais, prezoActividade, salaActividade);

        listaActividades.add(acti);

    }

    public static void mostrarActividades() {
        String respuestaCadena = "";

        for (Actividade actividade : listaActividades) {

            respuestaCadena = respuestaCadena + actividade.toString() + "\n";
        }

        JOptionPane.showMessageDialog(null, respuestaCadena);
    }

    public static void borrarActividade() {

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
        } else {
            JOptionPane.showMessageDialog(null, "Actividade eliminada");
        }

    }


        //--------------------------------------------------------------------------JAVA IOOOOOOOOOOOOOO----------------------------------------------------------------------

    public static void gardarActividadesFicheiro() {

        try {

            FileWriter escritorFileWriter = new FileWriter(ficheroActividades);
            PrintWriter escritoPrint = new PrintWriter(escritorFileWriter);

            for (Actividade actividade : listaActividades) {
                escritoPrint.println(actividade.toStringParaFichero());

            }

            JOptionPane.showMessageDialog(null, "Actividades agregadas ó ficheiro");

            escritoPrint.close();
            escritorFileWriter.close();

        } catch (IOException e) {
            // TODO Auto-generated catch block
            JOptionPane.showMessageDialog(null, "Erro escribindo no ficheiro");
        }

    }


    //METODOS DE SOCIOS
    public static void mostrarSocios() {

        String respuestaCadena = "";

        for (Socio socio : listaSocios) {

            respuestaCadena = respuestaCadena + socio.toString() + "\n";
        }

        JOptionPane.showMessageDialog(null, respuestaCadena);
    };

    public static void introducirSocio() {
        String nomeSocio, apelidosSocio, emailSocio;
        Date dataNacementoSocio;

        nomeSocio = JOptionPane.showInputDialog("Dime o nome do socio");
        apelidosSocio = JOptionPane.showInputDialog("Dime os apelidos do socio");
        emailSocio = JOptionPane.showInputDialog("Dime o email do socio");
        dataNacementoSocio = Date.valueOf(JOptionPane.showInputDialog("Dime a data de nacemento do socio con formado AAAA-MM-DD"));

        Socio socio = new Socio(nomeSocio, apelidosSocio, emailSocio, dataNacementoSocio);

        listaSocios.add(socio);

    };

    public static void eliminarSocio() {

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
        } else {
            JOptionPane.showMessageDialog(null, "Socio eliminado");
        }

    };

    public static void buscarApelido() {

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
        } else {
            JOptionPane.showMessageDialog(null, almacenarDatos);
        }

    };


//---------------------------------------------------------------------------------JAVA NIO---------------------------------------------------------------------------------------------------------



    public static void gardarSociosFichero() {

        List<String> lineas = new ArrayList<>();
        for (Socio socio : listaSocios) {
            lineas.add(socio.toStringParaFichero());
            lineas.add(socio.toStringParaFicheroArrayActividades());
        }

        try (BufferedWriter writer = Files.newBufferedWriter(ficheroSocios)) {
            for (String linea : lineas) {
                writer.write(linea);
                writer.newLine(); 
            }
            JOptionPane.showMessageDialog(null, "Os socios foron añadidos ó ficheiro");
            } catch (IOException e) {
            System.out.println("Erro gardando os socios " + e.getMessage());
        }

    }
}
