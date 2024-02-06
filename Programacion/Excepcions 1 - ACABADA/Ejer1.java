class AppEx1{
    public static void main(String[] args){
        int[] x= {0,1,2,3,4};
        try {
            x[5]=5;
        } catch (ArrayIndexOutOfBoundsException excepcionArray) {
            System.out.println("Fuera del límite del array");
        }
        System.out.println("O programa recupérase da excepción  e continúa ata aquí");
}
}