
public class produtoSenStockException extends Exception{

    private int codigoError;
    private String mensaxeErro = "Non hay stock suficiente";

    public produtoSenStockException(int codigoError, String mensaxeErro){
        super(mensaxeErro);
        this.codigoError = codigoError;
    }

    public int getCodigoError() {
        return codigoError;
    }

    public String getMensaxeErro() {
        return mensaxeErro;
    }

    @Override
    public String toString() {
        return "[codigoError=" + codigoError + ", mensaxeErro=" + mensaxeErro + "]";
    }

    
}