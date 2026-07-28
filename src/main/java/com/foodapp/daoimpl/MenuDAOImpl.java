package com.foodapp.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.dao.MenuDAO;
import com.foodapp.model.Menu;
import com.foodapp.util.DBConnection;

public class MenuDAOImpl implements MenuDAO {

    private Connection con;

    public MenuDAOImpl() {
        con = DBConnection.getConnection();
    }

    @Override
    public List<Menu> getMenuByRestaurantId(int restaurantId) {

        List<Menu> list = new ArrayList<>();

        String sql = "SELECT * FROM menu WHERE restaurant_id=? AND is_available=true";

        try {

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Menu menu = new Menu();

                menu.setMenuId(rs.getInt("menu_id"));
                menu.setRestaurantId(rs.getInt("restaurant_id"));
                menu.setItemName(rs.getString("item_name"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getDouble("price"));
                menu.setCategory(rs.getString("category"));
                menu.setImage(rs.getString("image"));
                menu.setAvailable(rs.getBoolean("is_available"));

                list.add(menu);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public Menu getMenuById(int menuId) {

        String sql = "SELECT * FROM menu WHERE menu_id=?";

        try {

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, menuId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Menu menu = new Menu();

                menu.setMenuId(rs.getInt("menu_id"));
                menu.setRestaurantId(rs.getInt("restaurant_id"));
                menu.setItemName(rs.getString("item_name"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getDouble("price"));
                menu.setCategory(rs.getString("category"));
                menu.setImage(rs.getString("image"));
                menu.setAvailable(rs.getBoolean("is_available"));

                return menu;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}