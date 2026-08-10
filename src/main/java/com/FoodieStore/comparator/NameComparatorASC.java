package com.FoodieStore.comparator;

import java.util.Comparator;

import com.FoodieStore.Model.Resturant;

public class NameComparatorASC implements Comparator<Resturant> {

	@Override
	public int compare(Resturant r1, Resturant r2) {
		return r1.getResturant_name().compareToIgnoreCase(r2.getResturant_name());
	}

}
