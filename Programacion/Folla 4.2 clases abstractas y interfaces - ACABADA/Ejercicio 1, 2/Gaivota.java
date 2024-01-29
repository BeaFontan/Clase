public class Gaivota implements Oviparo, Voador{

    private String nome;

    

    
    public Gaivota(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    


    @Override
    public void voa() {
        System.out.println("A gaivota voa");
    }

    @Override
    public void porOvos() {
        System.out.println("A gaivota pon ovos");
    }



    
}