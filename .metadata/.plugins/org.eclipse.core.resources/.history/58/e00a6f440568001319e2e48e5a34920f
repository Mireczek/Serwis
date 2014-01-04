
import java.net.*;
import java.io.*;

public class Klient {
	private Socket socket = null;
	private DataInputStream streamIn = null;
	private DataOutputStream streamOut = null;
	private String serverName = "localhost";
	private int port = 5000;
	private boolean polaczenie = false;
	@SuppressWarnings("deprecation")
	public Klient(String name, String password){
		try{
			socket = new Socket(serverName, port);
			start();
		}catch(UnknownHostException uhe)
	      {  System.out.println("Host unknown: " + uhe.getMessage());
	      }
	      catch(IOException ioe)
	      {  System.out.println("Unexpected exception: " + ioe.getMessage());
	      }
		
        try {
			streamOut.writeUTF(name); 
			streamOut.flush();
			System.out.println("q");
			streamOut.writeUTF(password); 
			System.out.println("e");
			streamOut.flush();
			System.out.println("r");
			polaczenie = streamIn.readBoolean();
			System.out.println("a");
		} catch (IOException e) {
			e.printStackTrace();
		}
        System.out.println("d");
        
		if(polaczenie){
			Logowanie.zalogowany = true;
			
       
		}else{
			Logowanie.zalogowany = false;
			stop();
		}
		
	}
	public void start() throws IOException{
		streamIn = new DataInputStream(new BufferedInputStream(socket.getInputStream()));
		streamOut = new DataOutputStream(socket.getOutputStream());
	}
	public void stop(){
		try{
			if(streamIn != null) streamIn.close();
			if(streamOut != null) streamOut.close();
			if(socket != null) socket.close();
		}catch(IOException e){
			
		}
	}

}
