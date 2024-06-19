public class Terrestre extends Vehiculo implements Motor{

    protected int cantidadeRodas;
    protected String uso;


    //CONSTRUCTOR, OJO!!! INCLUYO TAMBIÉN LOS VALORES DE LA CLASE ABSTRACTA!!!!!

    public Terrestre(int velocidadeActual, int velocidadeMaxima, int cantidadeRodas, String uso) {
        this.velocidadeActual=velocidadeActual;
        this.velocidadeMaxima=velocidadeMaxima;
        this.cantidadeRodas = cantidadeRodas;
        this.uso = uso;
    }


    //MÉTODOS DE VEHÍCULO ABSTRACTA

    @Override
    int acelerar(int aumentar) {

        if (velocidadeActual > velocidadeMaxima) {
            return aumentar = 0;
        }
        else{
            velocidadeActual += aumentar;
            return velocidadeActual;
        }

        
    }

    @Override
    int frenar(int disminuir) {

            velocidadeActual -= disminuir;

            if (velocidadeActual < 0) {
                return disminuir = 0;

            }
            else{
                return velocidadeActual;
            }

    }

    @Override
    void mostrar() {
        System.out.println(velocidadeActual + " " + velocidadeMaxima + " " + cantidadeRodas + " " + uso);
    }


    //MÉTODOS DE MOTOR INTERFAXZ
    @Override
    public int calculaRevolucionsMotor(int forza, int radio) {
        int revolucions;

        revolucions = forza * radio;

        return revolucions;
    
    }

}