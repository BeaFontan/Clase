import java.util.Scanner;

public class ejer1 {

    public static void main(String[] args) {
        
        int[] arrayEnteros = new int[6];
        Scanner entrada = new Scanner(System.in);
        String respuesta;


        System.out.println("Pulsa a para introducir los valores");
        System.out.println("Pulsa b para Multiplicar todos los valores por 3");
        System.out.println("Pulsa c para Calcular la media de los valores");
        System.out.println("Pulsa d para Intercambiar los números 2 a 2");
        System.out.println("Pulsa e para Imprimir el array");
        System.out.println("Pulsa f para Almacenar a partir de la posición 3ª el producto de los elementos anteriores");
        respuesta = entrada.next();

            while (!respuesta.equals("azul")) {
                
                switch (respuesta) {
                    case "a": //Pulsa a para introducir los valores
                        
                        System.out.println("Dime os 6 números enteiros");
                        
                        for (int i = 0; i < arrayEnteros.length; i++) {
                            arrayEnteros[i] = entrada.nextInt();
                        }

                        break;

                    case "b": //Pulsa b para Multiplicar todos los valores por 3

                        for (int i = 0; i < arrayEnteros.length; i++) {
                            arrayEnteros[i] = arrayEnteros[i] * 3;
                
                        }

                        for (int valor : arrayEnteros) {
                            System.out.println(valor);
                        }                

                        break;

                    case "c": //Pulsa c para Calcular la media de los valores
                        int suma = 0;
                        double media = 0; 

                        for (int i = 0; i < arrayEnteros.length; i++) {
                            suma = suma + arrayEnteros[i];
                            media = (double)suma / arrayEnteros.length; //Ojo, transformar a double la suma porque sino no te pilla los decimales
                        }

                        System.out.println(media);

                        break;

                    case "d": //Pulsa d para Intercambiar los números 2 a 2
                                                                //que valla de dos en dos
                        for (int i = 0; i < arrayEnteros.length; i++) { //le digo que valla de 2 en dos, sino está cambiando todo el rato, en cada una

                            int guardarPosicion = arrayEnteros[i];//guardo la primera posición

                            arrayEnteros[i] = arrayEnteros[i+1];//resto uno, para que se ponga de primero

                            arrayEnteros[i+1] = guardarPosicion;//y la posición de i+1 es igual 

                        }

                        for (int valor : arrayEnteros) {
                            System.out.println(valor);
                        }


                        break;

                    case "e": //Pulsa e para Imprimir el array

                        for (int valor : arrayEnteros) {
                            System.out.println(valor);
                        }

                        break;

                    case "f": //Pulsa f para Almacenar a partir de la posición 3ª el producto de los elementos anteriores

                    for (int i = 2; i < arrayEnteros.length; i++) {
                        int productoAcumulativo = 1;
            
                        // Calcular el producto acumulativo de los elementos anteriores
                        for (int j = 0; j <= i; j++) {
                            productoAcumulativo *= arrayEnteros[j];
                        }
            
                        // Almacenar el producto acumulativo en la posición correspondiente
                        arrayEnteros[i] = productoAcumulativo;
                    }       
            

                    //Mostrar el array
                    for (int valor : arrayEnteros) {
                        System.out.println(valor);
                    }

                    break;

                }   

                    System.out.println("Pulsa a para introducir los valores");
                    System.out.println("Pulsa b para Multiplicar todos los valores por 3");
                    System.out.println("Pulsa c para Calcular la media de los valores");
                    System.out.println("Pulsa d para Intercambiar los números 2 a 2");
                    System.out.println("Pulsa e para Imprimir el array");
                    System.out.println("Pulsa f para Almacenar a partir de la posición 3ª el producto de los elementos anteriores");
                    respuesta = entrada.next();
            }
        
        entrada.close();
    }
}
