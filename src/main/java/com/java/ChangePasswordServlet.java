package com.java;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Get session
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get logged-in user
        User user = (User) session.getAttribute("user");

        // Get passwords from change-password.jsp
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Check new password and confirm password
        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("change-password.jsp?error=PasswordMismatch");
            return;
        }

        // Change password using DAO
        UserDAO userDAO = new UserDAO();

        boolean success = userDAO.changePassword(
                user.getUserId(),
                currentPassword,
                newPassword
        );

        if (success) {

            // Update password in session object
            user.setPassword(newPassword);
            session.setAttribute("user", user);

            response.sendRedirect("profile.jsp?message=PasswordChanged");

        } else {

            response.sendRedirect("change-password.jsp?error=WrongCurrentPassword");
        }
    }
}