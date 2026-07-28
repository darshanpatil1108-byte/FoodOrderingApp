package com.foodapp.servlet;

import java.io.IOException;
import java.util.List;

import com.foodapp.dao.MenuDAO;
import com.foodapp.daoimpl.MenuDAOImpl;
import com.foodapp.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String restaurantId = request.getParameter("restaurantId");

        if (restaurantId == null || restaurantId.isEmpty()) {
            response.sendRedirect("restaurants");
            return;
        }

        int id = Integer.parseInt(restaurantId);

        MenuDAO dao = new MenuDAOImpl();

        List<Menu> menuList = dao.getMenuByRestaurantId(id);

        request.setAttribute("menuList", menuList);
        request.setAttribute("restaurantId", id);

        request.getRequestDispatcher("jsp/menu.jsp")
               .forward(request, response);
    }
}