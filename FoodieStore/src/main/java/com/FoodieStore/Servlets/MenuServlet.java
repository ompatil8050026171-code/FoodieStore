package com.FoodieStore.Servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.FoodieStore.DAOimpl.MenuDAOimpl;
import com.FoodieStore.DAOimpl.ResturantDAOimpl;
import com.FoodieStore.Model.Menu;
import com.FoodieStore.Model.Resturant;
import com.FoodieStore.comparator.MenuPriceComparatorASC;
import com.FoodieStore.comparator.MenuPriceComparatorDSC;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menuss")
public class MenuServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));

		MenuDAOimpl menuimpl = new MenuDAOimpl();

		List<Menu> menu = menuimpl.getAllMenuByResturant(restaurantId);

		String filter = req.getParameter("filter");

		if (filter != null && !filter.equalsIgnoreCase("all")) {

			

			if(filter != null) {

			    List<Menu> filteredMenu = new ArrayList<>();

			    switch(filter) {

			    case "VEG":
			        for(Menu m : menu) {
			            if(m.getFoodType().equalsIgnoreCase("VEG")) {
			                filteredMenu.add(m);
			            }
			        }
			        menu = filteredMenu;
			        break;

			    case "NON-VEG":
			        for(Menu m : menu) {
			            if(m.getFoodType().equalsIgnoreCase("NON-VEG")) {
			                filteredMenu.add(m);
			            }
			        }
			        menu = filteredMenu;
			        break;

			    case "ALL":
			    default:
			        break;
			    }
			}

		}

		String sort = req.getParameter("sort");

		if (sort != null) {

			switch (sort) {

			case "priceAsc":
				Collections.sort(menu, new MenuPriceComparatorASC());
				break;

			case "priceDesc":
				Collections.sort(menu, new MenuPriceComparatorDSC());
				break;

			}

		}

		ResturantDAOimpl restDao = new ResturantDAOimpl();

		Resturant resturant = restDao.getResturant(restaurantId);

		req.setAttribute("resturant", resturant);

		req.setAttribute("menu", menu);

		req.getRequestDispatcher("menu.jsp").forward(req, resp);

	}
}