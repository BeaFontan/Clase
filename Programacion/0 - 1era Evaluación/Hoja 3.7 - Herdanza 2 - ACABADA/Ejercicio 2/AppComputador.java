public class AppComputador {

    public static void main(String[] args) {
        
        Portatil por1 = new Portatil("Asus", "hdkd", "Procesador chulo", "ATX", 3, "plata");

        por1.listarAtributos();

        Portatil por2 = new Portatil("Apple", "Air", "presdro", "ABDS", 2, "blanco");

        por2.listarAtributos();


        Sobremesa sob1 = new Sobremesa("Dell", "modelo x", "proceadi", "JFH", true, 1);

        sob1.listarAtributos();

        Sobremesa sob2 = new Sobremesa("Dell", "sehfhsdf", "prodshdf", "tarjg", false, 2);

        sob2.listarAtributos();

        System.out.println(Computador.getNumComputadores());



    }
}