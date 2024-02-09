import javax.swing.JOptionPane;

public class AppCoche {

    public static void main(String[] args) {

        String menu = "Pulsa a) para introducir o vehículo\n Pulsa b) para mostrar os vehículos\n pulsa c) para sair ";
        Coche[] arrayCoches = new Coche[4];

        String respuesta = JOptionPane.showInputDialog(menu);

        while (!respuesta.equals("c")) {

            switch (respuesta) {
                case "a":
                    String modelo;
                    String prezo;
                    String marca;

                    for (int i = 0; i < arrayCoches.length; i++) {
                        
                        modelo = JOptionPane.showInputDialog("Dime a marca");
                        prezo = JOptionPane.showInputDialog("Dime o prezo");
                        marca = JOptionPane.showInputDialog("Dime o modelo");

                        arrayCoches[i] = new Coche(marca, Double.parseDouble(prezo), modelo);




                    }


                    
                    break;
            
                case "b":
                    
                    break;
            }
            
            respuesta = JOptionPane.showInputDialog(menu);

        }



    }
}