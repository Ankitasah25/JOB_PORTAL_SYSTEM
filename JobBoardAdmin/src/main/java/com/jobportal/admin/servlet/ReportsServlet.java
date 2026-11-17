package com.jobportal.admin.servlet;

import com.jobportal.dao.AdminDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet("/ReportsServlet")
public class ReportsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminSession") == null) {
            response.sendRedirect(request.getContextPath() + "/admin-login.jsp");
            return;
        }

        // Always supply the seven names expected by reports.jsp.
        String[] jspKeys = {"users", "recruiters", "seekers", "jobs",
                "activeJobs", "applications", "shortlisted"};
        for (String key : jspKeys) {
            request.setAttribute(key, 0);
        }

        try {
            Map<String, Integer> stats = new AdminDAO().getReportStatistics();
            // Map DAO names to the names used by the existing JSP.
            request.setAttribute("users", value(stats, "totalUsers", "users"));
            request.setAttribute("recruiters", value(stats, "recruiters"));
            request.setAttribute("seekers", value(stats, "jobSeekers", "seekers"));
            request.setAttribute("jobs", value(stats, "totalJobs", "jobs"));
            request.setAttribute("activeJobs", value(stats, "activeJobs"));
            request.setAttribute("applications", value(stats, "totalApplications", "applications"));
            request.setAttribute("shortlisted", value(stats, "shortlistedApplications", "shortlisted"));
        } catch (IllegalStateException ex) {
            getServletContext().log("Failed to load admin reports", ex);
            request.setAttribute("error",
                    "Unable to load statistics. Check the database connection and Tomcat console.");
        }

        request.getRequestDispatcher("/reports.jsp").forward(request, response);
    }

    private static int value(Map<String, Integer> stats, String... keys) {
        if (stats == null) {
            return 0;
        }
        for (String key : keys) {
            Integer result = stats.get(key);
            if (result != null) {
                return result;
            }
        }
        return 0;
    }
}
