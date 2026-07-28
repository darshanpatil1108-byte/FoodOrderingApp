package com.foodapp.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Get checkout details
        String fullName = request.getParameter("fullName");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String pinCode = request.getParameter("pinCode");
        String paymentMethod = request.getParameter("paymentMethod");

        // For now, simply show order success page
        request.setAttribute("fullName", fullName);
        request.setAttribute("mobile", mobile);
        request.setAttribute("address", address);
        request.setAttribute("city", city);
        request.setAttribute("pinCode", pinCode);
        request.setAttribute("paymentMethod", paymentMethod);

        request.getRequestDispatcher("/jsp/order-success.jsp")
               .forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect(
            request.getContextPath() + "/"
        );
    }
}