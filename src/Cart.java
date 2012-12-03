package com.DownloadThis;

import com.DownloadThis.Product;
import java.util.ArrayList;

public class Cart {
	
	private ArrayList<Integer> myCart;
	
	public Cart() {
		myCart = new ArrayList<Integer>();
	}

	public void add(int product_id) {
		this.myCart.add(product_id);
	}	
	
	public ArrayList<Integer> view() {
		return this.myCart;
	}
	
	public void remove(Integer product_id) {
		this.myCart.remove(product_id);
	}
}