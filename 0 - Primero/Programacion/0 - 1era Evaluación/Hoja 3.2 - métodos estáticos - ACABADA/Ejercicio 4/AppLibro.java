public class AppLibro {

    public static void main(String[] args) {
        
        Libro libro1 = new Libro("Ortografía pŕactiva", "Luis Miranda", 10.5, 1, false);
        Libro libro2 = new Libro("Blancanieves", "Anónimo", 20.15, 1, false);
        Libro libro3 = new Libro("La Cenicienta", "Pedro López", 5.25, 1, false);
        Libro libro4 = new Libro("La Cenicienta", "Pedro López", 5.25, 2, false);

        System.out.println("libro: " + libro1.getTitulo() + libro1.getAutor() + libro1.getPrezo() + libro1.getExemplar()+ libro1.getVendido());

        System.out.println("libro: " + libro2.getTitulo() + libro2.getAutor() + libro2.getPrezo() + libro2.getExemplar() + libro2.getVendido());

        System.out.println("libro: " + libro3.getTitulo() + libro3.getAutor() + libro3.getPrezo() + libro3.getExemplar() + libro3.getVendido());

        System.out.println("libro: " + libro4.getTitulo() + libro4.getAutor() + libro4.getPrezo() + libro4.getExemplar() + libro4.getVendido());


        libro2.setPrezo(19.80);

        System.out.println("libro: " + libro2.getTitulo() + libro2.getAutor() + libro2.getPrezo() + libro2.getExemplar() + libro2.getVendido());
        
        libro3.seVende();
        libro4.seVende();
        System.out.println("Libros vendidos: " + Libro.numLibrosVendidos);

        System.out.println("libro: " + libro3.getTitulo() + libro3.getAutor() + libro3.getPrezo() + libro3.getExemplar() + libro3.getVendido());

        System.out.println("libro: " + libro4.getTitulo() + libro4.getAutor() + libro4.getPrezo() + libro4.getExemplar() + libro4.getVendido());


        int comparacion1 = Libro.valeMais(libro1, libro2);

        if (comparacion1 == -1) {

            System.out.println("O libro " + libro1.getTitulo() + " é mais caro");
            
        }

        if (comparacion1 == 1) {

            System.out.println("O libro " + libro2.getTitulo() + " é mais caro"); 
            
        }

        if (comparacion1 == 0) {

            System.out.println("O libro " + libro1.getTitulo() + " e " + libro2.getTitulo() + " valen o mesmo");
            
        }




        int comparacion2 = Libro.valeMais(libro2, libro1);

        if (comparacion2 == -1) {

            System.out.println("O libro " + libro2.getTitulo() + " é mais caro");
            
        }

        if (comparacion2 == 1) {

            System.out.println("O libro " + libro1.getTitulo() + " é mais caro"); 
            
        }

        if (comparacion2 == 0) {

            System.out.println("O libro " + libro2.getTitulo() + " e " + libro1.getTitulo() + " valen o mesmo");
            
        }




        int comparacion3 = Libro.valeMais(libro3, libro4);

        if (comparacion3 == -1) {

            System.out.println("O libro " + libro3.getTitulo() + " é mais caro");
            
        }

        if (comparacion3 == 1) {

            System.out.println("O libro " + libro4.getTitulo() + " é mais caro"); 
            
        }

        if (comparacion3 == 0) {

            System.out.println("O libro " + libro3.getTitulo() + " e " + libro4.getTitulo() + " valen o mesmo");
            
        }

    }
}