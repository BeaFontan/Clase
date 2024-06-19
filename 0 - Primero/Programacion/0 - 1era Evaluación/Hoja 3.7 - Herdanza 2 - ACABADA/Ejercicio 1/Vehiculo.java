public class Vehiculo {

    private String matricula;
    private boolean alugado = false;

    public Vehiculo(){
        this.matricula = "0000AAA";
        this.alugado = false;
    }

    public Vehiculo(String matricula, boolean alugado){
        this.matricula = matricula;
        this.alugado = alugado;
    }


    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public boolean getAlugado(){
        return alugado;
    }

    public void setAlugado(boolean alugado){
        this.alugado = alugado;
    }

}