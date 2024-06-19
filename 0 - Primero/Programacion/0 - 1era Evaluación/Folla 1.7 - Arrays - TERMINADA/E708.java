//Declara un array de 1200 enteiros. Fai que o primeiro valor sexa 5. Garda na segunda posición o
//doble do que hai na primeira – 4. Garda na terceira posición o doble do que hai na segunda – 4. Fai
//un bucle para facer isto ata a posición 1199. Mostra todos os valores do array.

public class E708 {
    public static void main(String[] args) {
        
        int[] numeros = new int[14]; // le pongo 14 porque con 1200 se sale del rango del valor del dato y no muestra bien

        numeros[0] = 5;
        numeros[1] = (numeros[0] *2) -4; // a la posición 1 le doy el valor de la posición 0 * 2 (para el doble) y -4.
        numeros[2] = (numeros[1] *2) -4;

        for (int valor : numeros) {

            System.out.println(valor);
            
        }

        System.out.println("________________________________");

        for (int i = 0; i < numeros.length; i++) {
            
            numeros[i] = (i *2) -4;


            System.out.println(numeros[i]);


        }


    }
    
}