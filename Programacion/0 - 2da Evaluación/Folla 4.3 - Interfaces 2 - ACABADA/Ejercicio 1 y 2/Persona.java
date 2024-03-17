public abstract class Persona {

    protected String nome;
    protected String apelidos;
    protected int idade;

    public Persona(String nome, String apelidos, int idade){
        this.nome=nome;
        this.apelidos = apelidos;
        this.idade = idade;
    }


    abstract String dameNome();

    abstract String dameDescripcion();



}