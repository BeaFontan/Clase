//8. Define unha clase Corredor, con nome, DNI, e marca en 100m. As marcas de 100m gárdanse en
//segundos, décimas e centésimas de segundo. Fai de forma automática os getters, setters, e o método
//toString(). Modifica a frase ao teu xeito e comproba que se creas 2 xogadores, e os mostras con
//System.out.println(corredor1) o que sae por pantalla é o que está definido no método toString().
//Y ejercicio 10

public class CorredorEjer8 {

    private String nome;
    private String DNI;
    private double marca;


    public CorredorEjer8(String nome, String dNI, double marca) {
        this.nome = nome;
        DNI = dNI;
        this.marca = marca;
    }
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public String getDNI() {
        return DNI;
    }
    public void setDNI(String dNI) {
        DNI = dNI;
    }
    public double getMarca() {
        return marca;
    }
    public void setMarca(double marca) {

        this.marca = marca;
    }

    @Override
    public String toString() {
        return "[Os datos do corredor son: nome=" + nome + ", DNI=" + DNI + ", marca=" + marca + "]";
    }




    
}