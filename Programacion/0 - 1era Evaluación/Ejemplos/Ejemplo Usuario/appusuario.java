

public class appusuario {


    public static void main(String[] args) {
            usuario bea = new usuario("Bea", 33);

             System.out.println("O nome é " + bea.getNome() + " e a idade é " + bea.getIdade());


             bea.setNome("Beatriz");
             
             System.out.println("O nome é " + bea.getNome());


             bea.setIdade(31);

             System.out.println("A idade é  " + bea.getIdade());

    }


}