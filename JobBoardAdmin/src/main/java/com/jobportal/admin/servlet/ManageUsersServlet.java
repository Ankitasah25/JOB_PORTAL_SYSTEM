package com.jobportal.admin.servlet;

import com.jobportal.bean.Admin;
import com.jobportal.bean.User;
import com.jobportal.dao.AdminDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/ManageUsersServlet")
public class ManageUsersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Session security check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminSession") == null) {
            response.sendRedirect("admin-login.jsp");
            return;
        }

        String action = request.getParameter("action");
        AdminDAO adminDAO = new AdminDAO();

        if (action != null) {
            try {
                int userId = Integer.parseInt(request.getParameter("id"));
                
                if (action.equals("status")) {
                    String newStatus = request.getParameter("status");
                    boolean updated = adminDAO.updateUserStatus(userId, newStatus);

                    System.out.println("User status updated: " + updated);

                    if (updated) {
                        Object adminSession = session.getAttribute("adminSession");

                        System.out.println("Admin session: " + adminSession);

                        if (adminSession instanceof Admin) {
                            Admin admin = (Admin) adminSession;

                            boolean logged = adminDAO.logAdminAction(
                                admin.getAdminId(),
                                "Changed user ID " + userId + " status to " + newStatus
                            );

                            System.out.println("Activity log saved: " + logged);
                        } else {
                            System.out.println("ERROR: adminSession is not an Admin object");
                        }
                    }
                } else if (action.equals("delete")) {
                    adminDAO.deleteUser(userId);
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
            response.sendRedirect("ManageUsersServlet");
            return;
        }

        // Fetch all users and forward to JSP
        List<User> userList = adminDAO.getAllUsers();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("manage-users.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}