public class OrdenadorException2 extends Exception {
    
    public String mensaje;
    public int codMensaje;


    public OrdenadorException2(String mensaje, int codMensaje) {
        this.mensaje = mensaje;
        this.codMensaje = codMensaje;
    }


    public String getMensaje() {
        return mensaje;
    }


    public int getCodMensaje() {
        return codMensaje;
    }


    @Override
    public String toString() {
        return "OrdenadorException2 [mensaje=" + mensaje + ", codMensaje=" + codMensaje + "]";
    }

    
    
}
