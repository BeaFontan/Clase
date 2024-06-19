

public class F01 {

    public static void main(String[] args) {
        
        int numero1 = 2;
        int numero2 = 3;
        int resultado;

        resultado = sumar(numero1, numero2);

        System.out.println("A suma de " + numero1 + " mais " + numero2 + " é igual a: " + resultado);

    }


    public static int sumar(int a, int b){
        
        return a + b;

    }


}