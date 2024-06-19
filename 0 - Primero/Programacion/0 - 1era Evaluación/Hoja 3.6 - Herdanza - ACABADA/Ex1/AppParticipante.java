package Ex1;
public class AppParticipante {

    public static void main(String[] args) {
        
    Arbitro arb1 = new Arbitro();

    System.out.println(arb1.getNome() + arb1.getIdade() + arb1.getAnosArbitrando());



    Arbitro arb2 = new Arbitro("Manolo", 30, 5);

    System.out.println(arb2.getNome() + arb2.getIdade() + arb2.getAnosArbitrando());



    arb1.setNome("Paco");
    arb1.setIdade(20);
    arb1.setAnosArbitrando(3);

    System.out.println(arb1.getNome() + arb1.getIdade() + arb1.getAnosArbitrando());



    Xogador xog1 = new Xogador();

    System.out.println(xog1.getNome() + xog1.getIdade() + xog1.getPosto());


    Xogador xog2 = new Xogador("Pepe", 28, 7);

    System.out.println(xog2.getNome() + xog2.getIdade() + xog2.getPosto()); 


    xog1.setNome("Manuela");
    xog1.setIdade(22);
    xog1.setPosto(2);

    System.out.println(xog1.getNome() + xog1.getIdade() + xog1.getPosto()); 

    
    



    }
}