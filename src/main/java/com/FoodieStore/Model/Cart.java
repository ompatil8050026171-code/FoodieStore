package com.FoodieStore.Model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

	
	private Map<Integer,CartItem> items;
	

	public Cart()
	{
		items=new HashMap<Integer,CartItem>();
	}
	
	public Map<Integer, CartItem> getItems() {
		return items;
	}

	public void addItem(CartItem cartItem) {
		
		int menuId=cartItem.getMenuId();
		
		if(items.containsKey(menuId))
		{
			CartItem existingCartItem=items.get(menuId);
			existingCartItem.setQty(existingCartItem.getQty()+1);
		}
		else
		{
			items.put(menuId, cartItem);
		}
	}

	public void remove(int menuId) {
		
		
		items.remove(menuId);
		
	}

	public void updateItem(int menuId, int quantity) {
		
		if(items.containsKey(menuId))
		{
			CartItem cartitem=items.get(menuId);
			
			if(quantity<1)
			{
				items.remove(menuId);
			}
			else
			{
				cartitem.setQty(quantity);
				items.put(menuId, cartitem);
			}
			
			
		}
	}
}
