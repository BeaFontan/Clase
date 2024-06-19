package Ejercicio1;

import java.util.Objects;

public class Impresora {

    private int precio;
    private String modelo;
    private int hojasMinuto;
    
    public Impresora(){
        precio = 0;
        modelo = "Sin nombre";
        hojasMinuto = 0;
    
    }

    public Impresora(int precio, String modelo, int hojasMinuto){
        this.precio = precio;
        this.modelo = modelo;
        this.hojasMinuto = hojasMinuto;

    }

        //metodos get y set


    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getHojasMinuto() {
        return hojasMinuto;
    }

    public void setHojasMinuto(int hojasMinuto) {
        this.hojasMinuto = hojasMinuto;
    }


    //REDIFINAR EQUALS()
    public boolean equals(Object obj){
        //primero compruebo si existe dicho objeto
        if (obj == null){ //si el objeto es igual nulo
           
            return false; //devuelve falso
        }

        //Ahora compruebo que existe esa clase
        if (obj.getClass() != this.getClass()){ // si la clase, es distinta a esta clase
           
            return false; // devuelve falso
        }
            
        //Ahora convierto el object a Impresora.
        Impresora imp = (Impresora) obj;


        //comparar si son iguales, con una diferencia menor que 10 consideramos que es igual
        if (Math.abs(imp.precio - this.precio) > 10) { //si el resultado entero de imp 1 - imp 2 (MATH.ABS) es mayor a 10
            return false; //devuelve false
        }


        //ahora si las hojas por minuto son las mismas
        if(imp.hojasMinuto != this.hojasMinuto){
            return false;
        }

        return true;//

    }


    //REDEFINIR GETHUSH()

    //sobreescribimos el método hashcode para que si dos objetos son iguales, devuelvan el mismo hash
    @Override
    public int hashCode(){
            return Objects.hash(precio,hojasMinuto);
        }



    



    





}