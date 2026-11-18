package com.java;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Get data from register.jsp
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");

        // Create User object
        User user = new User();

        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhone(phone);

        // Address is not present in register.jsp
        user.setAddress("");

        // Create DAO object
        UserDAO userDAO = new UserDAO();

        // Register user
        boolean success = userDAO.registerUser(user);

        if (success) {
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("register.jsp?error=RegistrationFailed");
        }
    }
}