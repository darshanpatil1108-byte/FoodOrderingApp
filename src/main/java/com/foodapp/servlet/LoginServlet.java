package com.foodapp.servlet;

import java.io.IOException;

import com.foodapp.dao.UserDAO;
import com.foodapp.daoimpl.UserDAOImpl;
import com.foodapp.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAOImpl();

        User user = dao.loginUser(email, password);

        if (user != null) {

            HttpSession session = request.getSession();

            // Store logged-in user
            session.setAttribute("user", user);

            // Go to main Foodie home page
            response.sendRedirect(
                request.getContextPath() + "/index.jsp"
            );

        } else {

            response.sendRedirect(
                request.getContextPath()
                + "/jsp/login.jsp?error=invalid"
            );
        }
    }
}