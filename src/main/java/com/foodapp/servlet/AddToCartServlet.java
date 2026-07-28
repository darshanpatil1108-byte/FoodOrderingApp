package com.foodapp.servlet;
import java.io.IOException;

import com.foodapp.dao.MenuDAO;
import com.foodapp.daoimpl.MenuDAOImpl;
import com.foodapp.model.Cart;
import com.foodapp.model.CartItem;
import com.foodapp.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        int menuId = Integer.parseInt(
            request.getParameter("menuId")
        );

        MenuDAO dao = new MenuDAOImpl();

        Menu menu = dao.getMenuById(menuId);

        if (menu == null) {
            response.sendRedirect(
                request.getContextPath() + "/"
            );
            return;
        }

        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
        }

        CartItem cartItem = new CartItem(menu, 1);

        cart.addItem(cartItem);

        session.setAttribute("cart", cart);

        response.sendRedirect(
            request.getContextPath() + "/cart"
        );
    }
}