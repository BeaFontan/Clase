import java.util.ArrayList;
import java.util.Arrays;

public class Socio {

    private int codSocio;
    private String nomeSocio;
    private String apelidosSocio;
    private String emailSocio;
    private String dataNacementoSocio;
    public ArrayList<Actividade> arrayActividadesInscrito= new ArrayList<Actividade>();


    public Socio(String nomeSocio, String apelidosSocio, String emailSocio, String dataNacementoSocio) {
        codSocio++;
        this.nomeSocio = nomeSocio;
        this.apelidosSocio = apelidosSocio;
        this.emailSocio = emailSocio;
        this.dataNacementoSocio = dataNacementoSocio;
    }



    public int getCodSocio() {
        return codSocio;
    }



    public void setCodSocio(int codSocio) {
        this.codSocio = codSocio;
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



    public String getDataNacementoSocio() {
        return dataNacementoSocio;
    }



    public void setDataNacementoSocio(String dataNacementoSocio) {
        this.dataNacementoSocio = dataNacementoSocio;
    }



    @Override
    public String toString() {
        return "Socio [codSocio=" + codSocio + ", nomeSocio=" + nomeSocio + ", apelidosSocio=" + apelidosSocio
                + ", emailSocio=" + emailSocio + ", dataNacementoSocio=" + dataNacementoSocio
                + ", arrayActividadesInscrito=]";
    }



    public String toStringParaFichero() {
        return codSocio + "," + nomeSocio + "," + apelidosSocio + "," + emailSocio + "," + dataNacementoSocio;
    }


    
}
