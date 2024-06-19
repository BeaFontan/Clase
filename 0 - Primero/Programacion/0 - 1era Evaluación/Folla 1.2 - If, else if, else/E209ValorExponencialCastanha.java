//Un kg de castañas valía no ano 2018 1.20 €/kg. Se o seu prezo subiu cada ano un 10 %, mostra o prezo que tivo cada ano ata o 2022.


public class E209ValorExponencialCastanha {

public static void main (String[] args){
    
    double valorCastanhaInicial = 1.20;
    double calculo2019 = valorCastanhaInicial *10/100;
    double valor2019 = calculo2019 + valorCastanhaInicial;

    double calculo2020 = valor2019 *10/100;
    double valor2020 = calculo2020 + valor2019;

    double calculo2021 = valor2020 *10/100;
    double valor2021 = calculo2021 + valor2020;

    double calculo2022 = valor2021 *10/100;
    double valor2022 = calculo2022 + valor2021;

    //Resultado

     System.out.println("En 2018 un Kg de Castañas valía " + valorCastanhaInicial + "€/Kg, " + "en 2019 valía " + valor2019 + "€/Kg.");
     System.out.println("En 2019 subió a " + valor2020 + "€/Kg, ");
     System.out.println("En 2020 subió a " + valor2021 + "€/Kg, ");
     System.out.println("En 2021 subió a " + valor2022 + "€/Kg, ");

} 
}