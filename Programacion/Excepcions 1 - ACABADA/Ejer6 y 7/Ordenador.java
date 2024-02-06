public class Ordenador {
    private Procesador p;
    private Memoria m;
    private DiscoDuro d;
    private int pvp;
    private String numeroSerie;

    public Ordenador(String numeroSerie, int m_capacidade, String m_tipo, int m_velocidade,
     double d_capacidade, String d_tipo, int d_velocidade, String p_modelo,
      double p_velocidade, int prezo ) throws OrdenadorException{

        String numSeriepeq = numeroSerie.substring(0,2);

        if (p_modelo.equals("i7") && !d_tipo.equals("SATA3")) {
            throw new OrdenadorException(numeroSerie, "Non coindice I7 con SATA3");
        }
        else if(numSeriepeq.equals("HP") && m_capacidade < 4){
            throw new OrdenadorException(numeroSerie, "Non coincide HP con menos de 4 de cap.");
        }
        
        this.numeroSerie=numeroSerie;
        m = new Memoria(m_capacidade, m_tipo, m_velocidade);
        d = new DiscoDuro(d_capacidade, d_tipo, d_velocidade);
        p = new Procesador(p_modelo, p_velocidade);
        pvp = prezo;
    
   
    }

    public Procesador getP() {
        return p;
    }

    public void setP(Procesador p) {
        this.p = p;
    }

    public Memoria getM() {
        return m;
    }

    public void setM(Memoria m) {
        this.m = m;
    }

    public DiscoDuro getD() {
        return d;
    }

    public void setD(DiscoDuro d) {
        this.d = d;
    }

    public int getPvp() {
        return pvp;
    }

    public void setPvp(int pvp) {
        this.pvp = pvp;
    }

    public String getNumeroSerie() {
        return numeroSerie;
    }

    public void setNumeroSerie(String numeroSerie) {
        this.numeroSerie = numeroSerie;
    }


    

}