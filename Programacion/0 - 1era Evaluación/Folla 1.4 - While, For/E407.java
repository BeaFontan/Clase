//Mostra os múltiplos de 3 e 7 (de ambos) menores que 100.

public class E407 {

    public static void main(String[] args) {

        for (int i = 0; i < 100; i++) {

            if (i % 3 == 0 && i % 7 == 0) {
                System.out.println(i);
            }

        }
    }
}