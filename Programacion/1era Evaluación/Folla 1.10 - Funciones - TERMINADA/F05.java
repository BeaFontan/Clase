/*Escribe un programa que devolva a área dun círculo dado o seu radio (double). PI * radio* radio */

public class F05 {

    public static void main(String[] args) {

        double radio = 20;
        double resultadoArea;

        resultadoArea = areaCirculo(radio);

        System.out.println("El resultado del área del circulo es " + resultadoArea);
        



    }

    public static double areaCirculo(double radio){
        double numPi = 3.1416;

        return numPi * radio;
    }
}