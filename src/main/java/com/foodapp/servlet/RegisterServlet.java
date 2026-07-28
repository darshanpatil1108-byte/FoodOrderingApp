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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        // Get data from register.jsp
        String fullName = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Check password
        if (!password.equals(confirmPassword)) {

            response.sendRedirect(
                request.getContextPath() +
                "/jsp/register.jsp?error=password"
            );

            return;
        }

        // Create User object
        User user = new User();

        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword(password);

        // Address is not currently in our registration form
        user.setAddress("");

        // DAO
        UserDAO dao = new UserDAOImpl();

        // Save user to MySQL
        boolean result = dao.registerUser(user);

        if (result) {

            // Registration successful
            response.sendRedirect(
                request.getContextPath() +
                "/jsp/login.jsp?success=registered"
            );

        } else {

            // Registration failed
            response.sendRedirect(
                request.getContextPath() +
                "/jsp/register.jsp?error=failed"
            );
        }
    }
}