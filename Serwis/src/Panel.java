
import java.awt.Dimension;
import java.util.List;

import javax.swing.JPanel;
import javax.swing.JTextArea;


public class Panel extends JPanel implements Runnable{
	
	private static int wysokosc = 400;
	private static int szerokosc = 700;
	private static List<String> lista ;
	private boolean running = false;
	private Thread th;
	private static boolean flag = false;
	private boolean flaga = false;
	public Panel(){
		
	 
	}
	private void NaPanel(){
		setPreferredSize(new Dimension(szerokosc,wysokosc));
		JTextArea text = new JTextArea();
		text.setPreferredSize(new Dimension(szerokosc, wysokosc));
		add(text);
		text.setText("nanananannaananan");
		System.out.println("123");
		int i = 0;
		String number=null;

		while(true){
			flaga = flag;
			if(flaga){
				System.out.println("lipa");
		
			text.setText("kuewqet");
			System.out.println(Klient.Wynik);
			number = Klient.Wynik.get(0);
			System.out.println(number);
			
			int columnNumber = Integer.parseInt(number);
			for(int j = 0; j<(Klient.Wynik.size()-1)/columnNumber;j++){
				for(i = 0; i< columnNumber;i++){
					text.setText(Klient.Wynik.get(0));
					Klient.Wynik.remove(0);
					text.setText("nananan");
				}
				text.setText(text + "\n");
				flag = false;
				flaga=false;
			}
			}else text.setText("Wybierz co�");
			
		}
		
	}
	public static void Wyswietl(List<String> Lista){
		lista  = Lista ;
		System.out.println(lista);
		flag = true;
		if(flag);
		System.out.println("1234");
	}
	public void start() {
		   if(!running) {
				   th = new Thread(this);
				   th.start();
				   running = true;
		   }
	}
	 public void stop() {
		   running = false;
		   th.interrupt();
		    
 }
	@Override
	public void run() {
		
		System.out.println("244123543");
		if(running) {
			NaPanel();		
		}
	}
}
