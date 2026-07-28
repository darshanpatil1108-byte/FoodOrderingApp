
package com.foodapp.servlet;

import java.io.IOException;

import com.foodapp.model.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.getItems().isEmpty()) {

            response.sendRedirect(
                request.getContextPath() + "/cart"
            );

            return;
        }

        request.setAttribute("cart", cart);

        request.getRequestDispatcher("/jsp/checkout.jsp")
               .forward(request, response);
    }
}

