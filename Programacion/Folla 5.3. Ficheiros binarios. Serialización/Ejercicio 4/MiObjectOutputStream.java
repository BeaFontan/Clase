import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;

class MiObjectOutputStream extends ObjectOutputStream{
    /** Constructor que recibe OutputStream */
    public MiObjectOutputStream(FileOutputStream out) throws IOException{
        super(out);
    }
    //Re definición do método de escribir a cabeceira para que non faga nada. */
    @Override
    public void writeStreamHeader() throws IOException{
    }
   }