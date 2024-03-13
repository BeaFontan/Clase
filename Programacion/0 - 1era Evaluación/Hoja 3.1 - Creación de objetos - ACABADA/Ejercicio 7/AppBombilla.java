public class AppBombilla {

    public static void main(String[] args) {
        
    Bombilla bom1 = new Bombilla();

    System.out.println("A pontencia da bombilla é " + bom1.getPotencia());

    //aporto dato a la potencia
    bom1.setPotencia(30);
    bom1.aumentaPotencia(20); //se asigno el valor para que suba la potencia y lo calcule internamente pero sin devovler nada
    bom1.baixaPotencia(10);

    System.out.println("A potencia da bombilla é " + bom1.getPotencia());//impormo el valor de la potencia pero con las funciones aplicadas

    bom1.setPotencia(10);
    bom1.aumentaPotencia(5); //se asigno el valor para que suba la potencia y lo calcule internamente pero sin devovler nada
    bom1.baixaPotencia(20);

    System.out.println("A potencia da bombilla é " + bom1.getPotencia());//impormo el valor de la potencia pero con las funciones aplicadas



    }
}