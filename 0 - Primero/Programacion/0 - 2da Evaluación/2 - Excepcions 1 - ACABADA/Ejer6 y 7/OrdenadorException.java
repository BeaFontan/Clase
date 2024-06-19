
public class OrdenadorException extends Exception{

    private String mensaxeErro;
    private String numeroSerie;

    public OrdenadorException(String numeroSerie, String mensaxeErro){
        this.numeroSerie = numeroSerie;
        this.mensaxeErro = mensaxeErro;
        
    }

    public String getMessage() {
        return mensaxeErro + " " + numeroSerie;
    }

    @Override
    public String toString() {
        return "mensaxe Erro=" + mensaxeErro;
    }
   
}
