package com.FoodieStore.Servlets;

import java.io.IOException;
import java.util.List;

import com.FoodieStore.DAOimpl.OrderItemDAOimpl;
import com.FoodieStore.Model.OrderItem;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/orderDetails")
public class OrderDetailsServlet extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int orderId=Integer.parseInt(req.getParameter("orderId"));
		
		OrderItemDAOimpl orderitemdaoimpl=new OrderItemDAOimpl();
		
		List<OrderItem> orderitem=orderitemdaoimpl.getOrderItemByOrderId(orderId);
		
		req.setAttribute("orderitem", orderitem);
		
		RequestDispatcher rd = req.getRequestDispatcher("orderDetails.jsp");
		rd.forward(req, resp);
	}
}
