public class Estudante extends Persona implements Comparable{

    private String titulacion;



    public Estudante(String nome, String apelidos, int idade, String titulacion) {
        super(nome, apelidos, idade);
        this.titulacion = titulacion;
    }



    //MÉTODOS DE LA CLASE ABSTRACTA
    @Override
    String dameNome() {
        return nome;
    }

    @Override
    String dameDescripcion() {
        return nome + " " + apelidos + " " + idade + " " + titulacion;
    }



    @Override
    public int compareTo(Object objeto) {
       Estudante unEstudante = (Estudante) objeto;

       if (this.idade < unEstudante.idade) {
            return -1;
       }
       if (this.idade > unEstudante.idade) {
            return 1;
       }
       return 0;
    }

    
    
}