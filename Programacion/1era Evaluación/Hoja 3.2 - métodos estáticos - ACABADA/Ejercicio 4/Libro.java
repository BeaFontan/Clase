public class Libro {

    private String titulo;
    private String autor;
    private double prezo;
    private int exemplar;
    private boolean vendido;
    public static int numLibrosVendidos;


    public Libro(){
        titulo = "Título del libro";
        autor = "Autor del libro";
        prezo = 0.00;
        exemplar = 0;
        vendido = false;
    }

    public Libro(String titulo, String autor, double prezo, int exemplar, boolean vendido){

        this.titulo = titulo;
        this.autor = autor;
        this.prezo = prezo;
        this.exemplar = exemplar;
        this.vendido = vendido;

    }
    
    //métodos de acceso e introducción datos


    public String getTitulo(){
        return titulo;
    }


    public String getAutor(){
        return autor;
    }

    public double getPrezo(){
        return prezo;
    }

    public void setPrezo(double prezo){
        this.prezo = prezo;
    }

    public int getExemplar(){
        return exemplar;
    }

    public boolean getVendido(){
        return vendido;
    }

    public void seVende(){
        vendido = true;
        numLibrosVendidos++;
    }

    public static int valeMais(Libro libro1, Libro libro2){
   
        if (libro1.prezo > libro2.prezo) {
            return -1;
            
        }
        else if (libro1.prezo < libro2.prezo) {
            return 1;
            
        }
        else{
            return 0;
        }

        
    }











}