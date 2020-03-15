package com.examHall;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBCon 
{
	Connection con;
	private String db_url="jdbc:mysql://localhost:3306/examhall_db";
	private String db_user="root";
	private String db_pass="";
	public DBCon()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
	}
	public Connection dbCon()
	{
		try {
			con=DriverManager.getConnection(db_url,db_user,db_pass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
		
	}
}
