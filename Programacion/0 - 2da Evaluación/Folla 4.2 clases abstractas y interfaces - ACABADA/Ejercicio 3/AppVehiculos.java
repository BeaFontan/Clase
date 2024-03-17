public class AppVehiculos {

    public static void main(String[] args) {
        
        Terrestre cam1 = new Terrestre(110, 190, 6, "militar");

        cam1.acelerar(20);
        cam1.frenar(9);
        cam1.calculaRevolucionsMotor(5, 8);
        cam1.mostrar();

        Terrestre cam2 = new Terrestre(90, 160, 8,"civil");

        cam2.acelerar(20);
        cam2.frenar(9);
        cam2.calculaRevolucionsMotor(5, 8);
        cam2.mostrar();


        Acuaticos barca1 = new Acuaticos(60, 100, "superficie", 5);

        barca1.acelerar(15);
        barca1.frenar(5);
        barca1.calculaRevolucionsMotor(5, 6);
        barca1.recomendarVelocidade(15);
        barca1.mostrar();

        Acuaticos barca2 = new Acuaticos(30, 120, "superficie", 4);

        barca2.acelerar(16);
        barca2.frenar(4);
        barca2.calculaRevolucionsMotor(6, 3);
        barca2.recomendarVelocidade(12);
        barca2.mostrar();
    }
}