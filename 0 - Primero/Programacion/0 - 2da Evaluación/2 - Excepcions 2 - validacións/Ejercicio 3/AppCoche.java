import javax.swing.JOptionPane;

public class AppCoche {

    public static void main(String[] args) throws CocheException {

        String menu = "Pulsa a) para introducir o vehículo\n Pulsa b) para mostrar os vehículos\n pulsa c) para sair ";
        Coche[] arrayCoches = new Coche[4];

        String respuesta = JOptionPane.showInputDialog(menu);

        while (!respuesta.equals("c")) {

            switch (respuesta) {
                case "a":
                    String matricula;
                    String prezo;
                    String modelo;
                    Boolean repetir=true;

                    for (int i = 0; i < arrayCoches.length; i++) {
                        
                        matricula = JOptionPane.showInputDialog("Dime a matricula");
                        prezo = JOptionPane.showInputDialog("Dime o prezo");
                        modelo = JOptionPane.showInputDialog("Dime o modelo");


                        try {
                            arrayCoches[i] = new Coche(matricula, Double.parseDouble(prezo), modelo);
                        } catch (CocheException e) {
                            repetir = false;
                            System.out.println(e.getMessage()); 
                        }

                        if (repetir) {
                            i--;
                        }

                    }

                    break;
            
                case "b":

                    for (Coche coche : arrayCoches) {
                        for (int i = 0; i < arrayCoches.length; i++) {
                            System.out.println(coche.toString());
                        }
                    }
                    
                    break;
            }
            
            respuesta = JOptionPane.showInputDialog(menu);

        }



    }
}