
import java.net.*;
import java.util.List;
import java.io.*;

import javax.swing.JFrame;

public class Klient {
	private Socket socket = null;
	private DataInputStream streamIn = null;
	private static DataOutputStream streamOut = null;
	private static ObjectInputStream objectIn = null;
	private String serverName = "localhost";
	private int port = 5000;
	private boolean polaczenie = false;
	public static List<String> Wynik = null; 
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
			streamOut.writeUTF(password);
			streamOut.flush();
			polaczenie = streamIn.readBoolean();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
        System.out.println("d");
        
		if(polaczenie){
			Logowanie.zalogowany = true;
			
       
		}else{
			JFrame frame = new BladFrame();
			Logowanie.zalogowany = false;
			stop();
		}
		
	}
	public void start() throws IOException{
		streamIn = new DataInputStream(new BufferedInputStream(socket.getInputStream()));
		streamOut = new DataOutputStream(socket.getOutputStream());
		objectIn = new ObjectInputStream(socket.getInputStream());
	}
	public void stop(){
		try{
			if(streamIn != null) streamIn.close();
			if(streamOut != null) streamOut.close();
			if(socket != null) socket.close();
		}catch(IOException e){
			
		}
	}
	public static void Command(String command){
		
		try {
			streamOut.writeUTF(command);
			streamOut.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			
			Wynik = (List<String>) objectIn.readObject();
		} catch (IOException e) {
			
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
		Panel.Wyswietl(Wynik);
		
	}

}
