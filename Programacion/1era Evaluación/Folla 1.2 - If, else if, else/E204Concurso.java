//Fai un programa concurso, con tres preguntas de 500 € cada unha. Mostra o premio final do concursante e felicítao co seu nome.

import java.util.Scanner;

public class E204Concurso 
{

    public static void main(String[] args) 
    {

    int premioAcumulado = 0;
    String nome;
    Scanner pedirTeclado = new Scanner(System.in);


    System.out.println("¿Dime o teu nome?");
    nome = pedirTeclado.nextLine();


    ////////////////


    System.out.println("¿Cál é a capital de Francia?");
    String respuesta1 = pedirTeclado.nextLine();

    if (respuesta1.equals("París"))
    {
     System.out.println("Noraboa");
     premioAcumulado = 500;
    }
    else{System.out.println("Fallaches, non acumulas o premio");}


    /////////////
    
    System.out.println("¿Cál é a capital de Portugal?");
    String respuesta2 = pedirTeclado.nextLine();

    if (respuesta2.equals("Lisboa"))
    {
     System.out.println("Noraboa");
     premioAcumulado += 500;
    }
    else{System.out.println("Fallaches, non acumulas o premio");}


    ///////////

    System.out.println("¿Cál é a capital de Alemania?");
    String respuesta3 = pedirTeclado.nextLine();

    if (respuesta3.equals("Berlín"))
    {
     System.out.println("Noraboa");
     premioAcumulado += 500;
    }
    else{System.out.println("Fallaches, non acumulas o premio");}


    //////RESULTADO CONCURSO

    System.out.println("Noraboa, " + nome + ", o importe do teu premio son " + premioAcumulado + "€.");

    pedirTeclado.close();

    }
}