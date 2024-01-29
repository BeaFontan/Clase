/*Programa que devolva a suma dos divisores dun número enteiro positivo. */

public class F012 {
    
public static void main(String[] args) {
    
    int numero= 10;
    int resultadoSumaDivisor;


    resultadoSumaDivisor = sumaDivisores(numero);

    System.out.println("A suma dos divisores é: " + resultadoSumaDivisor);



}

public static int sumaDivisores (int a){
    int suma = 0;


    for (int i = a; i > 0; i--) {

        if (a % i == 0) {

        suma = suma + i;
            
        }
        
    }


    return suma;



}


}