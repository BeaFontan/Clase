public class dinosaurio {

    private String nombre;
    private int idade;
    

    public dinosaurio(){
        nombre = "Alf";
        idade = 5;

    }

    public dinosaurio(String nom, int idad){
        nombre = nom;
        idade = idad;
    }

    //Métodos

    //Métodos para recoller datos (Set)
    public void setNome(String nombre){

        this.nombre = nombre;

    }

    public void setIdade(int idade){

        this.idade = idade;

    }

    //Métodos para devolver datos guardados (Get)

    public String getNome(){
        return nombre;
    }

    public int getIdade(){
        return idade;
    }
}