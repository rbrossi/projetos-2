package database;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;

public class ConectaBD {

	public ConectaBD() {
	}

	public static Connection getConnection() throws Exception {

		Connection connection = null;
		
		try {			
			Class.forName("com.mysql.jdbc.Driver");
			return  DriverManager.getConnection("jdbc:mysql://mysqlportuga.unifique.com.br/mysqlpor_projetos2_db", "mysqlpor_projeto", "mysqllimpai");			
//			return  DriverManager.getConnection("jdbc:mysql://127.0.0.1/limpai", "root", "root");			
	} catch (Exception e) {
		throw new Exception(e);
	}
}
}
