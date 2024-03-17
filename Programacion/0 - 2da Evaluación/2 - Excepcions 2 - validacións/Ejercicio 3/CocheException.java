public class CocheException extends Exception{

    
    private String mensaxeErro;

    public CocheException(String mensaxeErro){
        this.mensaxeErro = mensaxeErro;
        
    }

    public String getMessage() {
        return mensaxeErro;
    }

    @Override
    public String toString() {
        return "mensaxe Erro: " + mensaxeErro;
    }

}