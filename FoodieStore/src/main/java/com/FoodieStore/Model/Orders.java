package com.FoodieStore.Model;

import java.sql.Timestamp;

public class Orders {
	
	private int order_id;
	private int resturant_id;
	private int user_id;
	private double total_amount;
	private Timestamp order_date;
	private String delivery_address;
	private String payment_mode;
	private String resturantName;
	
	
	public Orders(int resturant_id, int user_id, double total_amount, String delivery_address, String payment_mode) {
		super();
		this.resturant_id = resturant_id;
		this.user_id = user_id;
		this.total_amount = total_amount;
		this.delivery_address = delivery_address;
		this.payment_mode = payment_mode;
	}
	public Orders(int order_id, int resturant_id, int user_id, double total_amount, Timestamp order_date,
			String delivery_address, String payment_mode) {
		super();
		this.order_id = order_id;
		this.resturant_id = resturant_id;
		this.user_id = user_id;
		this.total_amount = total_amount;
		this.order_date = order_date;
		this.delivery_address = delivery_address;
		this.payment_mode = payment_mode;
	}
	public Orders(int resturant_id, int user_id, double total_amount, Timestamp order_date, String delivery_address,
			String payment_mode) {
		super();
		this.resturant_id = resturant_id;
		this.user_id = user_id;
		this.total_amount = total_amount;
		this.order_date = order_date;
		this.delivery_address = delivery_address;
		this.payment_mode = payment_mode;
	}
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getResturant_id() {
		return resturant_id;
	}
	public void setResturant_id(int resturant_id) {
		this.resturant_id = resturant_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public double getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}
	public Timestamp getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
	public String getDelivery_address() {
		return delivery_address;
	}
	public void setDelivery_address(String delivery_address) {
		this.delivery_address = delivery_address;
	}
	public String getPayment_mode() {
		return payment_mode;
	}
	public void setPayment_mode(String payment_mode) {
		this.payment_mode = payment_mode;
	}
	public String getResturantName() {
	    return resturantName;
	}

	public void setResturantName(String resturantName) {
	    this.resturantName = resturantName;
	}
	

	@Override
	public String toString() {
		return "Orders [order_id=" + order_id + ", resturant_id=" + resturant_id + ", user_id=" + user_id
				+ ", total_amount=" + total_amount + ", order_date=" + order_date + ", delivery_address="
				+ delivery_address + ", payment_mode=" + payment_mode + "]";
	}
	
}
