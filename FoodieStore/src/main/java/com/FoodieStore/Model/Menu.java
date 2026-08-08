package com.FoodieStore.Model;

public class Menu {

	private int menu_id;
	private String name;
	private String description;
	private double price;
	private String isAvailable;
	private String food_Type;
	private int resturant_id;
	private String image;

	

	public Menu(int menu_id, String name, String description, double price, String isAvailable, String food_Type,
			int resturant_id, String image) {
		super();
		this.menu_id = menu_id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.isAvailable = isAvailable;
		this.food_Type = food_Type;
		this.resturant_id = resturant_id;
		this.image = image;
	}

	public Menu(String name, String description, double price, String isAvailable,
			String foodType, int resturant_id) {
		super();
		this.name = name;
		this.description = description;
		this.price = price;
		this.isAvailable = isAvailable;
		this.food_Type = foodType;
		this.resturant_id = resturant_id;
	}

	public int getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getIsAvailable() {
		return isAvailable;
	}

	public void setIsAvailable(String isAvailable) {
		this.isAvailable = isAvailable;
	}

	public String getFoodType() {
		return food_Type;
	}

	public void setFoodType(String foodType) {
		this.food_Type = foodType;
	}

	public int getResturant_id() {
		return resturant_id;
	}

	public void setResturant_id(int resturant_id) {
		this.resturant_id = resturant_id;
	}

	@Override
	public String toString() {
		return "Menu [menu_id=" + menu_id + ", name=" + name + ", description=" + description + ", price=" + price
				+ ", isAvailable=" + isAvailable + ", foodType=" + food_Type + ", resturant_id=" + resturant_id + "]";
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
}