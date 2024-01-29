package Ex3;

class PlanetaHabitable extends Planeta{

    private int numeroPersoas;
    private int temperaturaMinima;
    private int temperaturaMaxima;


public PlanetaHabitable(){
    super();
    numeroPersoas = 0;
    temperaturaMinima = 0;
    temperaturaMaxima = 0;
}

public PlanetaHabitable(boolean accesible, String nome, int tamanho, int distanciaTerra, int numeroPersoas, int temperaturaMaxima, int temperaturaMinima){
    super(accesible, nome, tamanho, distanciaTerra);
    this.numeroPersoas = numeroPersoas;
    this.temperaturaMinima = temperaturaMinima;
    this.temperaturaMaxima = temperaturaMaxima;
}

// get y set

public int getNumeroPersoas() {
    return numeroPersoas;
}

public void setNumeroPersoas(int numeroPersoas) {
    this.numeroPersoas = numeroPersoas;
}




public int getTemperaturaMinima() {
    return temperaturaMinima;
}

public void setTemperaturaMinima(int temperaturaMinima) {
    this.temperaturaMinima = temperaturaMinima;
}




public int getTemperaturaMaxima() {
    return temperaturaMaxima;
}

public void setTemperaturaMaxima(int temperaturaMaxima) {
    this.temperaturaMaxima = temperaturaMaxima;
}

//metodo para listar todo.

public void listarTodo(){
    System.out.println(getNome() + getAccesible() + getTamanho() + getDistanciaTerra() + getNumeroPersoas() + getTemperaturaMinima() + getTemperaturaMaxima());
}

    
}