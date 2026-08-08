package com.FoodieStore.comparator;

import java.util.Comparator;

import com.FoodieStore.Model.Resturant;

public class NameComparatorDSC implements Comparator<Resturant> {

	@Override
	public int compare(Resturant r1, Resturant r2) {
		
		return r2.getResturant_name().compareToIgnoreCase(r1.getResturant_name());
	}
	
}
