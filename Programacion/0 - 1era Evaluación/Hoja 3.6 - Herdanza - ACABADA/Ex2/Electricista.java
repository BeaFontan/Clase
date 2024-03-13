package Ex2;

class Electricista extends Traballador{

    private boolean fixo;

    public Electricista(){
        super();
        fixo = true; // si ponemos true, es fijo, sino suponemos que es temoral
    }

    public Electricista(String dni, String nome, String apelido, boolean modalidadContrato){

        super(dni, nome, apelido);
        this.fixo = modalidadContrato;
    }


    //get y set de modalidad contrato
    public boolean getModalidadContrato(){
        return fixo;

    }

    public void setModalidadContrato(boolean modalidadContrato) {
        this.fixo = modalidadContrato;
    }



}