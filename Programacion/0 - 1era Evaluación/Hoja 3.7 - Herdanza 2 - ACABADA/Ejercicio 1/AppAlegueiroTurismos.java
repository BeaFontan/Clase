public class AppAlegueiroTurismos {

    public static void main(String[] args) {
        
        Turismo tur1 = new Turismo("111-BCD", false, 20, 0, 0);

        tur1.alugar(12);


        Camion cam1 = new Camion("333-BCD", false, 20, 0, 0);


        cam1.alugarCamion(129);

        tur1.alugar(12);

        tur1.mostrarInformacion();
        
        cam1.mostrarInformacion();

        System.out.println(Turismo.getNumTurismos()); // esto ya lo muestra la función mostrar información.


        System.out.println("____________________________");

        tur1.mostrarInformacion();

        System.out.println(tur1.devolver(14500) + " €, me debes");;

      
        System.out.println("____________________________");

        

        System.out.println(cam1.devolverCamion(133) + " €, me debes");;

        cam1.mostrarInformacion();



    }
}