import java.awt.EventQueue;




public class Serwis {

	
	public static boolean zalogowany = false;
	
	public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            @Override
            public void run() {
                new Frame();
            }
        });

	
	}
	
}
