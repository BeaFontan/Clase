public class Computador {

    private String marca;
    private String modelo;
    private String procesador;
    private String tarxetaGrafica;

    private static int numComputadores;

    public Computador(){
        marca = "Sin marca";
        modelo = "Sin modelo";
        procesador = "Sin procesador";
        tarxetaGrafica = "Sin tarxeta";
    }

    public Computador(String marca, String modelo, String procesador, String tarxetaGrafica){
        this.marca = marca;
        this.modelo = modelo;
        this.procesador = procesador;
        this.tarxetaGrafica = tarxetaGrafica;

        numComputadores++;
    }

    //get y set
    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getProcesador() {
        return procesador;
    }

    public void setProcesador(String procesador) {
        this.procesador = procesador;
    }

    public String getTarxetaGrafica() {
        return tarxetaGrafica;
    }

    public void setTarxetaGrafica(String tarxetaGrafica) {
        this.tarxetaGrafica = tarxetaGrafica;
    }


    //get y set de los estáticos

    public static int getNumComputadores() {
        return numComputadores;
    }

    public static void setNumComputadores(int numComputadores) {
        Computador.numComputadores = numComputadores;
    }

    
}