package Ex3;

class Planeta {

    private boolean accesible;
    private String nome;
    private int tamanho;
    private int distanciaTerra;
    private static int numPlanetasAccesibles = 0;


public Planeta(){
    accesible = true; // asumo que es accesible de base
    nome = "sen nome";
    tamanho = 0;
    distanciaTerra = 0; 
}

public Planeta(boolean accesible, String nome, int tamanho, int distanciaTerra){
    this.accesible = accesible;
    this.tamanho = tamanho;
    this.nome = nome;
    this.accesible = accesible;
    this.distanciaTerra = distanciaTerra;
    numPlanetasAccesibles++;//aumenta en 1 cada vez que creas un nuevo planeta.
}

//getters e setter

//accedisble
public boolean getAccesible(){
    return accesible;
}

public void setAccesible(boolean accesible){
    this.accesible = accesible;
}



//tamaño

public int getTamanho() {
    return tamanho;
}

public void setTamanho(int tamanho) {
    this.tamanho = tamanho;
}


//distancia terra

public int getDistanciaTerra() {
    return distanciaTerra;
}

public void setDistanciaTerra(int distanciaTerra) {
    this.distanciaTerra = distanciaTerra;
}


//nome

public String getNome() {
    return nome;
}
public void setNome(String nome) {
    this.nome = nome;
}



//para acceder al statico privado
public static int getNumPlanetasAccesibles() {
    return numPlanetasAccesibles;
}


//Método éxploto donde cambia el valor de accesible a false y disminuye el número de planetas

public void explotou(){
    accesible = false;
    numPlanetasAccesibles--;
}






}