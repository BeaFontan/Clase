public class Morcego implements Voador{

    private String nome;

    


    public Morcego(String nome) {
        this.nome = nome;
    }




    @Override
    public void voa() {
        System.out.println("O animal pode voar");
    }




    public String getNome() {
        return nome;
    }




    public void setNome(String nome) {
        this.nome = nome;
    }

    
}