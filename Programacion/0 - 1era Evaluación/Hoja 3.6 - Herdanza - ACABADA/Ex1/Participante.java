package Ex1;
public class Participante {

    private String nome;
    private int idade;


    public Participante(){
        nome = "Sen nome";
        idade = 0;
    }

    public Participante(String nome, int idade){

    this.nome = nome;
    this.idade = idade;
    }

    //get y set de nome

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    //get y set de idade

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }
}