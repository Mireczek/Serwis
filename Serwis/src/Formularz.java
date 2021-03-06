import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridBagLayout;
import java.awt.GridLayout;

import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.SpringLayout;

import javax.swing.JTextField;


public class Formularz extends JFrame{
	public Formularz(){
		//Formularz do umawiania si� na us�ugi
		setPreferredSize(new Dimension(300,350));
		setLocation(Frame.sWidth/2,Frame.sHeight/2);
		setVisible(true);
		JLabel jl = new JLabel("Numer Samochodu : ");
		JLabel jl2 = new JLabel("Data : ");
		JLabel jl3 = new JLabel("Opis us�ugi : ");
		JTextArea tx1 = new JTextArea();
		tx1.setPreferredSize(new Dimension(200,20));
		JTextArea tx2 = new JTextArea();
		tx2.setPreferredSize(new Dimension(200,20));
		JTextArea tx3 = new JTextArea();
		tx3.setPreferredSize(new Dimension(200,150));
		tx3.setLineWrap(true);
		JPanel jp = new JPanel(new SpringLayout());
		jp.setPreferredSize(new Dimension(280, 200));
		
		jp.add(jl);
		jl.setLabelFor(tx1);
		jp.add(tx1);
		jp.add(jl2);
		jl2.setLabelFor(tx2);
		jp.add(tx2);
		jp.add(jl3);
		jl3.setLabelFor(tx3);
		jp.add(tx3);
		
		SpringUtilities.makeCompactGrid(jp,3, 2, 6, 6, 6, 6);
		
		add(jp, BorderLayout.NORTH);
		JButton jb = new JButton("Wyslij");
		add(jb, BorderLayout.SOUTH);
		pack();
		setVisible(true);
	
	}
	
}
