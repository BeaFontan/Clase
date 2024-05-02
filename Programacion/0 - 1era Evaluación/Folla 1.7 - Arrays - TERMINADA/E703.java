//Declara un array de 100 ints. Mostra o que hai nas 5 primeiras posicións (deberían ser 0). Introduce nas 20 primeiras posicións os 20 primeiros números comezando 
//no 0: 0,1, 2, 3, ... , 19. Mostra eses 20 valores desde o vixésimo ata o primeiro.

public class E703 {

    public static void main(String[] args) {
        
        int[] numeros = new int[100];

        for (int i = 0; i < 5; i++) {

            System.out.println("Os valores das posicións son " + numeros[i]);
            
        }

        System.out.println("____________________");

        for (int i = 0; i < 20; i++) {

            numeros[i] = i+1; //le sumo uno para que ignore la posisión 0

            System.out.println(numeros[i]);
            
        }

        System.out.println("____________________");

        for (int i = 19; i >= 0; i--) //ojo, le pongo mayor igual para a 0 para que alcance el 0 sino no llega
        {
            System.out.println("Os valores das posicións son " + numeros[i]);
        }





    }

}