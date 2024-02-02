class Memoria{
  
    static final int MIN_MEM=2;
    private int capacidade;
    private String tipo;
    private int velocidade;

    Memoria(int capacidade, String tipo, int velocidade){
        if(capacidade < MIN_MEM){
          this.capacidade = MIN_MEM;
        } else {
          this.capacidade = capacidade; 
        }
        this.tipo = tipo;
        this.velocidade = velocidade;
    }
    int getCapacidade(){
        return capacidade;
    }
}