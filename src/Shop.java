package com.DownloadThis;

import com.DownloadThis.DatabaseBean;
import com.DownloadThis.Product;
import java.sql.*;

public class Shop {
	
	// public Shop {
	// 	
	// }
	// 
	// public void getAllProducts(connection) {
	// 	// returns an arraylist of product id's
	// }
	// 
	public boolean addProduct(Connection connection, Product product) {
		// adds the product to the database
		boolean flag = false;  
		try {
    			String sql = "insert into downloadthis_products (artist,album,year,genre,price, albumart) values('"+product.getArtist()+"','"+product.getAlbum()+"','"+product.getYear()+"','"+product.getGenre()+"','"+product.getPrice() +"','"+ product.getAlbumart()+"')";
			Statement st = connection.createStatement();
			st.executeUpdate (sql);
			flag = true;
			// st.close ();
		} catch(Exception e){
			System.out.println("Exception is ;"+e);
		}
		return flag;
	}
	// 
	// public void updateProduct(connection, Product) {
	// 	
	// }
	// 

	public boolean deleteProduct(Connection connection, int product_id) {
		boolean flag = false;
		try {
			String sqlUpdateRecord="delete from jayannsd_products where id=?";
			PreparedStatement record=connection.prepareStatement(sqlUpdateRecord);
			record.setInt(1, product_id);
			record.executeUpdate();
			flag = true;
			record.close();
		} catch(Exception e){
			System.out.println("Exception is ;"+e);
		}
		return flag;
	}
	
	public Product getProductById(Connection connection, int product_id) {
		// get the product object from the database based on product id
		Product product = new Product();
		try {
			Statement stmt = connection.createStatement();
			ResultSet rs=stmt.executeQuery("select * from downloadthis_products where id ='"+product_id+"'");
			
			while (rs.next()) {
				product.setArtist(rs.getString("artist"));
				product.setAlbum(rs.getString("album"));
				product.setYear(rs.getInt("year"));
				product.setGenre(rs.getString("genre"));
				product.setPrice(rs.getFloat("price"));
				product.setAlbumart(rs.getString("albumart"));
			}
					
		} catch(Exception e) {
			System.out.println("Exception is :" + e);
		}
		return product;
	}
	
	public float getProductPriceById(Connection connection, int product_id) {
		// get the product object from the database based on product id
		Product product = new Product();
		float price = 0.0f;
		try {
			Statement stmt = connection.createStatement();
			ResultSet rs=stmt.executeQuery("select * from downloadthis_products where id ='"+product_id+"'");

			while (rs.next()) {
				price = rs.getFloat("price");	
			}

		} catch(Exception e) {
			System.out.println("Exception is :" + e);
		}
		return price;
	}
	
	public boolean isValidProductId(int product_id) {
		DatabaseBean dbconnection = new DatabaseBean();
		Connection conn = dbconnection.getConnection();
		boolean flag = false;
				
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs=stmt.executeQuery("select * from downloadthis_products where id ='"+product_id+"'");
				
			while (rs.next()) {
				flag = true;
			}
			
			dbconnection.close();
		
		} catch(Exception e) {
			System.out.println("Exception is :" + e);
		}
		return flag;
	}
	
} 