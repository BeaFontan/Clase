import java.util.Scanner;

public class ejer2 {


    public static void main(String[] args) {

        double a, b, c, d;
        double mediaCalculada;

        Scanner teclado = new Scanner(System.in);

        System.out.println("Dime un número");
        a = teclado.nextDouble();

        System.out.println("Dime un número");
        b = teclado.nextDouble();

        System.out.println("Dime un número");
        c = teclado.nextDouble();

        System.out.println("Dime un número");
        d = teclado.nextDouble();


        System.out.println(media(a,b,c,d));

        System.out.println(maximo(a, b, c, d));

        System.out.println(minimo(a, b, c, d));

        teclado.close();

    }




    public static double media(double a, double b, double c, double d){
        double media = 0;
        double suma;

        suma = a + b + c + d;

        media = suma / 4.0;

        return media;

    }

    public static double maximo(double a, double b, double c, double d){
        double maximo = a;

        if (b > maximo) {
            maximo = b;
        }
        if (c > maximo) {
           maximo = c;
        }
        if(d > maximo){
            maximo = d;
        }
     

        return maximo;

    }


        public static double minimo(double a, double b, double c, double d){
        double minimo = a;

        if (b < minimo) {
            minimo = b;
        }
        if (c < minimo) {
            minimo = c;
        }
        if(d < minimo){
            
            minimo = d;
        }
     
        return minimo;

    }


}