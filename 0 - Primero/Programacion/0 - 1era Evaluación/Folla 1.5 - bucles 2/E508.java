//Na empresa ProgSys, creada no 2015, os programadores comezan gañando 1200 € netos ao mes,
//tendo un aumento anual do seu soldo dun 5 %. Pregunta o ano no que entrou un traballador, e indica o
//soldo neto anual deste ano. (Un aumento anual do 5% do soldo quere dicir que o soldo do ano seguinte
//vale soldoAnoPasado*1,05 ).


///////////////REVISARLOS PORQUE NO SOY CAPAZ DE QUE EL AUMENTO SE SUME

import java.util.Scanner;

public class E508 {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        int salarioInicial = 1200;
        int anhoActual;
        int anhoIncial = 2015;
        double aumento= (salarioInicial * 5) /100;
        double salarioTotal = 0;
        double acumulador = 0;

        System.out.println("En que año comenzaste a trabajar");
        anhoActual = teclado.nextInt();


        for (int i = anhoActual; i > anhoIncial; i--) {
            
           acumulador = aumento + aumento;
    
        }

        salarioTotal = acumulador + salarioInicial;

        System.out.println("Este ano correspondeche cobrar " + salarioTotal + " euros");

        teclado.close();

    }
}