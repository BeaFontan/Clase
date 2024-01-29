 package Ex2;

class Traballador {

private String dni;
private String nome;
private String apelidos;
private static int numTraballadores = 0;

public Traballador(){
    dni = "Sin DNI";
    nome = "Sin nome";
    apelidos = "Sen apelidos";
}

public Traballador(String dni, String nome, String apelidos){

this.dni = dni;
this.nome = nome;
this.apelidos = apelidos;
numTraballadores++;//aquí si le digo que incremente el número de trabajadores cada vez que crees uno que tenga datos de verdad.

}

//geter y setters

public String getDni() {
    return dni;
}

public void setDni(String dni) {
    this.dni = dni;
}



public String getNome() {
    return nome;
}

public void setNome(String nome) {
    this.nome = nome;
}



public String getApelidos() {
    return apelidos;
}

public void setApelidos(String apelidos) {
    this.apelidos = apelidos;
}



//Creo la función para poder acceder al atributo estático de número traballadores, para poder acceder fora da clase.
public static int getNumTraballadores() {
    return numTraballadores;
}


    
}