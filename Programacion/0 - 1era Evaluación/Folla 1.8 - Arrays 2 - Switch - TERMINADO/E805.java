//Xogo de adiviñar unha palabra entre 5 diferentes que empecen cada unha por unha vogal distinta.
//O xogador terá 2 intentos para cada unha, sendo felicitado ao acertar, e informado da palabra no
//caso de fallar. Poderá xogar as veces que queira. Emprega switch

import java.util.Scanner;

public class E805 {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        String[] palabras = {"azul", "esmeralda", "indigo", "oscuro", "uva"};
        String respuesta = "";

            System.out.println("Pulsa a para adiviñar a palabra por 'a'");
            System.out.println("Pulsa e para adiviñar a palabra por 'e'");
            System.out.println("Pulsa i para adiviñar a palabra por 'i'");
            System.out.println("Pulsa o para adiviñar a palabra por 'o'");
            System.out.println("Pulsa u para adiviñar a palabra por 'u'");
            System.out.println("Pulsa x para saír");
            respuesta = teclado.nextLine();


            
            while (!respuesta.equals("x")) {
                
                    switch (respuesta) {
                    case "a":
                        System.out.println("Dime a palabra por 'a'");
                        respuesta = teclado.nextLine();

                        if (respuesta.equals("azul")) {
                            System.out.println("Acertáches!");
                        }
                        
                        else{

                            System.out.println("Non acertaches, Téntao de novo: ");

                            respuesta = teclado.nextLine();
                            
                            if (respuesta.equals("azul")) {
                                System.out.println("Acertáches!");
                            }
                        
                            else{

                                System.out.println("Non acertaches");
                            
                            }
                        }
                    
                        break;
                        

                    case "e":
                        
                        System.out.println("Dime a palabra por 'e'");
                        respuesta = teclado.nextLine();

                        if (respuesta.equals("esmeralda")) {
                            System.out.println("Acertáches!");
                        }
                        
                        else{

                            System.out.println("Non acertaches, Téntao de novo: ");

                            respuesta = teclado.nextLine();
                            
                            if (respuesta.equals("esmeralda")) {
                                System.out.println("Acertáches!");
                            }
                        
                            else{

                                System.out.println("Non acertaches");
                            
                            }
                        }
                        break;

                    case "i":
                        System.out.println("Dime a palabra por 'i'");
                        respuesta = teclado.nextLine();

                        if (respuesta.equals("indigo")) {
                            System.out.println("Acertáches!");
                        }
                        
                        else{

                            System.out.println("Non acertaches, Téntao de novo: ");

                            respuesta = teclado.nextLine();
                            
                            if (respuesta.equals("indigo")) {
                                System.out.println("Acertáches!");
                            }
                        
                            else{

                                System.out.println("Non acertaches");
                            
                            }
                        }
                      
                        break;

                    case "o":
                        System.out.println("Dime a palabra por 'o'");
                        respuesta = teclado.nextLine();

                        if (respuesta.equals("oscuro")) {
                            System.out.println("Acertáches!");
                        }
                        
                        else{

                            System.out.println("Non acertaches, Téntao de novo: ");

                            respuesta = teclado.nextLine();
                            
                            if (respuesta.equals("oscuro")) {
                                System.out.println("Acertáches!");
                            }
                        
                            else{

                                System.out.println("Non acertaches");
                            
                            }
                        }
                       
                        break;

                    case "u":

                        System.out.println("Dime a palabra por 'u'");
                        respuesta = teclado.nextLine();

                        if (respuesta.equals("uva")) {
                            System.out.println("Acertáches!");
                        }
                        
                        else{

                            System.out.println("Non acertaches, Téntao de novo: ");

                            respuesta = teclado.nextLine();
                            
                            if (respuesta.equals("uva")) {
                                System.out.println("Acertáches!");
                            }
                        
                            else{

                                System.out.println("Non acertaches");
                            
                            }
                        }
                        
                   
                        break;
                
                }

                System.out.println("Pulsa a para adiviñar a palabra por 'a'");
                System.out.println("Pulsa e para adiviñar a palabra por 'e'");
                System.out.println("Pulsa i para adiviñar a palabra por 'i'");
                System.out.println("Pulsa o para adiviñar a palabra por 'o'");
                System.out.println("Pulsa u para adiviñar a palabra por 'u'");
                System.out.println("Pulsa x para saír");
                respuesta = teclado.nextLine();
         
            }
            
        
        teclado.close();

    }
}
