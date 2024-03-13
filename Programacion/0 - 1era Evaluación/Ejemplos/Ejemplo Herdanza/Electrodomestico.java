public class Electrodomestico {

    protected String codigo; // lo pongo protected para que puedan acceder las clases hijas, lo podríamos hacer con private también, porque tenemos get y set
    private int prezo;

    public Electrodomestico(){

        codigo = "Sin asignar";
        prezo = 0;
    }

    public Electrodomestico(String codigo, int prezo){
        this.codigo = codigo;
        this.prezo = prezo;
    }

    //get set de codigo
    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    //get set de prezo
    public int getPrezo() {
        return prezo;
    }

    public void setPrezo(int prezo) {
    this.prezo = prezo;
}



}