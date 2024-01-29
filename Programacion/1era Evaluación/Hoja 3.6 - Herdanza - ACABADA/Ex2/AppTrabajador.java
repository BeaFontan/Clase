package Ex2;

class AppTrabajador {

    public static void main(String[] args) {
        
        Conductores cond1 = new Conductores("5458774H", "Encarna", "Martínez", "4574LKJ");

        Conductores cond2 = new Conductores("12345", "Antonia", "Pérez", "3548B");

        Conductores cond3 = new Conductores("87545874V", "María", "Fontán", "47584khd");


        Electricista ele1 = new Electricista("4557454H", "Beatriz", "Padín", true);

        Electricista ele2 = new Electricista("5471454J", "Pedra", "Vazquez", false);

        //llamo al atributo estático de Trabajador para ver el número de trabajadores creados
        System.out.println(Traballador.getNumTraballadores());

System.out.println(cond1.getNome() + cond1.getApelidos() + cond1.getDni() + cond1.getMatricula());

        cond1.setDni("DNIcambiado");
        cond1.setNome("Nome cambiado");
        cond1.setApelidos("Apelido cambiado");
        cond1.setMatricula("matrícula cambiada");
System.out.println(cond1.getNome() + cond1.getApelidos() + cond1.getDni() + cond1.getMatricula());


        System.out.println(Traballador.getNumTraballadores());


        System.out.println(ele2.getModalidadContrato()); // da falso, por lo que suponemos que es temporal.



    }
    
}