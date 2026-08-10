package com.FoodieStore.Utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private final static String URL="jdbc:mysql://localhost:3306/foodiestore";
	private final static String USER_NAME="root";
	private final static String PASSWORD="root";
	static Connection con;
	public static Connection getConnection()
	{
		try{
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			con=DriverManager.getConnection(URL,USER_NAME,PASSWORD);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return con;
		
		
	}
	private DBConnection()
	{
		
	}

}
