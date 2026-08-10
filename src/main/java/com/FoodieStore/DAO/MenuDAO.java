package com.FoodieStore.DAO;

import java.util.List;

import com.FoodieStore.Model.Menu;

public interface MenuDAO {

	void addMenu(Menu menu);	
	void updateMenu(Menu menu);
	void deleteMenu(int menu_id);
	Menu getMenu(int menu_id);
	List<Menu> getAllMenu();
	List<Menu> getAllMenuByResturant(int resturant_id);
	List<Menu> getMenuByFoodType(int resturant_id, String foodType);
}
