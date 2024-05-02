

public class Cidade implements Comparable{

    private String nome;
    private int poblacion;


    //CONSTRUCTOR
    public Cidade(String nome, int poblacion) {
        this.nome = nome;
        this.poblacion = poblacion;
    }


    //GETTER Y SETTERS
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public int getPoblacion() {
        return poblacion;
    }
    public void setPoblacion(int poblacion) {
        this.poblacion = poblacion;
    }

    
    //MÉTODO DE LA INTERFAZ COMPARABLE IMPLEMENTADA
    @Override
    public boolean compareTo(Object obj) {
        Cidade unhaCidade = (Cidade)obj;
        if (this.poblacion < unhaCidade.poblacion) {
            return -1;
        }
        if (this.poblacion > unhaCidade.poblacion ) {
            return 1;
        }
        return 0;
    }
    
}