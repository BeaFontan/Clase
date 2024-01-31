
public class produtoSenStockException extends Exception{

    private int codigoError;
    private String mensaxeErro;

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
        return "produtoSenStockException [codigoError=" + codigoError + ", mensaxeErro=" + mensaxeErro + "]";
    }

    
}