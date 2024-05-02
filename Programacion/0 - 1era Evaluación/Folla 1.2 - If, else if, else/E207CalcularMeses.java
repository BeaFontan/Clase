//Fai o mesmo para un bebé nacido neste ano. Deberás mostrar cantos meses e cantos días ten.

import java.util.Scanner;

public class E207CalcularMeses
{

    public static void main(String[] args) {
        
    Scanner pedirTeclado = new Scanner(System.in);
    
    int mesNacemento;
    int diaNacemento;

    int mesActual = 9;
    int diaActual = 19;
    int meses = 0;
    int dias = 0;


    System.out.println("Dime o mes de nacemento do bebé");
    mesNacemento = pedirTeclado.nextInt();

    System.out.println("Dime o día de nacemento do bebé");
    diaNacemento = pedirTeclado.nextInt();

    //Resultado
 


    if (mesNacemento < 9 )
    {

      System.out.println("O bebé ainda non naceu" );

    }

    else if(mesNacemento==9)
    {
    meses = mesNacemento- mesActual;
        
        if (diaNacemento > 19) 
        {
        meses-=1;
        }
        
       System.out.println("O bebé ten " + meses + " mes/meses e " + diaNacemento + " día/días" );

    }
    
 
    pedirTeclado.close();
    }
    }