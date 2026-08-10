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
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAOimpl dao = new UserDAOimpl();
        User user = dao.getUserByEmail(email);

        if (user == null) {
            response.sendRedirect("register.jsp");
            return;
        }

        if (user.getEmail().equals(email) &&  BCrypt.checkpw(password, user.getPassword())) {

            HttpSession session = request.getSession();

            String redirect = request.getParameter("redirect");
            String restaurantId = request.getParameter("restaurantId");

            session.setAttribute("username", user.getName());
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getId());

            if ("menu".equals(redirect)) {

                response.sendRedirect("menuss?restaurantId=" + restaurantId);

            } else {

                response.sendRedirect("index.jsp");
            }

        } else {

            response.sendRedirect("register.jsp");
        }
    }
}