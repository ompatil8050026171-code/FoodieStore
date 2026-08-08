package com.FoodieStore.comparator;

import java.util.Comparator;

import com.FoodieStore.Model.Resturant;

public class RatingsComparatorDSC implements Comparator<Resturant> {

	@Override
	public int compare(Resturant r1, Resturant r2) {
		return Double.compare(r2.getRatings(), r1.getRatings());
	}

}
