import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JTextArea;
import javax.swing.JTextField;


public class InfoBox extends JFrame {
	public InfoBox(String Msg){
		setPreferredSize(new Dimension(200,200));
		setLocation(Frame.sWidth/2,Frame.sHeight/2);
		JTextArea tf = new JTextArea();
		tf.setLineWrap(true);
		tf.setText(Msg);
		tf.setEditable(false);
		add(tf, BorderLayout.CENTER);
		JButton jb = new JButton("OK");
		jb.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				setVisible(false);
				
			}
		});
		add(jb,BorderLayout.SOUTH);
		setVisible(true);
		pack();
	}
}
