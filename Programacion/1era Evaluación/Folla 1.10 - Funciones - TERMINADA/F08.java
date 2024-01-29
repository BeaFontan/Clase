/*Escribe un programa que, dado un enteiro x, calcule x3+ 2x2+ 3x +1. */

public class F08 {

    public static void main(String[] args) {

        int numeroEnteiro = 5;
        

        System.out.println("O resultado é " + calculos(numeroEnteiro));



    }

    public static int calculos(int x)
    {
        int resultado;

        resultado = (x*x*x) + (2*x*x) + (3 * x) + 1;

        return resultado;



    }

    
}