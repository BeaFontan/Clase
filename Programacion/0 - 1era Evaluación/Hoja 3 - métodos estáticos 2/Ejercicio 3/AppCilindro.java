public class AppCilindro {

    public static void main(String[] args) {
        
    Cilindro cilindro1 = new Cilindro(20,5);

    cilindro1.geTArea();

    cilindro1.getVolume();

    System.out.println(cilindro1.geTArea());
    //Con el get area, que es el metodo que muestra el cálculo del área, te hace la llamada al método estático y te devuele el valor con el get, método no estático

    System.out.println(cilindro1.getVolume());

    }
}