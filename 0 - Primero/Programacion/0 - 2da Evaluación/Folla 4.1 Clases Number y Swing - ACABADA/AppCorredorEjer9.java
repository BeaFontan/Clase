//Modifica o exercicio anterior para pedir e mostrar os datos dos 2 xogadores con JoptionPane. Comproba tamén que a letra do DNI é correcta


import javax.swing.JOptionPane;

public class AppCorredorEjer9 {

    public static void main(String[] args) {
        
        String nome, dni, dniNumero, dniLetra, marca;
        double marcaDouble;
        char [] arrayLetras = {'T','R','W','A','G','M','Y','F','P','D','X','B','N','J','Z','S','Q','V','H','L','C','K','E'};
    
        //Esto tendría más sentido hacer una función zopenca
        nome = JOptionPane.showInputDialog("Dime o nome");
        dni = JOptionPane.showInputDialog("Dime o DNI");

        dniNumero = dni.substring(0, 6);

        dniLetra = dni.substring( 7);

        int posicion = Integer.parseInt(dniNumero) % 23;

        if (dniLetra.charAt(0)!= arrayLetras[posicion]) {
            dni=JOptionPane.showInputDialog("DNI non correcto, introduceo de novo");
        }

   

        marca = JOptionPane.showInputDialog("Dime o tempo");

        marcaDouble = Double.parseDouble(marca);
        

        CorredorEjer8 corr1 = new CorredorEjer8(nome, dni, marcaDouble);
        System.out.println(corr1);


        nome = JOptionPane.showInputDialog("Dime o nome");
        dni = JOptionPane.showInputDialog("Dime o DNI");
        marca = JOptionPane.showInputDialog("Dime o tempo");

        marcaDouble = Double.parseDouble(marca);

        CorredorEjer8 corr2 = new CorredorEjer8(nome, dni, marcaDouble);

        System.out.println(corr2);

    }
    
    
    
}