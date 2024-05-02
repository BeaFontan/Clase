public class AppListadoBici{
    public static void main(String[] args) {
        
        String filename = "bicicletas.dat";
        ObjectInputStream leerInput = null;
        Path path =Paths.get(filename);

        Bicicleta bic1 = new Bicicleta("mod1", "capuchino");
        Bicicleta bic2 = new Bicicleta("mod2", "morado");

        Ciclista cicl1 = new Ciclista("Manuel", bic1);
        Ciclista cicl2 = new Ciclista("Bea", bic2);

        Ciclista[] arrayCiclistas = new Ciclista[2];
        arrayCiclistas[0] = cicl1;
        arrayCiclistas[1] = cicl2;


         //abril el fichero

        try {

            leerInput = new ObjectInputStream(Files.newInputStream(path));

        } catch (IOException e) {

            System.out.println(e.getMessage() + "Erro abrindo o ficheiro");
            
        }


        //leer el fichero

        Ciclista ciclista;

        try {

            while ((ciclista = (Ciclista)leerInput.readObject())!= null) {
                
                System.out.println(ciclista.getNome() + " " + ciclista.getBicicleta());

            }

            //NECESITAMOS TRES ESCEPCIONES
        } catch (ClassNotFoundException e) { //LA DE LA CLASE ERRÓNEA
            System.out.println(e.getMessage() + "Tipo de obxecto non válido");
        } catch (EOFException e) { //LA DE EOF, EL QUE CIERRA EL BUCLE (!=NULL)
            System.out.println("Fin de fichero");
        
        } catch (IOException e) { //y la de IO para error de lectura del fichero
            System.out.println(e.getMessage() + "Erro lendo o ficheiro");
        }finally{
            //cerrar el fichero

            try {
                if (leerInput != null) {
                    leerInput.close();
                }
            } catch (Exception e) {
            System.out.println("Error cerrando el fichero");
            System.exit(1);
            }
        }



    }
}