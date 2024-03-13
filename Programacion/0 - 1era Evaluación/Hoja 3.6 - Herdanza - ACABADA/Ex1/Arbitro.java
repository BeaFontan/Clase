package Ex1;
public class Arbitro extends Participante{

    private int anosArbitrando;


    public Arbitro(){
        super(); // le paso el constructor del padre sin parametrizar.
        anosArbitrando = 0;

    }

public Arbitro(String nome, int idade, int anosArbitrando){
    super(nome,idade);

    this.anosArbitrando = anosArbitrando;
}

//get y set de arbitro

public int getAnosArbitrando() {
    return anosArbitrando;
}

public void setAnosArbitrando(int anosArbitrando) {
    this.anosArbitrando = anosArbitrando;
}


}