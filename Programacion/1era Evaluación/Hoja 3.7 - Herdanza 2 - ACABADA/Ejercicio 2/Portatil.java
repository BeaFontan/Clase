public class Portatil extends Computador{

    private int peso;
    private String cor;


    public Portatil() {
     super();
     peso = 0;
     cor = "Sin color";       
        
    }

    public Portatil(String marca, String modelo, String procesador, String tarxetaGrafica, int peso, String cor){

        super(marca, modelo, procesador, tarxetaGrafica);
        this.peso = peso;
        this.cor = cor;
    }

        //Get y set de los atributos

    public int getPeso() {
        return peso;
    }

    public void setPeso(int peso) {
        this.peso = peso;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }


    //metodo
    public void listarAtributos(){
        System.out.println(getMarca() + " " + getModelo()  + " " +  getProcesador() + " " + getPeso() + " " +  getCor() + " " + Computador.getNumComputadores());
    }


    

    
}