public class Empregado extends Persona{

    private double soldo;

    
    //CONSTRUCTOR
    public Empregado(String nome, String apelidos, int idade, double soldo) {
        super(nome, apelidos, idade);
        this.soldo = soldo;
    }

    //MÉTODO GET
    public double getSoldo() {
        return soldo;
    }


    //MÉTODOS DE LA CLASE ABSTRACTA PERSONA
    @Override
    String dameNome() {
        return nome;
    }

    @Override
    String dameDescripcion() {
        return nome + " " + apelidos + " " + idade + " " + soldo;
    }



}