public class Ornitorrinco extends Mamiferos implements Oviparo
{
    private String nomeOrni;

    
    public Ornitorrinco(String nomeOrni) {
        this.nomeOrni = nomeOrni;
    }

    public String getNomeOrni() {
        return nomeOrni;
    }

    public void setNomeOrni(String nomeOrni) {
        this.nomeOrni = nomeOrni;
    }

    @Override
    void amamantarCrias() {
        System.out.println("O ornitorrinco amamanta as suas crías");

    }

    @Override
    public void porOvos() {
        System.out.println("O ornitorrinco pon ovos");
    }

    
}