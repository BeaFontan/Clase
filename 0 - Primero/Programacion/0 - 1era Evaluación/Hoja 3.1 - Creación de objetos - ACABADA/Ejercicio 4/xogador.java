public class xogador {

    private String nome;
    private int idade;


    //constructores
    public xogador(){
        nome = "desconocido";
        idade = 0;
    }

    public xogador(String nom, int idad){
        nome = nom;
        idade = idad;
    }

    //get y set de nome

    //almacena el nombre
    public void setNome(String nomeNovo){
        nome = nomeNovo;
    }

    //develve el nombre
    public String getNome()
    {
        return nome;
    }



    //get y set de idade

    //almacena el nombre
    public void setIdade(int idadeNova){
        idade = idadeNova;
    }

    //devuelve, es decir, coge de los datos, la edad
    public int getIdade()
    {
        return idade;
    }



    


}