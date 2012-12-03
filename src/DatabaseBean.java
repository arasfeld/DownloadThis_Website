package com.DownloadThis;
import java.sql.*;


public class DatabaseBean {

    private Connection connection=null;

    public DatabaseBean() {
	String connectionURL = "jdbc:mysql://localhost:3306/cse201b-f12";
	try {
	    // Load the database driver
	    Class.forName("com.mysql.jdbc.Driver");
	    // Get a Connection to the database
	    connection = DriverManager.getConnection(connectionURL, "cse201b-f12", "ncFJtwzwZ6PCGHJp"); 
	} catch(Exception e){
	    System.out.println("Exception is ;"+e);
	}	
	
    }

    public Connection getConnection() {
	return connection;
    }

    public void close() throws SQLException {
	try {
	    connection.close();
	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    System.out.println("Exception is ;"+e);
	}
    }
	
}
