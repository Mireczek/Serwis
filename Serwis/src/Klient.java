
import java.net.*;
import java.util.List;
import java.io.*;


public class Klient {
	private Socket socket = null;
	private DataInputStream streamIn = null;
	private static DataOutputStream streamOut = null;
	private static ObjectInputStream objectIn = null;
	private String serverName = "localhost";
	private int port = 5000;
	private boolean polaczenie = false;
	public static List<String> Wynik = null; 
	public static int ID = 0;
	
	@SuppressWarnings("deprecation")
	public Klient(String name, String password){
		
		if((!Logowanie.zalogowany) && (name.length()>1))
			{
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
				ID = streamIn.readInt();
				
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
