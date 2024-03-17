public class Empregado {

    private String nome;
    private int numeroIdentificador;
    private String categoria;
    private double soldo;


    public Empregado(){
        nome = "Empregado";
        numeroIdentificador = 0;
        categoria = "Programador";
        soldo = 0;
    }

    public Empregado(String nome, int numeroIdentificador, String categoria, double soldo){
        this.nome = nome;
        this.numeroIdentificador = numeroIdentificador;
        this.categoria = categoria;
        this.soldo = soldo;

    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getNumeroIdentificador() {
        return numeroIdentificador;
    }

    public void setNumeroIdentificador(int numeroIdentificador) {
        this.numeroIdentificador = numeroIdentificador;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public double getSoldo() {
        return soldo;
    }

    public void setSoldo(double soldo) {

        if (this.categoria.equals("programador") && soldo >1100 && soldo < 1800) {
            this.soldo = soldo;
        }

        else if (this.categoria.equals("analista") && soldo >1500 && soldo < 2200) {
            this.soldo = soldo;
        }

        else if (this.categoria.equals("consultor") && soldo >1700 && soldo < 3500 ) {
            this.soldo = soldo;
        }

        else if (this.categoria.equals("directivo") && soldo >4000 && soldo < 4800) {
            this.soldo = soldo;
        }

        else{
            System.out.println("Categoría incorrecta ou soldo incorrecto");
        }

    }

    //METODO TO STRING
    public String toString(){
        return nome + numeroIdentificador + categoria + soldo;
    }
    

}