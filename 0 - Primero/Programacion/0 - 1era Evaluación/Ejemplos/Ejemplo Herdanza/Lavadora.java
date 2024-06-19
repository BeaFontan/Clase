public class Lavadora extends Electrodomestico{

    private int carga;

    public Lavadora(){
    super();
     this.setCodigo("codigoLavadora"); // Sobreescrimos el atributo de la clase padre. para acceder al codigo de la clase padre y pasarle argumento.
    carga = 0;

    }

    public Lavadora(String codigo, int prezo, int carga)
    {
        super(codigo, prezo);//le paso datos al constructor de la clase padre. Ojo ya no le pongo this, porque ya está establecido en el padre. 
                             //Aquí solo le paso el dato, que se puede llamar igual o no
        this.carga = carga;//atributo de la clase hija
    }

    public int getCarga() {
        return carga;
    }

    public void setCarga(int carga) {
        this.carga = carga;
    }

}