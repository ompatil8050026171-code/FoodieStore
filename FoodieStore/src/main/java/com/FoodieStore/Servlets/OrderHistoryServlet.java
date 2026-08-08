package com.FoodieStore.Servlets;

import java.io.IOException;
import java.util.List;

import com.FoodieStore.DAOimpl.OrdersDAOimpl;
import com.FoodieStore.Model.Orders;
import com.FoodieStore.Model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orderHistory")
public class OrderHistoryServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session=req.getSession();
		User user=(User)session.getAttribute("user");
		int userid=user.getId();
		
		OrdersDAOimpl orderdaoimpl=new OrdersDAOimpl();
		
		List<Orders> order=orderdaoimpl.getOrderByUserId(userid);

		req.setAttribute("order", order);

		RequestDispatcher rd = req.getRequestDispatcher("orderHistory.jsp");

		rd.forward(req, resp);
		
		
	}

}
