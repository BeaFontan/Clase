import java.io.Serializable;

public class Participante implements Serializable{//implementa serializable para poder ser leído y escrito

    private String nome;
    private String apelidos;
    private transient int idade;

    
    public Participante(String nome, String apelidos, int idade) {
        this.nome = nome;
        this.apelidos = apelidos;
        this.idade = idade;
    }


    public String getNome() {
        return nome;
    }


    public void setNome(String nome) {
        this.nome = nome;
    }


    public String getApelidos() {
        return apelidos;
    }


    public void setApelidos(String apelidos) {
        this.apelidos = apelidos;
    }


    public int getIdade() {
        return idade;
    }


    public void setIdade(int idade) {
        this.idade = idade;
    }




}