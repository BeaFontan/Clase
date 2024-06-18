public class Usuario {

    private String email;
    private String contrasinal;
    
    public Usuario(String email, String contrasinal) {
        this.email = email;
        this.contrasinal = contrasinal;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContrasinal() {
        return contrasinal;
    }

    public void setContrasinal(String contrasinal) {
        this.contrasinal = contrasinal;
    }

    @Override
    public String toString() {
        return "Usuario [email=" + email + ", contrasinal=" + contrasinal + "]";
    }

    
    
}
