import java.awt.BorderLayout;
import java.awt.Dimension;

import javax.swing.JPanel;
import javax.swing.JTable;


public class Kontener extends JPanel {
	private static int wysokosc = 400;
	private static int szerokosc = 700;
	public Kontener(){
		setPreferredSize(new Dimension(wysokosc,szerokosc));
		//JTable panel = new Panel();
		//add(panel, BorderLayout.SOUTH);
	}
}
