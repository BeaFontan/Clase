public class Ejer5App {

    public static void main(String[] args) throws produtoSenStockException {
        
        Ejer5 producto = new Ejer5(0001, 12.3, 5);
    try {
        venderProduto(60);
    } catch (Exception e) {
        System.out.println("Hola");
    }





    }

    public static void venderProduto(int cantidade) throws produtoSenStockException{

        int stock=0;

        stock -= cantidade;

        if (stock <= 0) {
            throw new 
            produtoSenStockException(stock, "Non queda nada de ese producto");
        }


    
    }
        
    
}