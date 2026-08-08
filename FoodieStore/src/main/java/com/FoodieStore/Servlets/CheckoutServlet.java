package com.FoodieStore.Servlets;


import java.io.IOException;
import java.sql.Timestamp;

import com.FoodieStore.DAOimpl.OrderItemDAOimpl;
import com.FoodieStore.DAOimpl.OrdersDAOimpl;
import com.FoodieStore.Model.Cart;
import com.FoodieStore.Model.CartItem;
import com.FoodieStore.Model.OrderItem;
import com.FoodieStore.Model.Orders;
import com.FoodieStore.Model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkoutServlet")
public class CheckoutServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session =req.getSession();
		User user=(User)session.getAttribute("user");
		Cart cart=(Cart)session.getAttribute("cart");
		Integer restaurantId=(Integer)session.getAttribute("restaurantId");
		double grandTotal=(double)session.getAttribute("grandTotal");
		
		if(user!=null)
		{
			if(cart!=null && !cart.getItems().isEmpty())
			{
				int userId=user.getId();
				String address=req.getParameter("address");
				String paymentMode=req.getParameter("paymentMode");
				
				Orders order=new Orders(restaurantId, 
						userId, 
						grandTotal,
						new Timestamp(System.currentTimeMillis()), 
						address, paymentMode);
				
				OrdersDAOimpl orderdaoimpl=new OrdersDAOimpl();
				int orderId=orderdaoimpl.addOrder(order);
				OrderItemDAOimpl orderdaoitemimpl=new OrderItemDAOimpl();
				
				for(CartItem item : cart.getItems().values())
				{
					int menuId=item.getMenuId();
					int qty=item.getQty();
					double price=item.getPrice();
					
					OrderItem orderitem =new OrderItem(orderId,menuId,qty,price);
					orderdaoitemimpl.addorderItem(orderitem);
				}
				session.removeAttribute("grandTotal");
				session.removeAttribute("restaurantId");
				session.removeAttribute("cart");
				resp.sendRedirect("order.jsp");
			}
		}
		else
		{
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
			
		}
	
	}
}
