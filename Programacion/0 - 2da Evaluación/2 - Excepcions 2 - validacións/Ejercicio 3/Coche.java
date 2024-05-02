public class Coche {

    private String matricula;
    private double prezo;
    private String modelo;


    public Coche (String matricula, double prezo, String modelo) throws CocheException{
        this.matricula = matricula;
        this.prezo = prezo;
        this.modelo = modelo;

        //Compruebo los datos con las funciones con las excepciones que programé en la clase
        try {
            comprobarMatricula(matricula);
        } catch (CocheException e) {
            throw new CocheException("erro na matricula");
        }

        try {
            comprobarModelo(modelo);
        } catch (CocheException e) {
            throw new CocheException("erro no modelo");
        }

        try {
            comprobarPrecio(prezo);
        } catch (CocheException e) {
            throw new CocheException("erro no prezo");
        }


    }


    public String getMatricula() {
        return matricula;
    }


    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }


    public double getPrezo() {
        return prezo;
    }


    public void setPrezo(double prezo) {
        this.prezo = prezo;
    }


    public String getModelo() {
        return modelo;
    }


    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    

    @Override
    public String toString() {
        return "Coche [matricula=" + matricula + ", prezo=" + prezo + ", modelo=" + modelo + "]";
    }



    //FUNCIONES PARA COMPROBAR LOS DATOS INTRODUCIDOS QUE LANZAN EXCEPCIÓN COCHE QUE HEMOS CREADO.

    public static boolean comprobarMatricula(String matricula) throws CocheException, NumberFormatException{

        if (matricula.length() > 8 || matricula.length() < 8) {
            throw new CocheException("Ten que ter 8 caracteres");
        }

        //transformación de los números a int y comprobar que no haya problema en convertirlos
        try {
            Integer.parseInt(matricula.substring(0, 4));
        } catch (NumberFormatException e) {
            throw new CocheException("A matricula ten que ter números");
        }

        //Comprobación de las letras
        String [] vocales = {"a","e","i","o","u"};
        
        String letrasMatricula = matricula.substring(4,8);

            for (int i = 0; i < vocales.length; i++) {
                if (!letrasMatricula.contains(vocales[i])) {
                
                    throw new CocheException("A matrícula non leva vogais");
                
                }
    
            }

        return true;
    }


    public static boolean comprobarPrecio(double prezo) throws CocheException{

        if (prezo <10000 || prezo > 100000) {
            
            throw new CocheException("O prezo debe estar entre 10.000 e 100.000");
        }

        return true;
    }


    public static boolean comprobarModelo(String modelo) throws CocheException{
        if (!modelo.contains("Tesla") || !modelo.contains("Toyota")) {
            throw new CocheException("A marca debe empezar por Tesla ou Toyota");
        }

        return true;
    }
}