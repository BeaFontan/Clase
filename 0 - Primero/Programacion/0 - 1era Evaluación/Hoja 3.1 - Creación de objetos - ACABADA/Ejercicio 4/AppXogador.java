public class AppXogador {

    public static void main(String[] args) {
        
    xogador jugador1 = new xogador();

    System.out.println("O xogador é " + jugador1.getNome() + " e a idade é " + jugador1.getIdade());

    jugador1.setNome("Roi");
    jugador1.setIdade(30);

    System.out.println("O xogador é " + jugador1.getNome() + " e a idade é " + jugador1.getIdade());


    }
}