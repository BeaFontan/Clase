public class Biblioteca {

    private String nomeUsuario;
    private String email;
    private String telefono;

    
    public Biblioteca(String nomeUsuario, String email, String telefono) {
        this.nomeUsuario = nomeUsuario;
        this.email = email;
        this.telefono = telefono;
    }


    public String getNomeUsuario() {
        return nomeUsuario;
    }


    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }


    public String getEmail() {
        return email;
    }


    public void setEmail(String email) {
        this.email = email;
    }


    public String getTelefono() {
        return telefono;
    }


    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }


    public String toStringParaGardar() {
        return nomeUsuario + ":" + email + ":" + telefono;
    }


}