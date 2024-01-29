import java.lang.management.GarbageCollectorMXBean;

import javax.xml.stream.FactoryConfigurationError;

public class AppMamifero {

public static void main(String[] args) {
    
    Baleas balea1 = new Baleas("Wally");
    Baleas balea2 = new Baleas("Manuela");

    balea1.amamantarCrias();
    balea2.amamantarCrias();

    Ornitorrinco orni1 = new Ornitorrinco("Pedrito");
    Ornitorrinco orni2 = new Ornitorrinco("Paquita");

    orni1.amamantarCrias();
    orni1.porOvos();

    orni2.amamantarCrias();
    orni2.porOvos();

    Morcego mor1 = new Morcego("Manolo");
    Morcego mor2 = new Morcego("Pedrito");

    mor1.voa();
    mor2.voa();

    Gaivota gai1 = new Gaivota("Patricia");
    Gaivota gai2 = new Gaivota("Paca");

    gai1.porOvos();
    gai1.voa();

    gai2.porOvos();
    gai2.voa();




}
    
    
    
}