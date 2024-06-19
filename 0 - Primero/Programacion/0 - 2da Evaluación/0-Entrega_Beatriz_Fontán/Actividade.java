public class Actividade {

    public static int codActividade;
    private String nomeActividade;
    private int horasSemanais;
    private double prezoActividade;
    private String salaActividade;
    private int codActividadePrivado;


    public Actividade(String nomeActividade, int horasSemanais, double prezoActividade, String salaActividade) {
        codActividade++;
        this.nomeActividade = nomeActividade;
        this.horasSemanais = horasSemanais;
        this.prezoActividade = prezoActividade;
        this.salaActividade = salaActividade;
        codActividadePrivado = codActividade;

    }

    public int getCodActividadePrivado() {
        return codActividadePrivado;
    }


    public int getCodActividade() {
        return codActividade;
    }


    public void setCodActividade(int codActividade) {
        Actividade.codActividade = codActividade;
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
        return "Actividade [codActividade=" + codActividadePrivado + ", nomeActividade=" + nomeActividade + ", horasSemanais="
                + horasSemanais + ", prezoActividade=" + prezoActividade + "]";
    }


    public String toStringParaFichero() {
        return nomeActividade + ";" + horasSemanais + ";" + prezoActividade + ";" + salaActividade;
    }
    

    


    
}