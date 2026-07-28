package com.foodapp.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.foodapp.dao.UserDAO;
import com.foodapp.model.User;
import com.foodapp.util.DBConnection;

public class UserDAOImpl implements UserDAO {

    private Connection con;

    public UserDAOImpl() {
        con = DBConnection.getConnection();
    }

    @Override
    public boolean registerUser(User user) {

        String sql = "INSERT INTO users "
                + "(full_name, email, phone, password, address) "
                + "VALUES (?, ?, ?, ?, ?)";

        try {

            if (con == null) {
                System.out.println("ERROR: Database connection is NULL");
                return false;
            }

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getAddress());

            int row = ps.executeUpdate();

            ps.close();

            if (row > 0) {
                System.out.println("User registered successfully.");
                return true;
            }

        } catch (Exception e) {

            System.out.println("========== REGISTRATION ERROR ==========");
            e.printStackTrace();
            System.out.println("========================================");

        }

        return false;
    }

    @Override
    public User loginUser(String email, String password) {

        String sql = "SELECT * FROM users WHERE email=? AND password=?";

        try {

            if (con == null) {
                System.out.println("ERROR: Database connection is NULL");
                return null;
            }

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                User user = new User();

                user.setUserId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setPassword(rs.getString("password"));
                user.setAddress(rs.getString("address"));

                rs.close();
                ps.close();

                return user;
            }

            rs.close();
            ps.close();

        } catch (Exception e) {

            System.out.println("========== LOGIN ERROR ==========");
            e.printStackTrace();
            System.out.println("=================================");

        }

        return null;
    }

    @Override
    public User getUserById(int userId) {

        String sql = "SELECT * FROM users WHERE user_id=?";

        try {

            if (con == null) {
                System.out.println("ERROR: Database connection is NULL");
                return null;
            }

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                User user = new User();

                user.setUserId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setPassword(rs.getString("password"));
                user.setAddress(rs.getString("address"));

                rs.close();
                ps.close();

                return user;
            }

            rs.close();
            ps.close();

        } catch (Exception e) {

            System.out.println("========== GET USER ERROR ==========");
            e.printStackTrace();
            System.out.println("====================================");

        }

        return null;
    }

    @Override
    public boolean updateUser(User user) {

        String sql = "UPDATE users SET "
                + "full_name=?, email=?, phone=?, password=?, address=? "
                + "WHERE user_id=?";

        try {

            if (con == null) {
                System.out.println("ERROR: Database connection is NULL");
                return false;
            }

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getAddress());
            ps.setInt(6, user.getUserId());

            int row = ps.executeUpdate();

            ps.close();

            return row > 0;

        } catch (Exception e) {

            System.out.println("========== UPDATE USER ERROR ==========");
            e.printStackTrace();
            System.out.println("=======================================");

        }

        return false;
    }
}