public class AppPersoeiros {

    public static void main(String[] args) {

        Persona[] arrayPersonas = new Persona[4];
        
        Empregado emp1 = new Empregado("Manuel", "Pérez", 19, 1000);
        Empregado emp2 = new Empregado("María", "Domíngez", 22, 1500);

        Estudante est1 = new Estudante("Pablo", "Castro", 16, "bacharelato");
        Estudante est2 = new Estudante("Carolina", "Fontán", 26, "ESO");

        arrayPersonas[0] = emp1;
        arrayPersonas[1] = emp2;
        arrayPersonas[2] = est1;
        arrayPersonas[3] = est2;


        for (Persona objetoPersona : arrayPersonas) {
            System.out.println(objetoPersona.dameNome() + " " + objetoPersona.dameDescripcion());
        }

        if (est1.compareTo(est2) > 0) {
            System.out.println(est1.dameNome() + " e maior que " + est2.dameNome());
        }
        if (est1.compareTo(est2) < 0) {
            System.out.println(est1.dameNome() + " e menor que " + est2.dameNome());
        }
        else{
            System.out.println(est1.dameNome() + " ten a misma idade que " + est2.dameNome());
        }




    }
}