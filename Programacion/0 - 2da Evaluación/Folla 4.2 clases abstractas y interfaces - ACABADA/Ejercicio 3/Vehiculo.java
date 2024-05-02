public abstract class Vehiculo{

    protected int velocidadeActual;
    protected int velocidadeMaxima;


    abstract int acelerar(int aumentar);

    abstract int frenar(int disminuir);

    abstract void mostrar();



}