/* Escribe un programa que devolve o máximo de dous enteiros.*/

public class F07 {

    public static void main(String[] args) {
        
        int numero1 = 2;
        int numero2 = 3;
        int mayor;
        mayor = maximoEnteiros(numero1, numero2);

        System.out.println("O número maior é " + mayor);



    }

    public static int maximoEnteiros ( int x, int y){

        if (x > y) {
            return x;
        }
        else{
            
             return y;
        }



    }
}