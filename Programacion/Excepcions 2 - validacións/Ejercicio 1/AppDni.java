import java.util.Scanner;

public class AppDni {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        DNI[] arrayDni = new DNI[3];

        String numeroIntroducido;
        System.out.println("Dime o dni");
        numeroIntroducido = teclado.nextLine();

        for (int i = 0; i < arrayDni.length; i++) {
           
            try {
                DNI dni = new DNI(numeroIntroducido);
            } catch (DNIException e) {
                System.out.println(e.getMessage());
            }
        }



    }
}