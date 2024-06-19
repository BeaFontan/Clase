public class Cliente implements Comparable{

    private String nomeCliente;
    private Cidade cidade;

    
    public Cliente( String nomeCliente, Cidade cidade) {
        this.nomeCliente = nomeCliente;
        this.cidade = cidade;
    }


    public String getNome() {
        return nomeCliente;
    }


    public void setNome(String nomeCliente) {
        this.nomeCliente = nomeCliente;
    }


    public Cidade getCidade() {
        return cidade;
    }


    public void setCidade(Cidade cidade) {
        this.cidade = cidade;
    }


    @Override
    public int compareTo(Object obj) {
        Cliente cliente = (Cliente)obj;
        if (this.getCidade().getPoblacion() < cliente.getCidade().getPoblacion()) {
            return -1;
        }

        if (this.getCidade().getPoblacion() > cliente.getCidade().getPoblacion()) {
            return 1;
        }

        return 0;
    }

    
}