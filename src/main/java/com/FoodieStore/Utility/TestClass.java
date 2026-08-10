package com.FoodieStore.Utility;

import java.util.List;

import com.FoodieStore.DAOimpl.OrdersDAOimpl;
import com.FoodieStore.Model.Orders;

public class TestClass {

	public static void main(String[] args) {
		
		OrdersDAOimpl or=new OrdersDAOimpl();
		
		List<Orders> li=or.getOrderByUserId(1);
		System.out.println(li);
	}
	

}
