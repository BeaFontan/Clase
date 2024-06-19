public class AppDinosaurio {

    public static void main(String[] args) {
        
        dinosaurio din1 = new dinosaurio();

        din1.setNome("Paquito");
        din1.setIdade(6);
        din1.getNome();
        din1.getIdade();

        System.out.println("Din 1 chámase " + din1.getNome() + " é ten " + din1.getIdade() + " anos");



        dinosaurio din2 = new dinosaurio();

        din2.setNome("Pedrito");
        din2.setIdade(8);

        System.out.println("Din 1 chámase " + din2.getNome() + " é ten " + din2.getIdade() + " anos");


        dinosaurio din3 = new dinosaurio();

        din3.setNome("Anita");
        din3.setIdade(10);
        
        System.out.println("Din 1 chámase " + din3.getNome() + " é ten " + din3.getIdade() + " anos");

    }
}