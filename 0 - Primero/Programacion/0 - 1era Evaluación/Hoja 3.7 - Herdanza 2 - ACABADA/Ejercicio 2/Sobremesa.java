public class Sobremesa extends Computador{

    private boolean wifi;
    private int numDiscos;

    public Sobremesa(){

        wifi = false;
        numDiscos = 0;

    }

    public Sobremesa(String marca, String modelo, String procesador, String targetaGrafica, boolean wifi, int numDiscos){

        super(marca, modelo, procesador, targetaGrafica);
        this.wifi = wifi;
        this.numDiscos = numDiscos;
    }

    //getter y setters

    public boolean getWifi() {
        return wifi;
    }

    public void setWifi(boolean wifi) {
        this.wifi = wifi;
    }

    public int getNumDiscos() {
        return numDiscos;
    }

    public void setNumDiscos(int numDiscos) {
        this.numDiscos = numDiscos;
    }


    //metodo
    public void listarAtributos(){
        System.out.println(getMarca() + " " + getModelo()  + " " +  getProcesador()  + " " + getWifi() + " " + getNumDiscos() + " " + Computador.getNumComputadores());
    }
    
    

    
}