package com.java;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    // Database connection details
    private static final String URL =
            "jdbc:mysql://localhost:3306/onlinejobportal";
    private static final String USER = "root";
    private static final String PASSWORD = "Surya@_1116";

    // Get database connection
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return java.sql.DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // Register new user
    public boolean registerUser(User user) {

        String sql = "INSERT INTO users (name, email, password, phone, address) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getAddress());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Login user
    public User loginUser(String email, String password) {

        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                User user = new User();

                user.setUserId(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));

                return user;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // Update user profile
    public boolean updateProfile(User user) {

        String sql = "UPDATE users SET name = ?, phone = ?, address = ? "
                   + "WHERE user_id = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getName());
            ps.setString(2, user.getPhone());
            ps.setString(3, user.getAddress());
            ps.setInt(4, user.getUserId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Change password
    public boolean changePassword(int userId, String oldPassword,
                                  String newPassword) {

        String checkSql =
                "SELECT user_id FROM users WHERE user_id = ? AND password = ?";

        String updateSql =
                "UPDATE users SET password = ? WHERE user_id = ?";

        try (Connection con = getConnection();
             PreparedStatement checkPs = con.prepareStatement(checkSql)) {

            checkPs.setInt(1, userId);
            checkPs.setString(2, oldPassword);

            ResultSet rs = checkPs.executeQuery();

            if (rs.next()) {

                try (PreparedStatement updatePs =
                             con.prepareStatement(updateSql)) {

                    updatePs.setString(1, newPassword);
                    updatePs.setInt(2, userId);

                    return updatePs.executeUpdate() > 0;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}