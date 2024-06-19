import java.io.Serializable;

public class Temperatura implements Serializable{

    private static final long serialVersionUID = 1L;
    private double tempMaxima;
    private double tempMinima;
    private int dia;
    private String lugar;


    public Temperatura(double tempMaxima, double tempMinima, int dia, String lugar) {
        this.tempMaxima = tempMaxima;
        this.tempMinima = tempMinima;
        this.lugar = lugar;

        if (dia < 1 && dia > 366) {

            System.out.println("El día debe ser mayor que 1 y menor que 366, vuelve a introducirlo");
        
        }
        else{
            this.dia = dia;
        }
    }


    public double getTempMaxima() {
        return tempMaxima;
    }


    public void setTempMaxima(double tempMaxima) {
        this.tempMaxima = tempMaxima;
    }


    public double getTempMinima() {
        return tempMinima;
    }


    public void setTempMinima(double tempMinima) {
        this.tempMinima = tempMinima;
    }


    public int getDia() {
        return dia;
    }


    public void setDia(int dia) {
        this.dia = dia;
    }


    public String getLugar() {
        return lugar;
    }


    public void setLugar(String lugar) {
        this.lugar = lugar;
    }


    @Override
    public String toString() {
        return "tempMaxima=" + tempMaxima + ", tempMinima=" + tempMinima + ", dia=" + dia + ", lugar="
                + lugar;
    }

    
}