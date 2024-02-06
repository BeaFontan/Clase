//Empregando as clases do exercicio anterior, define unha clase AppExercicio7 que defina un array de 3 ordenadores.
// A continuación se pedirán os valores por teclado para eses 3 ordenadores con JOptionPane. O programa deberá controlar 
//todas as excepcións posibles de entrada de datos, de modo que se un ordenador non se pode montar non se engadirá ao array. 
//As restriccións do exercicio anterior tamén deben impedir engadir un ordenador ao array. Cada vez que se lance unha excepción deberá saír
// por consola unha descrición da mesma.

//Unha vez introducidos valores correctos para os 3 ordenadores, o programa mostrará as características deses 3 ordenadores.

import javax.swing.JOptionPane;

public class AppExercicio7 {

    public static void main(String[] args) throws OrdenadorException {

        
        Ordenador [] arrayOrdenadors = new Ordenador[3];


        for (int i = 0; i < arrayOrdenadors.length; i++) {
            
      
            String numeroSerie =  JOptionPane.showInputDialog("Dime o número de serie");
     
            
            
            String m_capacidadeString = JOptionPane.showInputDialog("Dime a capacidade da memoria");
            int m_capacidade = Integer.parseInt(m_capacidadeString);
      
    
            String m_tipo = JOptionPane.showInputDialog("Dime o tipo de memoria");

            String m_velocidade_String = JOptionPane.showInputDialog("Dime a velocidade da memoria");
            int m_velocidade = Integer.parseInt(m_velocidade_String);

            String d_capaString = JOptionPane.showInputDialog("Dime a capacidade do disco");
            double d_capacidade = Double.parseDouble(d_capaString);


            String d_tipo = JOptionPane.showInputDialog("Dime o tipo de disco");
         
            

            String d_velocidade_String = JOptionPane.showInputDialog("Dime a velocidade do disco");
            int d_velocidade = Integer.parseInt(d_velocidade_String);

            String p_modelo = JOptionPane.showInputDialog("Dime o modelo do procesador");
         
            

            String p_velocidade_String = JOptionPane.showInputDialog("Dime a velociade do procesador");
            double p_velocidade = Double.parseDouble(p_velocidade_String);

            String prezoString = JOptionPane.showInputDialog("Dime o prezo");
            int prezo = Integer.parseInt(prezoString);

            Ordenador ord;
            boolean repetir = false;

            try {
                ord = new Ordenador(numeroSerie, m_capacidade, m_tipo, m_velocidade, d_capacidade, d_tipo, d_velocidade, p_modelo, p_velocidade, prezo);
            } catch (OrdenadorException e) {
                System.out.println(e.getMessage());
                repetir = true;
            } catch(Exception e){
                System.out.println("Hay datos mal introducidos");
            }
            
            //le hago esto para que en caso de que salte la excepción, el bucle disminuya uno y vuelva a pedir esa posición que nos queda atrás
           if (repetir == true) {
            i--;
           }

            ord = arrayOrdenadors[i];

        }

        for (Ordenador ordenador : arrayOrdenadors) {
            System.out.println(ordenador.getNumeroSerie());
        }


    }


}