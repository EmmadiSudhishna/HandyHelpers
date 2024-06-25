package servletpack;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	Connection conn = null;

	public Connection getConnection() {
	try {
		//Step 1
		Class.forName("com.mysql.jdbc.Driver");
		
		//Step 2
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/handyhelpers?autoReconnect=true&useSSL=false","root","");
		//conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/sigma445_ecommercedb?autoReconnect=true&useSSL=false","sigma445_ecommercedb","XNOH7gROi[oH");
	}catch(Exception e) {
		conn=null;
	}
	return conn;
}


}
