public class DNIException extends Exception{

    private String mensaxeErro;

    public DNIException(String mensaxeErro){
        this.mensaxeErro = mensaxeErro;
        
    }

    public String getMessage() {
        return mensaxeErro;
    }

    @Override
    public String toString() {
        return "mensaxe Erro=" + mensaxeErro;
    }

    
}