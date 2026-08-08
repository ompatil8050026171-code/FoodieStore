package com.FoodieStore.Servlets;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.FoodieStore.DAOimpl.UserDAOimpl;
import com.FoodieStore.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")

public class RegisterServlet extends HttpServlet{
		
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException 
	{
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String address=req.getParameter("address");
		String role=req.getParameter("role");
		String password=req.getParameter("password");
		
		long Phone=Long.parseLong(phone);
		
		String DbPassword=BCrypt.hashpw(password, BCrypt.gensalt(12));
		 
		User user=new User(name,email,Phone,address,role,DbPassword);
		
		UserDAOimpl userdaoimpl=new UserDAOimpl();
		
		int i=userdaoimpl.adduser(user);
		
		if(i==1)
		{
			resp.sendRedirect("login.jsp");
		}
		else
		{
			resp.sendRedirect("register.jsp");
		}
	}
}