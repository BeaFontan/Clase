public class AppNave {

    public static void main(String[] args) {
        
        nave nave1 = new nave();

        nave1.nombreNave = "Apolo13";

        for (int i = nave1.GetTiempo(); i > 0; i--) {
        
            System.out.println(i);
        
        }

        System.out.println("La nave " + nave1.nombreNave + " ha despegado");




    }
}