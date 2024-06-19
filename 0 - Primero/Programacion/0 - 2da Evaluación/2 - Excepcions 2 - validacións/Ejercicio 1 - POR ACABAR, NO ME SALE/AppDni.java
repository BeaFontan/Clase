import java.util.Scanner;

public class AppDni {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        DNI[] arrayDni = new DNI[3];
        DNI dni;

        String numeroIntroducido;
        System.out.println("Dime o dni");
        numeroIntroducido = teclado.nextLine();

        for (int i = 0; i < arrayDni.length; i++) {
           
            System.out.println("Dime o dni");
            numeroIntroducido = teclado.nextLine();

            try {
                dni = new DNI(numeroIntroducido);

                arrayDni[i] = dni;

            } catch (DNIException e) {
                System.out.println(e.getMessage());
                i--;
            }

        }

        for (DNI datosArrayDni : arrayDni) {
            System.out.println(datosArrayDni.getDNI());
        }



    }
}