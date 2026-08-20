package com.foodapp.servlet;

import java.io.IOException;
import java.util.List;

import com.foodapp.dao.RestaurantDAO;
import com.foodapp.daoimpl.RestaurantDAOImpl;
import com.foodapp.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/restaurants")
public class RestaurantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("search");

        RestaurantDAO dao = new RestaurantDAOImpl();

        List<Restaurant> restaurants;

        try {

            if (keyword != null && !keyword.trim().isEmpty()) {

                restaurants = dao.searchRestaurants(keyword.trim());

                request.setAttribute(
                    "searchKeyword",
                    keyword.trim()
                );

            } else {

                restaurants = dao.getAllRestaurants();

            }

            request.setAttribute(
                "restaurants",
                restaurants
            );

            request.getRequestDispatcher(
                "/jsp/dashboard.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException(
                "Error loading restaurants",
                e
            );
        }
    }
}