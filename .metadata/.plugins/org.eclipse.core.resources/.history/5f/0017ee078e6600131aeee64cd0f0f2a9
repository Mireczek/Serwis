
import java.sql.*;
import java.util.*;
public class MySQL{
	
	private Statement stmt = null;
	private Connection conn = null;
	private String user = null;
	private int ID = 0;
	public MySQL(String name){
		user = name;
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "serwis";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "root";
		String password = "";
		try {
			Class.forName(driver).newInstance();
			conn = DriverManager.getConnection(url+dbName,userName,password);
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);	
			
			ResultSet rs = stmt.executeQuery("Select ID from ");
			ID = rs.getInt(ID);
	} catch (Exception e) {
		e.printStackTrace();
	}
		
		
}
		
public String Command(String command) throws SQLException{
	
	String Wynik  = null;
	Scanner sx = new Scanner(System.in);
	
			ResultSet rs = stmt.executeQuery(command + " where ID = " + ID);

			int i=1;
			while (rs.next()) {
				rs.getArray(i);
				i++;
				int id = rs.getInt("id");
			}
			System.out.println();
	
	return Wynik;
 	}
	
public void Close() throws SQLException{
	conn.close();
}



}