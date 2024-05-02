public class dinosaurio {

    private String nombre;
    private int idade;
    public static int numDinosaurios;
    

    public dinosaurio(){
        nombre = "Alf";
        idade = 5;
        numDinosaurios++;

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

    //función estática
    public static String eMaisVello(dinosaurio dinosaurio1, dinosaurio dinosaurio2){

        if (dinosaurio1.idade > dinosaurio2.idade) {
            return dinosaurio1.nombre;
        }
        else{
            return dinosaurio2.nombre;
        }

        
    }
}