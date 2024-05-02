/*5.Define una clase País, con atributos nome e habitantes. Crea un ficheiro de 4 países, gardando os obxectos
un a un.
Escribe agora o código para ler o ficheiro e mostrar os países por pantalla. Na segunda versión do programa nos
indican que habitantes debe ser substituído por habitantes. Fai ese cambio na clase Pais (e nos métodos), e
executa só o código para ler o ficheiro: debería darche un erro.
Establece un valor de 2L para serialVersionUID, e fai de novo o proceso:
6.
✗Estado inicial: habitantes como no comezo. Escribe 4 valores no ficheiro
✗Cambia o nome do atributo
✗Le os valores. Agora si que debías poder ler os valores.*/

import java.io.Serializable;

public class Pais implements Serializable{

    private String nome;
    private int habitantes;
    private static final long serialVersionUID = 2L;


    public Pais(String nome, int habitantes) {
        this.nome = nome;
        this.habitantes = habitantes;
    }


    public String getNome() {
        return nome;
    }


    public void setNome(String nome) {
        this.nome = nome;
    }


    public int getNumeroHabitantes() {
        return habitantes;
    }


    public void setNumeroHabitantes(int habitantes) {
        this.habitantes = habitantes;
    }






}