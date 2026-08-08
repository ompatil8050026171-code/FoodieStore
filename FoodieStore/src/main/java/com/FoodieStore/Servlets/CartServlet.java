package com.FoodieStore.Servlets;

import java.io.IOException;

import com.FoodieStore.DAOimpl.MenuDAOimpl;
import com.FoodieStore.Model.Cart;
import com.FoodieStore.Model.CartItem;
import com.FoodieStore.Model.Menu;
import com.mysql.cj.Session;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        // Login check
        if (session.getAttribute("user") == null) {
        	String redirect = req.getParameter("redirect");
        	String restaurantId = req.getParameter("restaurantId");

        	resp.sendRedirect(
        	    "login.jsp?redirect=" + redirect + "&restaurantId=" + restaurantId
        	);
            return;
        }

        Cart cart = (Cart) session.getAttribute("cart");

        Integer newRestaurantId = Integer.parseInt(req.getParameter("restaurantId"));
        Integer restaurantId = (Integer) session.getAttribute("restaurantId");

        if (cart == null || restaurantId == null || restaurantId != newRestaurantId) {
            cart = new Cart();
            session.setAttribute("cart", cart);
            session.setAttribute("restaurantId", newRestaurantId);
        }

        String action = req.getParameter("action");

        if ("add".equals(action)) {
            addToCart(req, cart);
        } else if ("update".equals(action)) {
            updateItemInCart(req, cart);
        } else if ("delete".equals(action)) {
            removeItemFromCart(req, cart);
        }

        RequestDispatcher rd = req.getRequestDispatcher("cart.jsp");
        rd.forward(req, resp);
    }

    private void removeItemFromCart(HttpServletRequest req, Cart cart) {
        int menuId = Integer.parseInt(req.getParameter("menuId"));
        cart.remove(menuId);
    }

    private void updateItemInCart(HttpServletRequest req, Cart cart) {
    	
    	int menuId=Integer.parseInt(req.getParameter("menuId"));
    	int quantity=Integer.parseInt(req.getParameter("quantity"));
    	
    	cart.updateItem(menuId,quantity);
    }

    private void addToCart(HttpServletRequest req, Cart cart) {

       
    	int quantity = Integer.parseInt(req.getParameter("quantity"));
        int menuId = Integer.parseInt(req.getParameter("menuId"));
        
        MenuDAOimpl menuDAO = new MenuDAOimpl();
        Menu menu = menuDAO.getMenu(menuId);

        HttpSession session=req.getSession();
        session.setAttribute("restaurantId", menu.getResturant_id());

        CartItem cartItem = new CartItem(
                menu.getMenu_id(),
                menu.getResturant_id(),
                menu.getName(),
                menu.getPrice(),
                quantity);

        
        cart.addItem(cartItem);
    }
}