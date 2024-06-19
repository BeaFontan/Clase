//3.- Crea unha lista de tipo String, e engade 4 elementos String: “Roma”, “París”, “Estocolmo”, “Vilna”.
// Convirte a lista nun array e mostra os elementos cun for.

import java.util.ArrayList;

public class ejer3 {

    public static void main(String[] args) {
        //declaro la lista
        ArrayList <String> listaCiudades = new ArrayList<String>();
        //declaro el array
        String [] transformacionArray = new String[listaCiudades.size()];
        String [] transformacion = new String[listaCiudades.size()];

        //introduzco datos para luego meter los datos en el array, sino no contendrá ningún elemento ni están enlazados
        listaCiudades.add("Roma");
        listaCiudades.add("París");
        listaCiudades.add("Estocolmo");
        listaCiudades.add("Vilna");

        //ahora hago la copia al array
        transformacionArray = listaCiudades.toArray(transformacionArray);

        //ahora lo muestro
       for (int i = 0; i < transformacionArray.length; i++) {
        System.out.println(transformacionArray[i]);
       }

       //ahora voy a borrar roma de la lista para practicar

       listaCiudades.remove("Roma");



       for (String dato : listaCiudades) {
            System.out.println(dato);
       }

       //y ahora lo convierto en otro array

       transformacion = listaCiudades.toArray(transformacion);

       for (int i = 0; i < transformacion.length; i++) {
            System.out.println("__________________");
            System.out.println(transformacion[i]);
       }
    }





    
}