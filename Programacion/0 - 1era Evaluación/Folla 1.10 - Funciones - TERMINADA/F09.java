/* Escribe un programa que dado un número enteiro N, devolva 1+2+3+...+N.*/

public class F09 {

    public static void main(String[] args) {
        
    int valorNumero = 5;

    System.out.println(" O total é " + sumarValoresAnteriores(valorNumero));


    }

    public static int sumarValoresAnteriores(int x){

        int sumaTotal = 0;

        for (int i = x; i > 0; i--) {
            
            sumaTotal = sumaTotal + i;
            

        }

        return sumaTotal;
    }
}