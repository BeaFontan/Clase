//Fai un pequeno programa para controlar o stock dun produto (id, prezo e cantidade). A cantidade por 
//defecto é de 50 unidades. Crea un método estático de venderProduto(), e crea a túa propia clase de
// excepción produtoSenStockException (filla de Exception) para xestionar a falta de stock.

public class Ejer5 {

    public int id;
    public double prezo;
    public int stock = 50;

    public Ejer5(int id, double prezo, int stock){
        this.id = id;
        this.prezo = prezo;
        this.stock = stock;
    }

    
    @Override
    public String toString() {
        return "Ejer5 [id=" + id + ", prezo=" + prezo + ", stock=" + stock + "]";
    }


}



