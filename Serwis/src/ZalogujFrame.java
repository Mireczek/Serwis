import java.awt.BorderLayout;
import java.awt.Dimension;

import javax.swing.JFrame;
import javax.swing.JTextField;


public class ZalogujFrame extends JFrame {
	public ZalogujFrame(){
		setPreferredSize(new Dimension(200,200));
		setLocation(Frame.sWidth/2,Frame.sHeight/2);
		JTextField tf = new JTextField();
		tf.setText("Aby korzysta� z programu zaloguj si�.");
		add(tf, BorderLayout.CENTER);
		setVisible(true);
		pack();
	}
}
