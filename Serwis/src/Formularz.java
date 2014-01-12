import java.awt.Dimension;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextArea;


public class Formularz extends JFrame{
	public Formularz(){
		//Formularz do umawiania siê na us³ugi
		setPreferredSize(new Dimension(200,500));
		setLocation(Frame.sWidth/2,Frame.sHeight/2);
		setVisible(true);
		JLabel jl = new JLabel("Numer Samochodu : ");
		JLabel jl2 = new JLabel("Data : ");
		JLabel jl3 = new JLabel("Opis us³ugi : ");
		JTextArea tx1 = new JTextArea();
		JTextArea tx2 = new JTextArea();
		JTextArea tx3 = new JTextArea();
	
	}
	
}
