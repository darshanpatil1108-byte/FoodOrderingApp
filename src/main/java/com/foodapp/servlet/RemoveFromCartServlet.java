
package com.foodapp.servlet;

import java.io.IOException;

import com.foodapp.model.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/removeFromCart")
public class RemoveFromCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String menuIdValue = request.getParameter("menuId");

        if (menuIdValue != null && !menuIdValue.isEmpty()) {

            int menuId = Integer.parseInt(menuIdValue);

            HttpSession session = request.getSession();

            Cart cart = (Cart) session.getAttribute("cart");

            if (cart != null) {
                cart.removeItem(menuId);
                session.setAttribute("cart", cart);
            }
        }

        response.sendRedirect(
            request.getContextPath() + "/cart"
        );
    }
}

