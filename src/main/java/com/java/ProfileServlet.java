package com.java;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Check login session
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get logged-in user
        User user = (User) session.getAttribute("user");

        // Get updated profile information
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        // Update User object
        user.setName(name);
        user.setPhone(phone);
        user.setAddress(address);

        // Update database
        UserDAO userDAO = new UserDAO();

        boolean success = userDAO.updateProfile(user);

        if (success) {

            // Update session with latest user information
            session.setAttribute("user", user);

            response.sendRedirect("profile.jsp?message=ProfileUpdated");

        } else {

            response.sendRedirect("profile.jsp?error=UpdateFailed");
        }
    }

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Check login session
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Open profile page
        response.sendRedirect("profile.jsp");
    }
}