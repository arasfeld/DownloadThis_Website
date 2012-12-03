package com.DownloadThis;

import java.sql.*;

public class Product {

    private String artist;
    private String album;
    private int year;
    private String genre;
    private float price;
    private String albumart;

    private Connection connection = null;
    private ResultSet rs = null;
    private Statement st = null;
    String connectionURL = "jdbc:mysql://localhost:3306/cse201b-f12";
    
    public Product() {
    }

    public Product(String artist, String album, int year, String genre, float price, String albumart) {
     this.artist = artist;
     this.album = album;
     this.year = year;
     this.genre = genre;
     this.price = price;
     this.albumart = albumart;
    }

    
    public String getArtist() {
        return this.artist;
    }
    
    public void setArtist(String artist) {
        this.artist = artist;
    }

    public String getAlbum() {
        return this.album;
    }

    public void setAlbum(String album) {
        this.album = album;
    }
    
    public int getYear() {
        return this.year;
    }
    
    public void setYear(int year) {
        this.year = year;
    }
    
    public String getGenre() {
        return this.genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public float getPrice() {
        return this.price;
    }
    
    public void setPrice(float price) {
        this.price = price;
    }

    public String getAlbumart() {
        return this.albumart;
    }
    
    public void setAlbumart(String albumart) {
        this.albumart = albumart;
    }
    
    public boolean insert() {
      boolean flag = false;  
	 try {
	   // Load the database driver
	   Class.forName("com.mysql.jdbc.Driver");
	   // Get a Connection to the database
	   connection = DriverManager.getConnection(connectionURL, "cse201b-f12", "ncFJtwzwZ6PCGHJp"); 
	   String sql = "insert into downloadthis_products values(null,'"+artist+"','"+album+"',"+year+",'"+genre+"',"+price+",'"+albumart+"')";
	   Statement st = connection.createStatement();
	   st.executeUpdate(sql);
	   flag = true;
	   st.close();
	 } catch(Exception e){
	   System.out.println("Exception is ;"+e);
	 }
	 return flag;
    }
		
    public void list() {
    }

}
