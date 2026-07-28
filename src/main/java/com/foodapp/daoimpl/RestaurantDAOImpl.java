package com.foodapp.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.dao.RestaurantDAO;
import com.foodapp.model.Restaurant;
import com.foodapp.util.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

    private Connection con;

    public RestaurantDAOImpl() {
        con = DBConnection.getConnection();
    }

    @Override
    public List<Restaurant> getAllRestaurants() {

        List<Restaurant> list = new ArrayList<>();

        String sql = "SELECT * FROM restaurants WHERE is_active = true";

        try {

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Restaurant restaurant = new Restaurant();

                restaurant.setRestaurantId(rs.getInt("restaurant_id"));
                restaurant.setRestaurantName(rs.getString("restaurant_name"));
                restaurant.setDescription(rs.getString("description"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setCity(rs.getString("city"));
                restaurant.setLatitude(rs.getDouble("latitude"));
                restaurant.setLongitude(rs.getDouble("longitude"));
                restaurant.setRating(rs.getDouble("rating"));
                restaurant.setDeliveryTime(rs.getInt("delivery_time"));
                restaurant.setImage(rs.getString("image"));
                restaurant.setActive(rs.getBoolean("is_active"));

                list.add(restaurant);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public Restaurant getRestaurantById(int restaurantId) {

        String sql = "SELECT * FROM restaurants WHERE restaurant_id=?";

        try {

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Restaurant restaurant = new Restaurant();

                restaurant.setRestaurantId(rs.getInt("restaurant_id"));
                restaurant.setRestaurantName(rs.getString("restaurant_name"));
                restaurant.setDescription(rs.getString("description"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setCity(rs.getString("city"));
                restaurant.setLatitude(rs.getDouble("latitude"));
                restaurant.setLongitude(rs.getDouble("longitude"));
                restaurant.setRating(rs.getDouble("rating"));
                restaurant.setDeliveryTime(rs.getInt("delivery_time"));
                restaurant.setImage(rs.getString("image"));
                restaurant.setActive(rs.getBoolean("is_active"));

                return restaurant;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // =========================
    // SEARCH RESTAURANTS
    // =========================

    @Override
    public List<Restaurant> searchRestaurants(String keyword) {

        List<Restaurant> list = new ArrayList<>();

        String sql =
                "SELECT DISTINCT r.* " +
                "FROM restaurants r " +
                "LEFT JOIN menu m ON r.restaurant_id = m.restaurant_id " +
                "WHERE r.is_active = true " +
                "AND (" +
                "LOWER(r.restaurant_name) LIKE ? " +
                "OR LOWER(r.address) LIKE ? " +
                "OR LOWER(r.city) LIKE ? " +
                "OR LOWER(r.description) LIKE ? " +
                "OR LOWER(m.item_name) LIKE ? " +
                "OR LOWER(m.category) LIKE ?" +
                ")";

        try {

            PreparedStatement ps = con.prepareStatement(sql);

            String search = "%" + keyword.toLowerCase().trim() + "%";

            ps.setString(1, search);
            ps.setString(2, search);
            ps.setString(3, search);
            ps.setString(4, search);
            ps.setString(5, search);
            ps.setString(6, search);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Restaurant restaurant = new Restaurant();

                restaurant.setRestaurantId(rs.getInt("restaurant_id"));
                restaurant.setRestaurantName(rs.getString("restaurant_name"));
                restaurant.setDescription(rs.getString("description"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setCity(rs.getString("city"));
                restaurant.setLatitude(rs.getDouble("latitude"));
                restaurant.setLongitude(rs.getDouble("longitude"));
                restaurant.setRating(rs.getDouble("rating"));
                restaurant.setDeliveryTime(rs.getInt("delivery_time"));
                restaurant.setImage(rs.getString("image"));
                restaurant.setActive(rs.getBoolean("is_active"));

                list.add(restaurant);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}