public import javax.swing.JOptionPane;
import java.util.Arrays;

// Definición de la clase Barco
class Barco {
    private String nome;
    private int numeroTripulantes;
    private double capacidadeCarga;

    // Constructor con argumentos
    public Barco(String nome, int numeroTripulantes, double capacidadeCarga) {
        this.nome = nome;
        this.numeroTripulantes = numeroTripulantes;
        this.capacidadeCarga = capacidadeCarga;
    }

    // Método toString para mostrar los datos del barco
    @Override
    public String toString() {
        return "Barco: " + nome + ", Tripulantes: " + numeroTripulantes + ", Capacidade de carga: " + capacidadeCarga;
    }
}

// Definición de la clase GPS
class GPS {
    private double coordenadaX;
    private double coordenadaY;
    private String fecha;
    private String hora;

    // Constructor con argumentos
    public GPS(double coordenadaX, double coordenadaY, String fecha, String hora) {
        this.coordenadaX = coordenadaX;
        this.coordenadaY = coordenadaY;
        this.fecha = fecha;
        this.hora = hora;
    }
}

// Definición de la clase abstracta Tripulante
abstract class Tripulante implements Comparable<Tripulante> {
    protected String DNI;
    protected int idade;
    protected int diasEmpresa;
    protected String nome;
    protected double soldo;
    protected Barco barco;

    // Constructor con argumentos
    public Tripulante(String DNI, int idade, int diasEmpresa, String nome, double soldo, Barco barco) {
        this.DNI = DNI;
        this.idade = idade;
        this.diasEmpresa = diasEmpresa;
        this.nome = nome;
        this.soldo = soldo;
        this.barco = barco;
    }

    // Métodos abstractos a ser implementados por las clases derivadas
    public abstract double calculaSoldo();
    public abstract void mostraDatos();

    // Método compareTo para implementar Comparable
    @Override
    public int compareTo(Tripulante otroTripulante) {
        return Double.compare(this.calculaSoldo(), otroTripulante.calculaSoldo());
    }
}

// Definición de la clase Capitán, derivada de Tripulante
class Capitan extends Tripulante {
    private int horasExperiencia;
    private double bono;

    // Constructor con argumentos
    public Capitan(String DNI, int idade, int diasEmpresa, String nome, double soldo, Barco barco, int horasExperiencia) {
        super(DNI, idade, diasEmpresa, nome, soldo, barco);
        this.horasExperiencia = horasExperiencia;
        this.bono = calculaBono();
    }

    // Método para calcular el bono del capitán
    public double calculaBono() {
        if (horasExperiencia > 20000) {
            return soldo * 0.50;
        } else if (horasExperiencia > 10000) {
            return soldo * 0.40;
        } else if (horasExperiencia > 5000) {
            return soldo * 0.20;
        } else {
            return 0;
        }
    }

    // Método para calcular el soldo total del capitán
    public double calculaSoldo() {
        return soldo + bono;
    }

    // Método para mostrar los datos del capitán
    public void mostraDatos() {
        System.out.println("Capitán: " + nome + ", Soldo total: " + calculaSoldo());
    }
}

// Definición de la clase XefeFlota
class XefeFlota extends Tripulante {
    private int pesoPeixe;
    private int pesoMarisco;
    private double bonoPeixe;
    private double bonoMarisco;

    // Constantes
    private static final double SOLDONORMAL = 200000;

    // Constructor con argumentos
    public XefeFlota(String DNI, int idade, int diasEmpresa, String nome, Barco barco, int pesoPeixe, int pesoMarisco) {
        super(DNI, idade, diasEmpresa, nome, SOLDONORMAL, barco);
        this.pesoPeixe = pesoPeixe;
        this.pesoMarisco = pesoMarisco;
        this.bonoPeixe = calculaBono(pesoPeixe, 1.5);
        this.bonoMarisco = calculaBono(pesoMarisco, 2.0);
    }

    // Método para calcular el bono de peixe ou marisco
    private double calculaBono(int peso, double factor) {
        return peso * factor;
    }

    // Método para calcular el soldo total del Xefe de Flota
    public double calculaSoldo() {
        return SOLDONORMAL + bonoPeixe + bonoMarisco;
    }

    // Método para mostrar los datos del Xefe de Flota
    public void mostraDatos() {
        System.out.println("Xefe de flota: " + nome + ", Soldo total: " + calculaSoldo());
    }
}

// Definición de la clase Mariñeiro
class Marineiro extends Tripulante {
    private int pesoTotalPescado;
    private float bono;

    // Constante
    private static final double SOLDONORMAL = 40000;

    // Constructor con argumentos
    public Marineiro(String DNI, int idade, int diasEmpresa, String nome, Barco barco, int pesoTotalPescado) {
        super(DNI, idade, diasEmpresa, nome, SOLDONORMAL, barco);
        this.pesoTotalPescado = pesoTotalPescado;
        this.bono = calculaBono();
    }

    // Método para calcular el bono del marinero
    private float calculaBono() {
        if (pesoTotalPescado >= 1) {
            return (float) (soldo * 0.25);
        } else {
            return 0;
        }
    }

    // Método para calcular el soldo total del marinero
    public double calculaSoldo() {
        return soldo + bono;
    }

    // Método para mostrar los datos del marinero
    public void mostraDatos() {
        System.out.println("Mariñeiro: " + nome + ", Soldo total: " + calculaSoldo());
    }
}

// Clase principal
public class Ejer2 {
    public static void main(String[] args) {
        // Crear objetos Barco
        Barco barco1 = new Barco("Barco1", 5, 100);
        Barco barco2 = new Barco("Barco2", 6, 120);

        // Crear array con 2 capitáns (cada uno en su barco)
        Capitan[] capitanes = {
            new Capitan(JOptionPane.showInputDialog("DNI del Capitán 1"), Integer.parseInt(JOptionPane.showInputDialog("Edad del Capitán 1")), Integer.parseInt(JOptionPane.showInputDialog("Días en la empresa del Capitán 1")), JOptionPane.showInputDialog("Nombre del Capitán 1"), 60000, barco1, Integer.parseInt(JOptionPane.showInputDialog("Horas de experiencia del Capitán 1"))),
            new Capitan(JOptionPane.showInputDialog("DNI del Capitán 2"), Integer.parseInt(JOptionPane.showInputDialog("Edad del Capitán 2")), Integer.parseInt(JOptionPane.showInputDialog("Días en la empresa del Capitán 2")), JOptionPane.showInputDialog("Nombre del Capitán 2"), 60000, barco2, Integer.parseInt(JOptionPane.showInputDialog("Horas de experiencia del Capitán 2")))
        };

        // Asignar 3 mariñeiros a cada barco
        Tripulante[] tripulantes = {
            new Marineiro(JOptionPane.showInputDialog("DNI del Marinero 1"), Integer.parseInt(JOptionPane.showInputDialog("Edad del Marinero 1")), Integer.parseInt(JOptionPane.showInputDialog("Días en la empresa del Marinero 1")), JOptionPane.showInputDialog("Nombre del Marinero 1"), barco1, Integer.parseInt(JOptionPane.showInputDialog("Peso total de pescado del Marinero 1"))),
            new Marineiro(JOptionPane.showInputDialog("DNI del Marinero 2"), Integer.parseInt(JOptionPane.showInputDialog("Edad del Marinero 2")), Integer.parseInt(JOptionPane.showInputDialog("Días en la empresa del Marinero 2")), JOptionPane.showInputDialog("Nombre del Marinero 2"), barco1, Integer.parseInt(JOptionPane.showInputDialog("Peso total de pescado del Marinero 2"))),
            new Marineiro(JOptionPane.showInputDialog("DNI del Marinero 3"), Integer.parseInt(JOptionPane.showInputDialog("Edad del Marinero 3")), Integer.parseInt(JOptionPane.showInputDialog("Días en la empresa del Marinero 3")), JOptionPane.showInputDialog("Nombre del Marinero 3"), barco1, Integer.parseInt(JOptionPane.showInputDialog("Peso total de pescado del Marinero 3"))),
            new Marineiro(JOptionPane.showInputDialog("DNI del Marinero 4"), Integer.parseInt(JOptionPane.showInputDialog("Edad del Marinero 4")), Integer.parseInt(JOptionPane.showInputDialog("Días en la empresa del Marinero 4")), JOptionPane.showInputDialog("Nombre del Marinero 4"), barco2, Integer.parseInt(JOptionPane.showInputDialog("Peso total de pescado del Marinero 4"))),
            new Marineiro(JOptionPane.showInputDialog("DNI del Marinero 5"), Integer.parseInt(JOptionPane.showInputDialog("Edad del Marinero 5")), Integer.parseInt(JOptionPane.showInputDialog("Días en la empresa del Marinero 5")), JOptionPane.showInputDialog("Nombre del Marinero 5"), barco2, Integer.parseInt(JOptionPane.showInputDialog("Peso total de pescado del Marinero 5"))),
            new Marineiro(JOptionPane.showInputDialog("DNI del Marinero 6"), Integer.parseInt(JOptionPane.showInputDialog("Edad del Marinero 6")), Integer.parseInt(JOptionPane.showInputDialog("Días en la empresa del Marinero 6")), JOptionPane.showInputDialog("Nombre del Marinero 6"), barco2, Integer.parseInt(JOptionPane.showInputDialog("Peso total de pescado del Marinero 6")))
        };

        // Crear objeto XefeFlota
        XefeFlota jefeFlota = new XefeFlota(JOptionPane.showInputDialog("DNI del Jefe de Flota"), Integer.parseInt(JOptionPane.showInputDialog("Edad del Jefe de Flota")), Integer.parseInt(JOptionPane.showInputDialog("Días en la empresa del Jefe de Flota")), JOptionPane.showInputDialog("Nombre del Jefe de Flota"), barco1, Integer.parseInt(JOptionPane.showInputDialog("Peso de peixe")), Integer.parseInt(JOptionPane.showInputDialog("Peso de marisco")));

        // Calcular bono y soldo para los capitanes
        for (Capitan capitan : capitanes) {
            capitan.calculaBono();
            capitan.calculaSoldo();
        }

        // Calcular bono y soldo para el Xefe de Flota
        jefeFlota.calculaBono();
        jefeFlota.calculaSoldo();

        // Calcular bono y soldo para los marineros
        for (Tripulante tripulante : tripulantes) {
            tripulante.calculaSoldo();
        }

        // Listar todos los componentes del array con un único bucle
        System.out.println("Lista de Tripulantes:");
        for (Tripulante tripulante : tripulantes) {
            tripulante.mostraDatos();
        }

        // Ordenar el array de tripulantes por soldo
        Arrays.sort(tripulantes);

        // Mostrar el array ordenado por soldo
        System.out.println("\nLista de Tripulantes ordenada por soldo:");
        for (Tripulante tripulante : tripulantes) {
            tripulante.mostraDatos();
        }
    }
}
 {
    
}
