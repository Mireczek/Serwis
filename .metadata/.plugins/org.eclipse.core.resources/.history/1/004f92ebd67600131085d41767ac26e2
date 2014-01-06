import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.peer.MenuPeer;

import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;


public class Menu extends JMenuBar{
		

	public Menu(){
			userMenu();	
		}
	
	
	private void userMenu(){
		JMenuBar menuBar = new JMenuBar();
		add(menuBar);
		JMenu menuFile = new JMenu("Plik");
		add(menuFile);
		JMenu menuNaprawy = new JMenu("Naprawy");
		add(menuNaprawy);
		JMenu menuSamochody = new JMenu("Samochody");
		add(menuSamochody);
		JMenu menuUmow = new JMenu("Umów siê");
		add(menuUmow);
		JMenu menuAbout = new JMenu("Pomoc");
		add(menuAbout);
		
		JMenuItem historiaNapraw = new JMenuItem("Historia napraw");
		JMenuItem ustawienia = new JMenuItem("Ustawienia");
		JMenuItem aktualneNaprawy = new JMenuItem("Aktualne naprawy");
		JMenuItem oProgramie = new JMenuItem("O Programie");
		JMenuItem Samochody = new JMenuItem("Moje samochody");
		JMenuItem Umow = new JMenuItem("Umów siê");
		menuNaprawy.add(historiaNapraw);
		menuNaprawy.add(aktualneNaprawy);
		menuSamochody.add(Samochody);
		menuUmow.add(Umow);
		menuFile.add(ustawienia);
		menuAbout.add(oProgramie);
		
		
		Samochody.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				Klient.Command("Select * from model where client_id = '" +  Klient.ID +"'");
				
			}
		});
		
		menuNaprawy.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				Klient.Command("Select * from model where client_id = '" +  Klient.ID +"'");
				
			}
		});
		Umow.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				//wyswietla formularz do umawiania sie na uslugi
				
			}
		});
		
		menuAbout.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				
				
			}
		});
		historiaNapraw.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				Klient.Command("Select * from model where client_id = '" +  Klient.ID +"'");
				
			}
		});
		aktualneNaprawy.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				//wyswietla aktualnie przeprowadzane naprawy
				Klient.Command("Select * from model where client_id = '" +  Klient.ID +"'");
				
			}
		});
		oProgramie.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				//wyswietla informacje o programie
				
			}
		});
		ustawienia.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				//wyswietla okno do edycji ustawien 
				
			}
		});	
	}
	
}
