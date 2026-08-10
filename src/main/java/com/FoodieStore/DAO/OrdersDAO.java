package com.FoodieStore.DAO;

import java.util.List;

import com.FoodieStore.Model.Orders;

public interface OrdersDAO {
	
	int addOrder(Orders orders);
	Orders getOrder(int id);
	List<Orders> getAllOrders();
	void updateOrders(Orders order);
	void deleteOrder(int id);
	List<Orders> getOrderByUserId(int userId);

}
