//7. Fai un programa que simule do xogo do aforcado. Teremos 8 gardadas de 8 letras nun array de String.
//Cando o programa elixa aleatoriamente a palabra, aparecerá unha ventá mostrando 8 liñas “_ _ _ _ _ _ _
//” e o usuario terá que ir introducindo letras. Cando teclee unha letra da palabra elixida, a letra aparecerá
//no que se ve (por exemplo se a palabra é elefante, e introduce a ‘e’ verase así “e _ e _ _ _ _ e”. Terá 10
//intentos para atopar a palabra. Mostra ademais da palabra incompleta, os intentos que lle quedan, e as
//letras que foi elixindo previamente.

//OJO, LO HIZO NACHO, NO YO.

import javax.swing.JOptionPane;

public class Ejer7 {

    public static void main(String[] args) {
        
              StringBuilder cadeaIntroducida = new StringBuilder("        ");
        String cadeaAdivinhar = "cantando";
        StringBuilder cadeaMostra = new StringBuilder("_ _ _ _ _ _ _ _");
        int intentos = 0;
        String mensaxe = "Introduce unha letra \n "+cadeaMostra.toString();
        while(!cadeaAdivinhar.equals(cadeaIntroducida.toString()) &&  intentos < 10){
            char letra = JOptionPane.showInputDialog(mensaxe).charAt(0);

            for(int i = 0; i < cadeaAdivinhar.length(); i++){
                if(letra == cadeaAdivinhar.charAt(i)){
                    cadeaIntroducida.setCharAt(i, letra);
                    cadeaMostra.setCharAt(2*i, letra);
                }
            }
            intentos++;
            mensaxe = "Introduce unha letra \n "+cadeaMostra.toString();
        }
        if(intentos < 10){
            JOptionPane.showMessageDialog(null,"Noraboa! Acertaches en "+intentos+ " intentos");  
        } else  {
            JOptionPane.showMessageDialog(null,"Non acertaches. A palabra era "+cadeaAdivinhar);
        }  


        
    }
}