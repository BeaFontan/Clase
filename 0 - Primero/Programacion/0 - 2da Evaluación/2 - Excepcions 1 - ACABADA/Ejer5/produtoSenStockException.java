
public class produtoSenStockException extends Exception{

    private int codigoError;
    private String mensaxeErro;

    public produtoSenStockException(){
        super("Non hay stock suficiente");
        this.codigoError = 101;
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