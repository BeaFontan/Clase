//Crea un array de 100 enteiros . Asígnalle desde o valor 1 ata 100. Mostrao como unha conta atrás.
//Modifícao agora de xeito que en todas posicións na que hai un múltiplo de 5 se garde o valor 5.
//Móstrao de novo como unha conta atrás.

public class E707 {

    public static void main(String[] args) {
        
        int[] numeros = new int[100];

        //asigno valores:

        for (int i = 0; i < numeros.length; i++) {

            numeros[i] = i +1; // a la posición del array le añado el valor de i + 1 porque sino me coge el 0.
            
        }

        //ahora los muestro hacia atrás

        for (int i = numeros.length -1; i >= 0; i--) {

            System.out.println("El valor es " + numeros[i]);
            
        }

        //Ahora guardo donde hay multiplos de 5 el valor 5


        System.out.println("___________________");

        for (int valor : numeros) { // con un foreach accedo a los valores del array
            
                
             if (valor % 5 == 0){ //si el valor del array es módulo de 5
            
                valor = 5; //el valor lo igualo a 5
                
            }

            System.out.println("El valor es " + valor); // muestro el array completo fuera del for para ver el array completo
        }
    
    }
}