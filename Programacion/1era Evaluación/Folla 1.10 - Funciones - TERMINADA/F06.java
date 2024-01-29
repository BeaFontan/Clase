/* Escribe un programa que reciba 3 números flotantes e devolva a media dos 3*/

public class F06 {

    public static void main(String[] args) {
    float numero1 = 3.2f;
    float numero2 = 1.2f;
    float numero3 = 1.1f;
    float resultadoMedia;

    resultadoMedia = mediaTresNumeros(numero1, numero2, numero3);

    System.out.println("A media do " + numero1 + ", " + numero2 + ", " + numero3 + " é " + resultadoMedia );




    }


    public static float mediaTresNumeros(float a, float b, float c){
        float suma;
        float media;


        suma = a+b+c;
        media =suma / 3;

        return media;
    }
}