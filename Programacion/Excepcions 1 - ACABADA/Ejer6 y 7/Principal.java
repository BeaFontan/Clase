
class Principal{
    public static void main(String[] args) {
        

        //formato contructor Ordenador:
        //NumeroDeSerie,capacidadeMemoria,tipMemoria,velocidadeMemoria,capacidadeDisco,tipoDisco,velocidadeDisco,tipoProcesador,velocidadeProcesador,prezo
        try{
                Ordenador ord1 = new Ordenador("DELL122",8,"DDR2",533,
                (double)2.0,"SATA",7200,"i7",(double)3.3,400);
                System.out.println("ORDENADOR DELL122 OK");
        }catch(OrdenadorException e){
                System.out.println(e.getMessage());
        }
        try{
                Ordenador ord2 = new Ordenador("CLONIC900",8,"DDR2",533,
                (double)2.0,"SATA3",7200,"i7",(double)3.3,400);
                System.out.println("ORDENADOR CLONIC900 OK");
        }catch(OrdenadorException e){
                System.out.println(e.getMessage());
        }
        try{
                Ordenador ord3 = new Ordenador("HP511",2,"DDR2",533,(double)2.0,
                "SATA",7200,"i5",(double)3.3,400);
                System.out.println("ORDENADOR HP511 OK");
        }catch(OrdenadorException e){
                System.out.println(e.getMessage());
        }
    }
}