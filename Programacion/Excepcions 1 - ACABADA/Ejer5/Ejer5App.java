public class Ejer5App {

    public static void main(String[] args) throws produtoSenStockException {
        
        Ejer5 producto = new Ejer5(0001, 12.3, 5);

        try {
            venderProduto(producto, 7);

        } catch (produtoSenStockException e) {
            System.out.println(e.getCodigoError());
            System.out.println(e.getMessage());
        }

        System.out.println(producto.toString());
        System.out.println("Hola comprobar que el programa continúa");

    }

       
    public static void venderProduto(Ejer5 producto, int cantidade) throws produtoSenStockException{

        producto.stock = producto.stock - cantidade;

        if (producto.stock <= 0) {
            throw new 
            produtoSenStockException();
        }
    
    }
    
    
}