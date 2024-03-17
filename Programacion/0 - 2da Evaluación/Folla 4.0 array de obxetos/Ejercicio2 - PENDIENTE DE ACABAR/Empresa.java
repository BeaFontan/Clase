
public class Empresa{

    private String nome;
    private String CIF;
    private String localidade;
    private Empregado[] arrayEmpregado;
    private static int numEmpregados;

    public Empresa(){
        nome = "Sen nome";
        CIF = "Sen CIF";
        localidade = "Sen localidade";
        arrayEmpregado = new Empregado[6];
    }

    public Empresa(String nome, String CIF, String localidade, int maxEmpregados){
        this.nome = nome;
        this.CIF = CIF;
        this.localidade = localidade;
        this.arrayEmpregado = new Empregado[maxEmpregados];


    }

        //a) Obter o nome da empresa.
    public String getNome() {
        return nome;
    }


    public void setNome(String nome) {
        this.nome = nome;
    }

    //b) Obter o CIF da empresa.
    public String getCIF() {
        return CIF;
    }

    public void setCIF(String cIF) {
        CIF = cIF;
    }

    public String getLocalidade() {
        return localidade;
    }

    public void setLocalidade(String localidade) {
        this.localidade = localidade;
    }

    public Empregado[] getArrayEmpregado() {
        return arrayEmpregado;
    }

    public void setArrayEmpregado(Empregado[] arrayEmpregado) {
        this.arrayEmpregado = arrayEmpregado;
    }



    //c) Obter o número de empregados dunha empresa.
    public int getnumEmpregados(){
        return numEmpregados;
    }


    //d) Comprobar se un empregado pertence á empresa.

    public String comprobarEmpregado(String nomeEmpregado){
        String pertenece;
        
        for (int i = 0; i < getArrayEmpregado().length; i++) {
            if (nome.equals(nomeEmpregado)) {
                pertenece = "Pertence a empresa";
                return pertenece;
            }

        }
        return "Non pertence";
     
    }

    //e) Obter o nome dun empregado a partir do seu número de identificación.


    //Me quedé aquíiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
    public String obterNome(int numIdent){
        for (int i = 0; i < arrayEmpregado.length; i++) {
            if () {
                
            }
        }
    }

    
    
}

