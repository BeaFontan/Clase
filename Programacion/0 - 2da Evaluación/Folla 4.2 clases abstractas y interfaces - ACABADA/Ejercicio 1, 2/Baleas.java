public class Baleas extends Mamiferos{

    private String nomeBalea;


    public Baleas(String nomeBalea) {
        this.nomeBalea = nomeBalea;
    }

    public String getNomeBalea() {
        return nomeBalea;
    }

    public void setNomeBalea(String nomeBalea) {
        this.nomeBalea = nomeBalea;
    }

    @Override
    void amamantarCrias() {
        System.out.println("A balea amanta ás suas crias");
    }


    
}