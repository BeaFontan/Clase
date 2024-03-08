import java.sql.Date;
import java.util.ArrayList;

import javax.swing.JOptionPane;

public class Socio {

    private static int codSocio;
    private String nomeSocio;
    private String apelidosSocio;
    private String emailSocio;
    private Date dataNacementoSocio;
    private int codSocioPrivado;
    private int[] arrayActividadesInscrito = new int[3];


    public Socio(String nomeSocio, String apelidosSocio, String emailSocio, Date dataNacementoSocio) {
        codSocio++;
        this.nomeSocio = nomeSocio;
        this.apelidosSocio = apelidosSocio;
        this.emailSocio = emailSocio;
        this.dataNacementoSocio = dataNacementoSocio;
        codSocioPrivado = codSocio;
        
    }


    public int getCodSocioPrivado() {
        return codSocioPrivado;
    }


    public int getCodSocio() {
        return codSocio;
    }



    public void setCodSocio(int codSocio) {
        Socio.codSocio = codSocio;
    }



    public String getNomeSocio() {
        return nomeSocio;
    }



    public void setNomeSocio(String nomeSocio) {
        this.nomeSocio = nomeSocio;
    }



    public String getApelidosSocio() {
        return apelidosSocio;
    }



    public void setApelidosSocio(String apelidosSocio) {
        this.apelidosSocio = apelidosSocio;
    }



    public String getEmailSocio() {
        return emailSocio;
    }



    public void setEmailSocio(String emailSocio) {
        this.emailSocio = emailSocio;
    }



    public Date getDataNacementoSocio() {
        return dataNacementoSocio;
    }



    public void setDataNacementoSocio(Date dataNacementoSocio) {
        this.dataNacementoSocio = dataNacementoSocio;
    }




    public int[] getarrayActividadesInscrito() {
        return arrayActividadesInscrito;
    }


    public void setarrayActividadesInscrito(int indiceActividade) {

       for (int i = 0; i < arrayActividadesInscrito.length; i++) {
         if (arrayActividadesInscrito.length > 3) {
             JOptionPane.showMessageDialog(null, "non podes introducir máis de 3 actividades");
         }
         if (arrayActividadesInscrito[i] == 0) {
            this.arrayActividadesInscrito[i] = indiceActividade;
         }
       }

    }


    @Override
    public String toString() {
        return "Socio [codSocio=" + codSocioPrivado + ", nomeSocio=" + nomeSocio + ", apelidosSocio=" + apelidosSocio
                + ", emailSocio=" + emailSocio + ", dataNacementoSocio=" + dataNacementoSocio
                + ", arrayActividadesInscrito=]";
    }



    public String toStringParaFichero() {
        return codSocioPrivado + ";" + nomeSocio + ";" + apelidosSocio + ";" + emailSocio + ";" + dataNacementoSocio;
    }


    
}
