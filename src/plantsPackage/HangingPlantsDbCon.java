package plantsPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class HangingPlantsDbCon {
	private static Connection connection = null;
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
        if(connection == null || connection.isClosed()){
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hangingplantsdata","root","1234");
            System.out.print("connected");
        }
        return connection;
    }
}
