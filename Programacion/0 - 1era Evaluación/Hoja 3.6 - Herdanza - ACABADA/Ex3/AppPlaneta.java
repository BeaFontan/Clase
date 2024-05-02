 package Ex3;

class AppPlaneta {

    public static void main(String[] args) {
        

    PlanetaHabitable pl1 = new PlanetaHabitable(true, "Fión", 24, 1, 100000, 0, 10);

    System.out.println(pl1.getNome() + " " + pl1.getDistanciaTerra() + " " + pl1.getNumeroPersoas() + " " + pl1.getTamanho() + " " + pl1.getTemperaturaMaxima()
     + " " + pl1.getTemperaturaMinima() + " " + pl1.getAccesible() + " " +  Planeta.getNumPlanetasAccesibles());

    pl1.setDistanciaTerra(25);
    pl1.setNome("AK24");
    pl1.setTemperaturaMinima(5);
    pl1.setTemperaturaMaxima(8);

    System.out.println(pl1.getNome() + " " + pl1.getDistanciaTerra() + " " + pl1.getNumeroPersoas() + " " + pl1.getTamanho() + " " + pl1.getTemperaturaMaxima()
     + " " + pl1.getTemperaturaMinima() + " " + pl1.getAccesible() + " " +  Planeta.getNumPlanetasAccesibles());


    PlanetaHostil hostil1 = new PlanetaHostil(false, "Kaleva", 50, 4, true, true);
    

    System.out.println(hostil1.getNome()  + " " + hostil1.getTamanho()  + " " + hostil1.getDistanciaTerra()  + " " +  hostil1.getEnerxia() + " " +  hostil1.getVida());


    System.out.println("__________________________");

    PlanetaHabitable habitable = new PlanetaHabitable(true, "ssdhf", 25, 6, 685222, 100, 50);

    System.out.println(habitable.getAccesible() + " " + habitable.getNome() + " " + habitable.getNumeroPersoas() + " " + habitable.getTamanho() + " " + habitable.getTemperaturaMaxima() + " " + habitable.getTemperaturaMinima() + " " +habitable.getAccesible());


    PlanetaHostil hostil = new PlanetaHostil(false, "diosd", 5, 6, false, true);

    System.out.println(hostil.getAccesible() + " " + hostil.getNome() + " " + hostil.getTamanho() + " " + hostil.getAccesible() + " " + hostil.getEnerxia() + " " + hostil.getVida());


    Planeta planeta = new Planeta(true, "idsjf", 6, 4);

    System.out.println(planeta.getAccesible() + " " + planeta.getNome() + " " + planeta.getTamanho() + " " + planeta.getAccesible());

        System.out.println("__________________________");
        habitable.listarTodo();

    System.out.println("__________________________");

    System.out.println(Planeta.getNumPlanetasAccesibles());

    planeta.explotou();

    System.out.println(Planeta.getNumPlanetasAccesibles());


    }
}