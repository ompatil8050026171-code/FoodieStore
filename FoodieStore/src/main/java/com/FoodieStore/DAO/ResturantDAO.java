package com.FoodieStore.DAO;

import java.util.List;

import com.FoodieStore.Model.Resturant;

public interface ResturantDAO {
	
	void addResturant(Resturant res);
	Resturant getResturant(int resturant_id);
	void updateResturant(Resturant res);
	void deleteResturant(int resturant_id);
	List<Resturant> getAllResturant();

}
