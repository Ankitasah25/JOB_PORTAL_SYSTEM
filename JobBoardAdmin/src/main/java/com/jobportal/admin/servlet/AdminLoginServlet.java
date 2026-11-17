package com.jobportal.admin.servlet;

import com.jobportal.admin.util.DBConnection;
import com.jobportal.bean.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Retrieve form input parameters from admin-login.jsp
        String usernameInput = request.getParameter("username");
        String passwordInput = request.getParameter("password");

        // Validate inputs
        if (usernameInput == null || usernameInput.trim().isEmpty() || 
            passwordInput == null || passwordInput.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Username and password cannot be empty.");
            request.getRequestDispatcher("admin-login.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            // Query to find admin by username or email
            String sql = "SELECT admin_id, username, email, password, role, created_at " +
                         "FROM admin WHERE username = ? OR email = ?";
            
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, usernameInput);
                stmt.setString(2, usernameInput);

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        String storedPassword = rs.getString("password");

                        // Note: If you store plain text passwords (like 'admin123' from setup), 
                        // use: if (passwordInput.equals(storedPassword))
                        // If using BCrypt, use your BCrypt verification logic here.
                        if (passwordInput.equals(storedPassword)) {
                            
                            // Create Admin bean object
                            Admin admin = new Admin();
                            admin.setAdminId(rs.getInt("admin_id"));
                            admin.setUsername(rs.getString("username"));
                            admin.setEmail(rs.getString("email"));
                            admin.setRole(rs.getString("role"));
                            admin.setCreatedAt(rs.getTimestamp("created_at"));

                            // Create session and store admin object
                            HttpSession session = request.getSession();
                            session.setAttribute("adminSession", admin);
                            session.setMaxInactiveInterval(30 * 60); // 30 minutes session timeout

                            // Redirect to dashboard page
                            response.sendRedirect("dashboard.jsp");
                            return;
                        }
                    }
                }
            }

            // Authentication failed
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("admin-login.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error occurred: " + e.getMessage());
            request.getRequestDispatcher("admin-login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Direct GET requests back to the login page
        response.sendRedirect("admin-login.jsp");
    }
}