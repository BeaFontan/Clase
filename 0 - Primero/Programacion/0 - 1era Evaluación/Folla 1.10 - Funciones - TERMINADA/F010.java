/*Escriba unha función que reciba como argumento un número enteiro e devolva o número cos díxitos
invertidos. Para o número 12344, devolverá 44321. */


public class F010 {

    public static void main(String[] args) {
        
        int valorNumero = 1234;


        System.out.println("O número á inversa é " + invertirNumero(valorNumero));


    }

    public static int invertirNumero(int numero){
        int miles;
        int centenas;
        int decenas; 
        int unidades;
        int resto;

        int numeroInvertido;

        /* 5781 */
            miles = numero / 1000;
            resto = numero % 1000;
            centenas = resto / 100;
            resto = resto % 100;
            decenas = resto / 10;
            unidades = resto % 10;
            numeroInvertido = unidades * 1000 + decenas* 100 + centenas * 10 + miles;

        

        return numeroInvertido;
    }
}