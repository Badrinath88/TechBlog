package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// Establish the database connection
// create singleton class --> that allows us to create only one object
public class DatabaseConnection {
//	create private static final variables so no one would change our database specific info. 
	private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String DB_URL = "jdbc:mysql://localhost:3306/techblog";
	private static final String USER = "root";
	private static final String PASSWORD = "root";
	
	private static Connection connection = null;
	
	static {
		try {
			if(connection==null) {
				Class.forName(DB_DRIVER);
				connection = DriverManager.getConnection(DB_URL,USER,PASSWORD);
			}
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() {
		return connection;
	}
}
