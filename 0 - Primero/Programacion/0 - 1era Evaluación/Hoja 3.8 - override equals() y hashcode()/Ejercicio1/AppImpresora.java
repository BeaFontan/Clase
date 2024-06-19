package Ejercicio1;

public class AppImpresora {

    public static void main(String[] args) {
        
        Impresora imp1 = new Impresora(15, "Model 1", 6);

        Impresora imp2 = new Impresora(15, "Modelo 3", 6);

        Impresora imp3 = new Impresora(16, null, 0);

        System.out.println(imp1.equals(imp2));

        System.out.println(imp1.equals(imp3));


        //Método hashcode(). Ahora comparamos si los números de hash que devuelven son los mismo o no.

        System.out.println(imp1.hashCode());

        System.out.println(imp2.hashCode());

        System.out.println(imp3.hashCode());




    }
}