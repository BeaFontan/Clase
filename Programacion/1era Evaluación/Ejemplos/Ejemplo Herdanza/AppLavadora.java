public class AppLavadora {

    public static void main(String[] args) {
        
        Lavadora lava1 = new Lavadora();

        System.out.println("Coódigo: " + lava1.getCodigo());

        System.out.println("Precio: " + lava1.getPrezo());

        System.out.println("Carga: " + lava1.getCarga());

        Lavadora lava2 = new Lavadora("Cod. 2", 300, 5); // aquí le asigno los datos al constructor de lavadora, que tiene super(codigo,prezo) y carga de lavadora.

        System.out.println("Coódigo: " + lava2.getCodigo());

        System.out.println("Precio: " + lava2.getPrezo());

        System.out.println("Carga: " + lava2.getCarga());
    }
}