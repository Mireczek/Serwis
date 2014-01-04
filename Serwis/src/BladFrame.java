import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JTextArea;


public class BladFrame extends JFrame {
	
	public BladFrame(){
		
		setPreferredSize(new Dimension(250, 150));
		JTextArea blad = new JTextArea("Podano z³¹ nazwê u¿ytkownika \nlub z³e has³o");
		blad.setEditable(false);
		blad.setBackground(getBackground());
		JButton ok = new JButton();
		ok.setText("Ok");
		add(blad, BorderLayout.CENTER);
		add(ok,BorderLayout.SOUTH);
		pack();
		ok.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				setVisible(false);
				
			}
		});
		
		setVisible(true);		
	}
}
