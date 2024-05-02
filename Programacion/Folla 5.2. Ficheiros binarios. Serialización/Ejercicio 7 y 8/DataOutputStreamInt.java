import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Scanner;
public class DataOutputStreamInt {   
 public static void main(String[] args) {
        escribirInt();
    }
    //Uso de recursos e excepcións clásica sen try with resources
    private static void escribirInt() {
            
        Scanner sc = new Scanner(System.in);     
        //Define el FileOutputStream y el DataOutputStream                                                                 
        FileOutputStream fos = null;
        DataOutputStream salida = null;
        int n;

        try {

            //Le pasa al Fileoutput el filename, con formato .dat.
            fos = new FileOutputStream("datos.dat");
            //al dataoutpuet le pasa el Fileoutput
            salida = new DataOutputStream(fos);


            System.out.print("Introduce número enteiro. -1 para rematar: ");
            n = sc.nextInt();

            //mientras que no sea -1, 
            while (n != -1) {

                //usamos la función writeInt
                salida.writeInt(n); //Escrébese o número enteiro no ficheiro     

                //Y vuelve a preguntar.
                System.out.print("Introduce número enteiro. -1 para rematar: ");
                n = sc.nextInt();

            }

        } catch (FileNotFoundException e) {
            System.out.println(e.getMessage());

        } catch (IOException e) {

            System.out.println(e.getMessage());
        } finally {
            //U al final de todo, cierra todos los files y outputs.
            try {
                if (fos != null) {
                    fos.close();
                }
                if (salida != null) {
                    salida.close();
                }
            } catch (IOException e) {
                System.out.println(e.getMessage());                                                               
            }
       }

       sc.close();
    }
}