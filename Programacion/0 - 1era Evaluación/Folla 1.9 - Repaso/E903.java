/*3. Un comprador de material para unha empresa será preguntado polo material a comprar de
cada: paquetes de folios a 3.00 €, as caixas de bolígrafos a 2.50 €, grapadoras a 10.00 € e os
tóner de impresora a 60.00 €. Finalmente, mostraremos o prezo a pagar, tendo en conta que se
éste supera os 1000.00 € o prezo será rebaixado nun 17.5 %, e se o prezo supera os 2000.00
€ a rebaixa será do 30 %. Mostra a cantidade a pagar, e a rebaixa. */

import java.util.Scanner;

public class E903{
    public static void main(String[] args) {
        
    double precioFolios = 3.00;
    double precioBoligrafos = 2.50;
    double precioGrapadoras = 10.00;
    double precioTonner = 60.00;
    int cantidadFolios;
    int cantidadBoligrafos;
    int cantidadGrapadoras;
    int CantidadTonner;
    double totalPrecio;
    double AcumuladorDinero;
    double descuento;


    Scanner teclado = new Scanner (System.in);

        System.out.println("Cantos folios queres?");
        cantidadFolios = teclado.nextInt();

        totalPrecio = precioFolios * cantidadFolios;
        AcumuladorDinero = totalPrecio;


        System.out.println("Cantos bolígrafos queres?");
        cantidadBoligrafos = teclado.nextInt();

        totalPrecio = precioBoligrafos * cantidadBoligrafos;
        AcumuladorDinero = totalPrecio + AcumuladorDinero;//el acumulador es igual al total precio de ahora + a lo que ya tenía el acumulador.


        System.out.println("Cantas grapadoras queres?");
        cantidadGrapadoras = teclado.nextInt();

        totalPrecio = precioGrapadoras * cantidadGrapadoras;
        AcumuladorDinero = totalPrecio + AcumuladorDinero;


        System.out.println("Cantos tonner queres?");
        CantidadTonner = teclado.nextInt();

        totalPrecio = CantidadTonner * precioTonner;
        AcumuladorDinero = totalPrecio + AcumuladorDinero;


        if (AcumuladorDinero > 1000 && AcumuladorDinero < 2000) //si la compra es mayor a 1000 17.5% rebaja
         {
            descuento = AcumuladorDinero * 0.175;

            AcumuladorDinero = AcumuladorDinero - descuento;

            System.out.println("O importe a pagar é " + AcumuladorDinero + " euros. O desconto aplicado foi dun 17,5% e ascende a: " + descuento + " euros.");
            
        }

        else if (AcumuladorDinero > 2000) //si la compra es mayor a 2000 30% rebaja
        {
            descuento = AcumuladorDinero * 0.30;

            AcumuladorDinero = AcumuladorDinero - descuento;

            System.out.println("O importe a pagar é " + AcumuladorDinero + " euros. O desconto aplicado foi dun 30% e ascende a: " + descuento + " euros.");
        
        }

        else{
             System.out.println("O importe a pagar é " + AcumuladorDinero + " euros.");
        }
       

        teclado.close();

    }
}