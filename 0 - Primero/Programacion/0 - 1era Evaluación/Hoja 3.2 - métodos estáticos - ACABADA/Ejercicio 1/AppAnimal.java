public class AppAnimal {

    public static void main(String[] args) {
        

            Animal animal1 = new Animal();
            Animal animal2 = new Animal(2, "Perro"); //no les pongo vivo porque de base ya está a true.
            Animal animal3 = new Animal(18, "Gato");
            Animal animal4 = new Animal(6, "Manolito");
    
            animal1.nace();
            animal1.getDados();

    
            animal2.nace();
            animal2.getDados();

    
            animal3.nace();
            animal3.getDados();
            animal3.morre();

            animal4.nace();
            animal4.getDados();
            animal4.morre();

            int numeroAnimal = Animal.numeroAnimais;
            System.out.println("O total de animais é: " + numeroAnimal);
        
    }
}