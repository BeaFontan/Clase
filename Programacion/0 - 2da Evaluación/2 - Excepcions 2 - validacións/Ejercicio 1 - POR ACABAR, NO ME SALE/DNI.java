public class DNI {

    private String DNI;

    public DNI(String dni) throws DNIException {
        this.DNI = dni;

        //Comprobación que tenga 8 digitos
        if (dni.length() < 9 || dni.length() > 9) {
            throw new DNIException("Non pode ter mais nin menos de 8 letras");
        }

        //paso a dividir el dni la parte de número y la parte de letra
        try {
            int dniNumero = Integer.parseInt(dni.substring(0, 7));
        } catch (NumberFormatException e) {
            throw new DNIException("Non se puido converter a parte numérica do DNI a número");
        }


        String dniLetra = dni.substring(7);
        

        //Comprobar que la letra, sea una letra
        boolean comprobarLetra = Character.isLetter(dniLetra.charAt(0));

        if (comprobarLetra == false ) {
            throw new DNIException("Erro, non se axusta o formato 1234567X");
        }

    }

    public String getDNI() {
        return DNI;
    }


}