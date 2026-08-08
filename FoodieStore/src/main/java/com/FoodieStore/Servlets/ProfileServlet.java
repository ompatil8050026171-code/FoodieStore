package com.FoodieStore.Servlets;

import java.io.IOException;

import com.FoodieStore.DAOimpl.UserDAOimpl;
import com.FoodieStore.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {

	    HttpSession session = req.getSession(false);

	    if (session == null || session.getAttribute("user") == null) {
	        resp.sendRedirect("login.jsp");
	        return;
	    }

	    req.getRequestDispatcher("profile.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession(false);

		if (session == null || session.getAttribute("user") == null) {
			resp.sendRedirect("login.jsp");
			return;
		}

		User sessionUser = (User) session.getAttribute("user");

		String name = req.getParameter("name");
		String email = req.getParameter("email");
		long phone = Long.parseLong(req.getParameter("phone"));
		String address = req.getParameter("address");

		User user = new User();

		user.setId(sessionUser.getId());
		user.setName(name);
		user.setEmail(email);
		user.setPhone(phone);
		user.setAddress(address);

		UserDAOimpl userdaoimpl = new UserDAOimpl();

		int i=userdaoimpl.updateUser(user);

		sessionUser.setName(name);
		sessionUser.setEmail(email);
		sessionUser.setPhone(phone);
		sessionUser.setAddress(address);

		if(i == 1){

		    session.setAttribute("success", "Profile Updated Successfully.");

		}
		else{

		    session.setAttribute("error", "Profile Update Failed.");

		}

		session.setAttribute("user", sessionUser);

		resp.sendRedirect("profile.jsp");
	}
}