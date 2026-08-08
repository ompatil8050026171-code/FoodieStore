package com.FoodieStore.comparator;

import java.util.Comparator;

import com.FoodieStore.Model.Menu;

public class MenuPriceComparatorDSC implements Comparator<Menu> {

	@Override
	public int compare(Menu m1, Menu m2) {
		 return Double.compare(m2.getPrice(), m1.getPrice());
	}

}
