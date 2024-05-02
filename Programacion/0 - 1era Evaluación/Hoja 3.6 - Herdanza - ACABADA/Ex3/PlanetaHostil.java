package Ex3;

class PlanetaHostil extends Planeta{

    private boolean vida;
    private boolean enerxia;


    public PlanetaHostil(){
    
        super();
        vida = false;
        enerxia = false;
    
    }

    public PlanetaHostil(boolean accesible, String nome, int tamanho, int distanciaTerra, boolean vida, boolean enerxia){
        super(accesible, nome, tamanho, distanciaTerra);
        this.vida = vida;
        this.enerxia = enerxia;
    }

    //get y set

    public boolean getVida(){
        return vida;
    }
    
    public void setVida(boolean vida){
        this.vida = vida;
    }
    
    
    public boolean getEnerxia(){
        return enerxia;
    }
    
    public void setEnerxia(boolean enerxia){
        this.enerxia = enerxia;
    }
    

    public void listarTodo(){
        System.out.println(getNome() + getAccesible() + getTamanho() + getDistanciaTerra() + getVida() + getEnerxia());
    }

    
}