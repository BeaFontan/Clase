public class Turismo extends Vehiculo{

    private double precioKm;
    private int kmAlquiler;
    private int kmDevolucion;

    private static int numTurismos = 0;
    private static int numTurismosAlquilados = 0;

    public Turismo(String matricula,boolean alugado, double precioKm, int kmAlquiler, int kmDevolucion){
        super(matricula, alugado);
        this.precioKm = precioKm;
        this.kmAlquiler = kmAlquiler;
        this.kmDevolucion = kmDevolucion;
        numTurismos++;

    }

    public double getPrecioKm() {
        return precioKm;
    }

    public void setPrecioKm(int precioKm) {
        this.precioKm = precioKm;
    }


    public double getKmAlquiler() {
        return kmAlquiler;
    }

    public void setKmAlquiler(int kmAlquiler) {
        this.kmAlquiler = kmAlquiler;
    }


    public int getKmDevolucion() {
        return kmDevolucion;
    }

    public void setKmDevolucion(int kmDevolucion) {
        this.kmDevolucion = kmDevolucion;
    }


    //metodos para mostrar los estáticos

    public static int getNumTurismos() {
        return numTurismos;
    }
    
    public static void setNumTurismos(int numTurismos) {
        Turismo.numTurismos = numTurismos;
    }

    public static int getNumTurismosAlquilados() {
        return numTurismosAlquilados;
    }

    public static void setNumTurismosAlquilados(int numTurismosAlquilados) {
        Turismo.numTurismosAlquilados = numTurismosAlquilados;
    }


    //metodos
    public void alugar(int kmAlquiler){
        if (getAlugado() == true) {

            System.out.println("O vehículo está alugado, elixe outro");
            
        }
        else{
            System.out.println("O vehículo está disponible" + getKmDevolucion());
            setAlugado(true);
            this.kmAlquiler = kmAlquiler;
            numTurismosAlquilados++;

        }
    }


    public double devolver(int kmDevolucion){

        int kilometrosACobrar;
        double prezoAPagar;

        kilometrosACobrar = kmDevolucion - kmAlquiler;

        prezoAPagar = kilometrosACobrar * precioKm;
        numTurismosAlquilados--;

        setAlugado(false);//le indico con esto que ya no está alugado

        return prezoAPagar;

    }

    public void mostrarInformacion(){

        System.out.println(getMatricula() + " " + getAlugado() + " " + getKmAlquiler() + " " + getKmDevolucion() + " " +  getPrecioKm());

        System.out.println(Turismo.getNumTurismos() + " " + getNumTurismosAlquilados());
                          //De ambas formas es correcto.

    }

    
}