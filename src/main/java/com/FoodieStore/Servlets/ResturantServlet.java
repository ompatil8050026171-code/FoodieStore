package com.FoodieStore.Servlets;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import com.FoodieStore.DAOimpl.ResturantDAOimpl;
import com.FoodieStore.Model.Resturant;
import com.FoodieStore.comparator.NameComparatorASC;
import com.FoodieStore.comparator.NameComparatorDSC;
import com.FoodieStore.comparator.RatingsComparatorDSC;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class ResturantServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		ResturantDAOimpl resturantdaoimpl = new ResturantDAOimpl();

		List<Resturant> allresturants = resturantdaoimpl.getAllResturant();

		String sort = req.getParameter("sort");

		if(sort != null) {

			switch(sort) {

			case "nameAsc":
				Collections.sort(allresturants, new NameComparatorASC());
				break;

			case "nameDesc":
				Collections.sort(allresturants, new NameComparatorDSC());
				break;

			case "ratingDesc":
				Collections.sort(allresturants, new RatingsComparatorDSC());
				break;

			}

		}

		req.setAttribute("allresturants", allresturants);

		RequestDispatcher rd = req.getRequestDispatcher("home.jsp");
		rd.forward(req, resp);
	}
}