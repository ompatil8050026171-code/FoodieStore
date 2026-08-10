package com.FoodieStore.Model;

public class OrderItem {
	
	private int order_item_id;
	private int order_id;
	private int menu_id;
	private int quantity;
	private double price;
	private String name;
	
	public OrderItem(int order_id, int menu_id, int quantity, double price) {
		super();
		this.order_id = order_id;
		this.menu_id = menu_id;
		this.quantity = quantity;
		this.price = price;
	}

	public OrderItem(int order_item_id, int order_id, int menu_id, int quantity, double price) {
		super();
		this.order_item_id = order_item_id;
		this.order_id = order_id;
		this.menu_id = menu_id;
		this.quantity = quantity;
		this.price = price;
	}

	public int getOrder_item_id() {
		return order_item_id;
	}

	public void setOrder_item_id(int order_item_id) {
		this.order_item_id = order_item_id;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	public String getName() {
	    return name;
	}

	public void setName(String name) {
	    this.name = name;
	}

	@Override
	public String toString() {
		return "OrderItem [order_item_id=" + order_item_id + ", order_id=" + order_id + ", menu_id=" + menu_id
				+ ", quantity=" + quantity + ", price=" + price + ", name=" + name + "]";
	}

	
	
	
}
