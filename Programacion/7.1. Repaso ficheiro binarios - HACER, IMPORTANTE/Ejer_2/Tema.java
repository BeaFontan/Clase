import java.io.Serializable;

public class Tema implements Serializable{

    private static final long serialVersionUID = 1L; 
    public static int id;
    private String nome;
    private String autor;
    private int ano;
    private String xenero;
    
    public Tema(String nome, String autor, int ano, String xenero) {
        this.nome = nome;
        this.autor = autor;
        this.ano = ano;
        this.xenero = xenero;
        id++;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public String getXenero() {
        return xenero;
    }

    public void setXenero(String xenero) {
        this.xenero = xenero;
    }

    @Override
    public String toString() {
        return "indice=" + id + "nome=" + nome + ", autor=" + autor + ", ano=" + ano + ", xenero=" + xenero;
    }


}