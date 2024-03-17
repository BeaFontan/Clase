import java.util.Arrays;

import javax.swing.JOptionPane;

public class AppCidades {

    public static void main(String[] args) {
        
        Cidade [] arrayCidades = new Cidade[5];

        String nome;
        String poblacion;
        int poblacionInt;
        Cidade cid;

        for (int i = 0; i < arrayCidades.length; i++) {
            nome = JOptionPane.showInputDialog("Dime o nome");
            poblacion = JOptionPane.showInputDialog("Dime a población");
            poblacionInt = Integer.parseInt(poblacion);
            cid = new Cidade(nome, poblacionInt);
            arrayCidades[i] = cid;
        }



        Arrays.sort(arrayCidades);

        for (Cidade cidade : arrayCidades) {
            System.out.println(cidade.getNome());

        }

        for (int i = 0; i < arrayCidades.length; i++) {
            if (arrayCidades[i].compareTo(arrayCidades[i+1])) {
                
            }
        }


    }
}