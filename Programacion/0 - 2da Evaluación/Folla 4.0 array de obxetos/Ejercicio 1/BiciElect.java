public class BiciElect {

    private String nome;
    private String marca;
    private int autonomiaKm;
    private static int numBicis;


    public BiciElect(){
        nome = "Sin nome";
        marca = "Sin marca";
        autonomiaKm = 0;
    }

    public BiciElect(String nome, String marca, int autonomiaKm){
        this.nome = nome;
        this.marca = marca;
        this.autonomiaKm = autonomiaKm;
        numBicis++;
    }


    public int getAutonomiaKm() {
        return autonomiaKm;
    }

    public void setAutonomiaKm(int autonomiaKm) {
        this.autonomiaKm = autonomiaKm;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public static int getNumBicis() {
        return numBicis;
    }

    public static void setNumBicis(int numBicis) {
        BiciElect.numBicis = numBicis;
    }

    public static BiciElect comparaAutonomia(BiciElect bici1, BiciElect bici2){
        if (bici1.autonomiaKm > bici2.autonomiaKm) {
            return bici1;
        }
        else{
            return bici2;
        }

    }

        public static BiciElect comparaAutonomiaMenor(BiciElect bici1, BiciElect bici2){
        if (bici1.autonomiaKm < bici2.autonomiaKm) {
            return bici1;
        }
        else{
            return bici2;
        }

    }

}