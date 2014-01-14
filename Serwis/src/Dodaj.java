import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.List;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextArea;


public class Dodaj extends JFrame {
	private Vector<String> list = new Vector<String>() ;
	private JTextArea tf ;
	private JTextArea tf1;
	public Dodaj(){
		
		setPreferredSize(new Dimension(300,400));
		setLocation(Frame.sWidth/2-150,Frame.sHeight/2-200);
		
		JLabel l = new JLabel("Model : ");
		JLabel l1 = new JLabel("Rok produkcji : ");
		tf = new JTextArea();
		tf1 = new JTextArea();
		JButton ok = new JButton("OK");
		add(l,BorderLayout.WEST);
		add(l1,BorderLayout.EAST);
		add(tf,BorderLayout.WEST);
		add(tf1,BorderLayout.EAST);
	
		add(ok,BorderLayout.SOUTH);
		pack();
		ok.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				String model = tf.getText();
				
				System.out.println(list);
				String rok = tf1.getText();
				list =(Vector<String>)  Klient.Command("select model_id where mark like '"+ model +"'");
				
				
			}
		});
		
		setVisible(true);
	}
	
}
