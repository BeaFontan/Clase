//Escrebe de novo o seguinte código, respetándoo tal cual, pero engadindo a capacidade 
//de traballar con excepcións (clase Exception) de forma que cando se crea un rectángul
// cun punto orixe que ten algunha coordenada negativa se lance unha Exception.




class Ponto {
    int x = 0;
    int y = 0;
    Ponto(int x, int y) {
       
      this.x = x;
      this.y = y; 

    }
}
class Rectangulo {
    Ponto orixe;
    int ancho;
    int alto;
    Rectangulo(int x, int y, int w, int h) throws Exception {

        orixe = new Ponto(x,y);
        if (x < 0 || y < 0) {
            throw new Exception("As cordenadas non poden ser negativas");
        }
        ancho = w;
        alto = h;
    }
}
class App{
    public static void main(String[] args) throws Exception{
        try {
            Rectangulo oRectangulo=new Rectangulo(-2,3,4,5);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        

        System.out.println("Hola");
}
}