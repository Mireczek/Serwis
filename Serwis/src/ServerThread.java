import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;


public class ServerThread extends Thread {
	private Socket socket = null;
	private SerwerSerwis server = null;
	private int ID = -1;
	private DataInputStream datain = null;
	private DataOutputStream dataout = null;
	private String name = null;
	private String password;
	private Boolean blad = false ;
	
	public ServerThread(SerwerSerwis serwerSerwis, Socket socket) {
		server = serwerSerwis;
		this.socket = socket;
		ID = socket.getPort(); //pobierz id klienta
	}
	public void run(){
		System.out.println("Proba polaczenia : "+ ID);
		try {
			name =  datain.readUTF();
			password =  datain.readUTF();
			System.out.println(name + password);
		} catch (IOException e1) {	
			e1.printStackTrace();
		}
		MySQL mysql = new MySQL(name);
		if(password.equals(mysql.command("")) {
			System.out.println("Zalogowano");
			blad = true;
			try {
				dataout.writeBoolean(blad);
				dataout.flush();
			} catch (IOException e) {
					e.printStackTrace();
			}  
			
			
		while(true){
			try{
				System.out.println(datain.readUTF());
			
			}catch(IOException e){	}
			
			
		}
		
		
		
		}else{
			System.out.println("b³êdny login lub has³o");
			blad = false;
			try {
				dataout.writeBoolean(blad);
				dataout.flush();
			} catch (IOException e) {
					e.printStackTrace();
			}
			try {
				close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			}
	}
	public void open() throws IOException{
		datain = new DataInputStream(new BufferedInputStream(socket.getInputStream()));
		dataout = new DataOutputStream(socket.getOutputStream());
	}
	public void close() throws IOException{
		if (socket != null)    socket.close();
	    if (datain != null)  datain.close();
	}
	
}
