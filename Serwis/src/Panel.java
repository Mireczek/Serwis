
import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.ScrollPane;
import java.util.List;
import java.util.Vector;

import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollBar;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextArea;


public class Panel extends JPanel{
	
	private static int wysokosc = 400;
	private static int szerokosc = 750;
	private static  List<String> lista = new Vector<String>() ;
	private static  JTable table;
	static JPanel panelmenu = new JPanel();
	private static JScrollPane scrollPane;
	      
	public Panel(){

		setPreferredSize(new Dimension(szerokosc+10,wysokosc+30));
		NaPanel();
		panelmenu.setPreferredSize(new Dimension(szerokosc+10,wysokosc+20));
		
		add(panelmenu, BorderLayout.SOUTH);
	}
	private static void NaPanel(){
		
			String number=null;
			int i = 0;
			if(!lista.isEmpty())	{
			number = lista.get(0);
			lista.remove(0);
			int columnNumber = Integer.parseInt(number);
			
			String[] ColumnNames = new String[columnNumber];
			
			for(int j = 0; j<columnNumber;j++){
				ColumnNames[j] = lista.get(0);
				lista.remove(0);
			}
			String[][]Table = new String[lista.size()/columnNumber][columnNumber] ;
			int listLength = lista.size()/columnNumber;
			for(int j = 0; j<listLength;j++){
				for(i = 0; i< columnNumber;i++){
					Table[j][i] = lista.get(0);			
					lista.remove(0);
				}				
			}
			
			
			table = new JTable(Table, ColumnNames){
				//blokada edycji
				public boolean isCellEditable(int row, int column) {
			        return false;
			    }
			};
			scrollPane = new JScrollPane(table);
			scrollPane.setPreferredSize(new Dimension(szerokosc+10,wysokosc));
			scrollPane.createVerticalScrollBar();
			table.setPreferredSize(new Dimension(szerokosc,16*listLength));
			
			panelmenu.removeAll();
			
			panelmenu.add(scrollPane, BorderLayout.SOUTH);
			panelmenu.repaint();
			panelmenu.revalidate();
			}
		
	}
	public boolean isCellEditable(int row, int column) {
        return false;
    }
	public static  void Wyswietl(List<String> Lista){
		lista  = Lista ;
		System.out.println(lista);
		NaPanel();

	}
	public static int pobierzID(){
		String  tmp = "";
		int id = table.getSelectedRow();
		if(id != -1){
			tmp = (String) table.getValueAt(id, 1);
			id = Integer.parseInt(tmp);
		}
		return id;
	}
	 public static void Wyslij(String Command){
		 List<String> Wynik = Klient.Command(Command);
		 Wyswietl(Wynik);	
		 
	 }
}

