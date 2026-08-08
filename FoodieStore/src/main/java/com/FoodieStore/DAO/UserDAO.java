package com.FoodieStore.DAO;

import java.util.List;

import com.FoodieStore.Model.User;


public interface UserDAO {

	int adduser(User user);
	
	User getUser(int id);
	
	int updateUser(User user);
	
	void deleteUser(int id);
	
	List<User> getAllUsers();
	
	User getUserByEmail(String email);
	
}
