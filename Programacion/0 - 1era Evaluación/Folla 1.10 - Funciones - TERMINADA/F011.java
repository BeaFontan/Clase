/* Programa que devolva o maior de 3 números enteiros.*/

public class F011 {

    public static void main(String[] args) {
        
        int numero1 = 2;
        int numero2 = 3;
        int numero3 = 5;
        int mayor;

        mayor = maximoEnteiros(numero1, numero2, numero3);

        System.out.println("O número maior é " + mayor);



    }

    public static int maximoEnteiros ( int x, int y, int z){

        if (x > y || x > z) {
            return x;
        }
        else if(y > x || y > z){
            
             return y;
        }
        else{
            return z;
        }



    }
}