package project;
import java.sql.*;
public class ConnectionProvider {
	public static Connection getCon() {
		String dbUrl = "jdbc:mysql://localhost:3306/student";
        String dbUsername = "root";
        String dbPassword = "pritambose2002";
        
		try {
			// Load the MySQL JDBC driver
            
			Class.forName("com.mysql.cj.jdbc.Driver");

            // Create a connection to the database
            Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
            return connection;
		}catch(Exception e){
			System.out.println(e);
			return null;
		}
	}
}
