public class Bombilla {

    private int potencia;

    //constructores
    public Bombilla(){
        potencia = 10;
    }

    public Bombilla(int potenc){
        potencia = potenc;
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

        if(aumento > 35 && aumento < 2){
            potencia = 2;
        }
        else{
            potencia = aumento;
        }
       
    }

    //función para bajar potencia
    public void baixaPotencia(int h){
        int disminucion = potencia - h;

        if(disminucion > 35 && disminucion < 2){
            potencia = 2;
        }
        else{
            potencia = disminucion;
        }
        
    }

}