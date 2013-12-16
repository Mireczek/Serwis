import java.awt.Color;
import java.awt.Dimension;

import javax.swing.JPanel;


public class Panel extends JPanel {
	private int wysokosc = 400;
	private int szerokosc = 700;
	public Panel(){
		setPreferredSize(new Dimension(szerokosc,wysokosc));
		
	}
}
