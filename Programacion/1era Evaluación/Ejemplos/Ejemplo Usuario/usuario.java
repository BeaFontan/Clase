
public class usuario {

    private String nome;
    private int idade;


    //constructor

    public usuario(String nom, int idade){
        nom = nome;
        this.idade = idade;
    }



    //get y set para nombre
    public void setNome(String nome){
        this.nome = nome;

    }

    public String getNome()
    {
        return nome;
    }


    //get y set de idade
    public void setIdade(int idade){
        if (idade >=0 && idade < 150) {
            this.idade = idade;
        }
        
    }

    public int getIdade(){
        return idade;
    }


}