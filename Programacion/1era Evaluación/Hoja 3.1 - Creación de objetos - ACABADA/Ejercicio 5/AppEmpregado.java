public class AppEmpregado {

    public static void main(String[] args) {
        
        empregado empleado1 = new empregado();
        empregado empleado2 = new empregado();

        System.out.println("O nome é " + empleado1.nombre + " " + empleado1.apellido1 + " " + empleado1.apellido2 + " con DNI: " + empleado1.docId + " e o se salario é " + empleado1.salario + " €.");
    
    
        empleado1.setNombre("Manuel");
        empleado1.setApellido1("Martínez");
        empleado1.setApellido2("Pérez");
        empleado1.setDocID("1234785Z");
        empleado1.setSalario(5000);
    
        System.out.println("O nome é " + empleado1.nombre + " " + empleado1.apellido1 + " " + empleado1.apellido2 + " con DNI: " + empleado1.docId + " e o se salario é " + empleado1.salario + " €.");

        empleado2.setNombre("María");
        empleado2.setApellido1("Vázquez");
        empleado2.setApellido2("Oubiña");
        empleado2.setDocID("98765432S");
        empleado2.setSalario(5600);
    

        System.out.println("O nome é " + empleado2.nombre + " " + empleado2.apellido1 + " " + empleado2.apellido2 + " con DNI: " + empleado2.docId + " e o se salario é " + empleado2.salario + " €.");

    }
}