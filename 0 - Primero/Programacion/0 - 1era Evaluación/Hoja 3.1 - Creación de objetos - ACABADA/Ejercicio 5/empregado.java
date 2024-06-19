public class empregado {

    public String nombre;
    public String apellido1;
    public String apellido2;
    public String docId;
    public int salario;

    //constructor default

    public empregado(){
        nombre = "Nombre 1";
        apellido1 = "Apellido 1";
        apellido2 = "Apellido 2";
        docId = "12345678X";
        salario = 0;
    }
    

    public void setNombre(String nom){
        nombre = nom;
    }

    public void setApellido1(String ape1){
        apellido1 = ape1;
    }

    public void setApellido2(String ape2){
        apellido2 = ape2;
    }

    public void setDocID(String id){
        docId = id;
    }

    public void setSalario(int salar){
        salario = salar;
    }



}