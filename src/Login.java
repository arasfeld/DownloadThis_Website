package com.DownloadThis;

import java.sql.*;

public class Login {
    
    private String username;
    private String password;
//  private Connection connection=null;
//  private ResultSet rs = null;
//  private Statement st = null;
    String connectionURL = "jdbc:mysql://localhost:3306/cse201b-f12";

    public Login() {
	
//  	  try {
//	  	  // Load the database driver
//		  Class.forName("com.mysql.jdbc.Driver");
//		  // Get a Connection to the database
//		  connection = DriverManager.getConnection(connectionURL, "cse201b-f12", "ncFJtwzwZ6PCGHJp"); 
//		  System.out.println(connection);
//	  } catch(Exception e){
//		  System.out.println("Exception is ;"+e);
//	  }
    }

    public Login(String username, String password) {
	this.username = username;
	this.password = password;
    }
    
    public void setUsername(String username) {
	this.username = username;
    }

    public String getUsername() {
	return this.username;
    }
		
    public void setPassword(String password) {
	this.password = password;
    }

    public boolean isAdmin(Connection connection) {
	boolean flag = false;
	try {
	    Statement st = connection.createStatement();
	    ResultSet rs = st.executeQuery("SELECT * FROM downloadthis_users WHERE username='"+username+"' and password='"+password+"'");
	    while(rs.next()) {
		flag = rs.getBoolean("isAdmin");
	    }
	} catch(Exception e){
	    System.out.println("Exception is ;" + e);
	}
	return flag;
    }
			
    public boolean verifyUser(Connection connection) {
	boolean flag = false;
	try {
	    Statement st = connection.createStatement();
	    ResultSet rs = st.executeQuery("SELECT * FROM downloadthis_users WHERE username='"+username+"' and password='"+password+"'");
	    while(rs.next()) {
		flag = true;
	    }
	} catch(Exception e){
	    System.out.println("Exception is ;" + e);
	}
	return flag;
    }
} //end class
