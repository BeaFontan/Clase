/*Define unha clase Figura con atributos area e cor. Define as súas clases derivadas Triangulo, Cadrado e
Círculo, cos atributo que consideres convenientes. Define (de modo automático se queres) os seus getters,
setters, e construtores con argumento. A
Crea unha clase AppFigura no que teñas un array de Figuras: 3 triángulos, 3 cadrados e 3 círculos. Percorre o
array e cambia a cor a “negro” daquelas figuras con área maior que 4.0.
Fai a continuación que a clase Figura implemente a interface Comparable, de forma que se chamas ao método
Arrays.sort( ) o array queda ordenado pola área.*/




import java.util.Arrays;

// Definición de la clase Figura
class Figura implements Comparable<Figura> {
    // Atributos
    protected double area;
    protected String cor;

    // Constructor con argumentos
    public Figura(double area, String cor) {
        this.area = area;
        this.cor = cor;
    }

    // Getters y setters
    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    // Método compareTo para implementar Comparable
    @Override
    public int compareTo(Figura otraFigura) {
        return Double.compare(this.area, otraFigura.area);
    }
}

// Clase derivada Triangulo
class Triangulo extends Figura {
    // Constructor con argumento
    public Triangulo(double area, String cor) {
        super(area, cor);
    }
}

// Clase derivada Cadrado
class Cadrado extends Figura {
    // Constructor con argumento
    public Cadrado(double area, String cor) {
        super(area, cor);
    }
}

// Clase derivada Círculo
class Circulo extends Figura {
    // Constructor con argumento
    public Circulo(double area, String cor) {
        super(area, cor);
    }
}

// Clase AppFigura
public class Ejer1 {
    public static void main(String[] args) {
        // Creación de array de Figuras: 3 triángulos, 3 cadrados y 3 círculos
        Figura[] figuras = {
            new Triangulo(3.5, "verde"),
            new Triangulo(6.0, "azul"),
            new Triangulo(2.0, "rojo"),
            new Cadrado(4.0, "amarillo"),
            new Cadrado(1.5, "verde"),
            new Cadrado(5.0, "azul"),
            new Circulo(3.0, "rojo"),
            new Circulo(7.0, "amarillo"),
            new Circulo(2.5, "verde")
        };

        // Cambiar la cor a "negro" de las figuras con área mayor que 4.0
        for (Figura figura : figuras) {
            if (figura.getArea() > 4.0) {
                figura.setCor("negro");
            }
        }

        // Ordenar el array por área
        Arrays.sort(figuras);

        // Mostrar el resultado
        for (Figura figura : figuras) {
            System.out.println("Área: " + figura.getArea() + ", Cor: " + figura.getCor());
        }
    }
}
