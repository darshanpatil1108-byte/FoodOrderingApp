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
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String address = request.getParameter("address");

        // Debug information
        System.out.println("========== REGISTRATION DATA ==========");
        System.out.println("Full Name: " + fullName);
        System.out.println("Email: " + email);
        System.out.println("Phone: " + phone);
        System.out.println("Address: " + address);
        System.out.println("=======================================");

        // Check required fields
        if (fullName == null || fullName.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || phone == null || phone.trim().isEmpty()
                || password == null || password.trim().isEmpty()
                || address == null || address.trim().isEmpty()) {

            response.sendRedirect(
                request.getContextPath()
                + "/jsp/register.jsp?error=failed"
            );

            return;
        }

        // Check password
        if (!password.equals(confirmPassword)) {

            response.sendRedirect(
                request.getContextPath()
                + "/jsp/register.jsp?error=password"
            );

            return;
        }

        // Create User object
        User user = new User();

        user.setFullName(fullName.trim());
        user.setEmail(email.trim());
        user.setPhone(phone.trim());
        user.setPassword(password);
        user.setAddress(address.trim());

        // DAO
        UserDAO dao = new UserDAOImpl();

        // Save user to MySQL
        boolean result = dao.registerUser(user);

        if (result) {

            System.out.println("USER REGISTERED SUCCESSFULLY");

            response.sendRedirect(
                request.getContextPath()
                + "/jsp/login.jsp?success=registered"
            );

        } else {

            System.out.println("REGISTRATION FAILED");

            response.sendRedirect(
                request.getContextPath()
                + "/jsp/register.jsp?error=failed"
            );
        }
    }
}