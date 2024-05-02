public class Cilindro {

private double radio;
private double altura;
public static final double PI = 3.1416;

//constructores
public Cilindro(){
    radio = 0;
    altura = 0;
}

public Cilindro(double radio, double altura){
    this.radio = radio;
    this.altura = altura;
}

//getters
public double getAltura() {
    return altura;
}

public double getRadio() {
    return radio;
}

//setters
public void setRadio(double radio) {
    this.radio = radio;
}

public void setAltura(double altura) {
    this.altura = altura;
}


//métodos estáticos
public static double calcArea(double radio, double altura){
    double area;
    area = 2* PI * (radio+altura);

    return area;

}

public static double calVolume(double radio, double altura){
    double volume;

    volume = PI * (radio*radio) * altura;
    
    return volume;


}

//métodos non estáticos

public double geTArea(){

    return calcArea(this.radio, this.altura);

}

public double getVolume(){

    return calVolume(this.radio, this.altura);


}

}