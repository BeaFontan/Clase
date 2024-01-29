public class Acuaticos extends Vehiculo implements Motor, Vela{

    protected String tipo;
    protected int capacidade;


    //CONSTRUCTOR

    public Acuaticos(int velocidadeActual, int velocidadeMaxima, String tipo, int capacidade) {
        this.velocidadeActual = velocidadeActual;
        this.velocidadeMaxima = velocidadeMaxima;
        this.tipo = tipo;
        this.capacidade = capacidade;
    }


    //MÉTODOS DE LA CLASE VEHÍCULO ABSTRACTA

    @Override
    int acelerar(int aumentar) {
        velocidadeActual += aumentar;
        return velocidadeActual;
    }

    @Override
    int frenar(int disminuir) {
        velocidadeActual += disminuir;
        return velocidadeActual;
    }

    @Override
    void mostrar() {
        System.out.println(velocidadeActual + " " + velocidadeMaxima + " " + tipo + " " + capacidade);
    }



    //MÉTODO DE LA INTERFAZ MOTOR
    @Override
    public int calculaRevolucionsMotor(int forza, int radio) {
        int revolucions;

        revolucions = forza * radio;

        return revolucions;
    
    }


    //MÉTODO DE LA INTERFAZ VELA
    @Override
    public int recomendarVelocidade(int velocidadeVento) {
        if (velocidadeVento > 60) {
            velocidadeActual = 0;

            return velocidadeActual;
        
        }
        else if (velocidadeVento < 10 ){
            velocidadeActual = 0;

            return velocidadeActual;
        }
        else{
            return velocidadeActual;
        }
    }

}