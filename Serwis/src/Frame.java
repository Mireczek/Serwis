import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Toolkit;

import javax.swing.JFrame;
import javax.swing.JMenuBar;
import javax.swing.JPanel;
import javax.swing.JTable;


public class Frame extends JFrame {
	private int szerokosc = 800;
	private  int wysokosc = 600;
	public static int sWidth,sHeight;
		public Frame(){
			super();
			Toolkit tk=Toolkit.getDefaultToolkit();
			Dimension sDimension = tk.getScreenSize(); 
			sWidth = sDimension.width;
			sHeight = sDimension.height;
			setPreferredSize(new Dimension(szerokosc,wysokosc));
			setLocation((Frame.sWidth/2)-(szerokosc/2),(Frame.sHeight/2)-(wysokosc/2));
			//setResizable(false);
			
			JMenuBar menu = new Menu();
			JPanel loginPanel = new Logowanie();
			JPanel ActionB = new ActionButton();
			JPanel container = new Panel();
			
			add(menu, BorderLayout.NORTH);
			add(container, BorderLayout.SOUTH);
			add(loginPanel, BorderLayout.EAST);
			add(ActionB, BorderLayout.WEST);
			
			pack();
			
			setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			
			setVisible(true);
		}
}
