package Ex2;

class Conductores extends Traballador{

    private String matricula;

    public Conductores(){
        super();
        matricula = "Sin matrícula";
    }

    public Conductores(String dni, String nome, String apelidos, String matricula){
        super(dni, nome, apelidos);

        this.matricula = matricula;
    }

    //get y set de matrícula

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }
    
}