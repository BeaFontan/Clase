package Ex1;
public class Xogador extends Participante{

    private int posto;

    public Xogador(){
        super();
        posto = 0;
    }

    public Xogador(String nome, int idade, int posto){
        super(nome,idade);
        this.posto = posto;

    }

    //get y set de Xogador

    public int getPosto() {
        return posto;
    }

    public void setPosto(int posto) {
        this.posto = posto;
    }

}