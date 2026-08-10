package com.FoodieStore.DAO;

import java.util.List;

import com.FoodieStore.Model.OrderItem;

public interface OrderItemDAO {
	
	void addorderItem(OrderItem orderitem);
	
	OrderItem getOrderItemById(int orderId);
	
	List<OrderItem> getAllOrderItems();
	
	void updateOrderItem(OrderItem orderitem);
	
	void deleteOrderItem(int id);

	List<OrderItem> getOrderItemByOrderId(int orderId);

}
