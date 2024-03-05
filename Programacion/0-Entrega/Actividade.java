public class Actividade {

    private int codActividade;
    private String nomeActividade;
    private int horasSemanais;
    private double prezoActividade;
    private String salaActividade;


    public Actividade(String nomeActividade, int horasSemanais, double prezoActividade, String salaActividade) {
        this.nomeActividade = nomeActividade;
        this.horasSemanais = horasSemanais;
        this.prezoActividade = prezoActividade;
        this.salaActividade = salaActividade;
        codActividade++;
    }


    public int getCodActividade() {
        return codActividade;
    }


    public void setCodActividade(int codActividade) {
        this.codActividade = codActividade;
    }


    public String getNomeActividade() {
        return nomeActividade;
    }


    public void setNomeActividade(String nomeActividade) {
        this.nomeActividade = nomeActividade;
    }


    public int getHorasSemanais() {
        return horasSemanais;
    }


    public void setHorasSemanais(int horasSemanais) {
        this.horasSemanais = horasSemanais;
    }


    public double getPrezoActividade() {
        return prezoActividade;
    }


    public void setPrezoActividade(double prezoActividade) {
        this.prezoActividade = prezoActividade;
    }


    public String getSalaActividade() {
        return salaActividade;
    }


    public void setSalaActividade(String salaActividade) {
        this.salaActividade = salaActividade;
    }


    
    @Override
    public String toString() {
        return "Actividade [codActividade=" + codActividade + ", nomeActividade=" + nomeActividade + ", horasSemanais="
                + horasSemanais + ", prezoActividade=" + prezoActividade + "]";
    }


    public String toStringParaFichero() {
        return codActividade + nomeActividade + horasSemanais + prezoActividade;
    }
    

    


    
}