public class Cliente implements Comparable{

    private String nome;
    private Cidade cidade;

    
    public Cliente(String nome, Cidade cidade) {
        this.nome = nome;
        this.cidade = cidade;
    }


    public String getNome() {
        return nome;
    }


    public void setNome(String nome) {
        this.nome = nome;
    }


    public Cidade getCidade() {
        return cidade;
    }


    public void setCidade(Cidade cidade) {
        this.cidade = cidade;
    }


    @Override
    public int compareTo(Object o) {
        Cliente cliente = (Cliente)o;
        if (this.cidade.getPoblacion() > cliente.getCidade()) {
            
        }
    }
    
}