public class Bombilla {

    private String nome;
    private int potencia;
    public static int potenciaTotal;

    //constructores
    public Bombilla(){
        nome = "Sin nome";
        potencia = 10;

    }

    public Bombilla(String nom, int potenc){

        nome = nom;
        potencia = potenc;
        potenciaTotal += potenc;

    }

    //métodos get y set

    public void setPotencia(int j){
        potencia = j;
    }

    public int getPotencia(){
        return potencia;
    }
    
    //funcion aumentar potencia, lo hago con void porque no quiero que me devuelva nada, solo almaceno el cálculo y luego muestro el valor de la potencia con el get de potencia
    public void aumentaPotencia(int h){
        int aumento = potencia + h;

        if(aumento > 35){
            
            int resto = 35-potencia;
            potencia = 35;

            potenciaTotal+=resto;
        }
        else{

            potencia = aumento;

            potenciaTotal+=h;
        }
       
    }

    //función para bajar potencia
    public void baixaPotencia(int h){
        int disminucion = potencia - h;

        if(disminucion < 2){
            int resto = 2-potencia;
            potencia = 2;
            potenciaTotal+=resto;
        }
        else{
            potencia = disminucion;
            potenciaTotal-=h;
        }
        
    }

    public static int getValorPotenciaTotal(){
       
        return potenciaTotal;

    }

    public static String comparaBombilla(Bombilla bom1, Bombilla bom2){
        if ((bom1.getPotencia() > bom2.getPotencia())) {
            return bom1.nome;
        }
        else{
            return bom2.nome;
        }
      



    }

}