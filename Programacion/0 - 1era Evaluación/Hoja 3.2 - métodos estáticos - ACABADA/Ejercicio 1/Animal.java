public class Animal {

    private int idade;
    private String nome;
    private boolean vivo;
    public static int numeroAnimais;

    //Constructores
    public Animal(){
        idade = 0;
        nome = "desconocido";
        vivo = true;
    }

    public Animal(int idad, String nom){
        idade = idad;
        nome = nom;
        vivo = true;

    }

    //Métodos

        public int getDados() {
        System.out.println("Nombre: " + nome + ", Edad: " + idade);
        return idade;
    }


    
    public void nace(){
   
            // pongo el boolean a true, aunque ya está de base
            numeroAnimais++;
            System.out.println("Benvido");
    
    }

    public void morre() {
  
            vivo = false;
            numeroAnimais--;
            System.out.println("Adiós");
        
    }



}





