package com.jobportal.admin.servlet;

import com.jobportal.bean.Job;
import com.jobportal.dao.AdminDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import com.jobportal.bean.Admin;

@WebServlet("/ManageJobsServlet")
public class ManageJobsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminSession") == null) {
            response.sendRedirect(request.getContextPath() + "/admin-login.jsp");
            return;
        }
        List<Job> jobList = new AdminDAO().getAllJobsForAdmin();
        request.setAttribute("jobList", jobList);
        request.getRequestDispatcher("/manage-jobs.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminSession") == null) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Administrator login required");
            return;
        }
        String action = request.getParameter("action");
        int id;
        try {
            id = Integer.parseInt(request.getParameter("id"));
            if (id <= 0) throw new NumberFormatException();
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid job ID");
            return;
        }
        AdminDAO dao = new AdminDAO();
        boolean ok;
        if ("status".equals(action)) {
            String status = request.getParameter("status");
            if (!"ACTIVE".equals(status) && !"CLOSED".equals(status)) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid job status");
                return;
            }
            ok = dao.updateJobStatus(id, status);
            if (ok) {
                Admin admin = (Admin) session.getAttribute("adminSession");

                boolean logged = dao.logAdminAction(
                    admin.getAdminId(),
                    "Changed job ID " + id + " status to " + status
                );

                System.out.println("Job status updated: " + ok);
                System.out.println("Job activity log saved: " + logged);
            }

            if (ok) {
                Admin admin = (Admin) session.getAttribute("adminSession");

                boolean logged = dao.logAdminAction(
                    admin.getAdminId(),
                    "Changed job ID " + id + " status to " + status
                );

                if (!logged) {
                    System.err.println(
                        "WARNING: Failed to log status change for job ID " + id
                    );
                }
            }
        } else if ("delete".equals(action)) {
            // Deliberately disable destructive deletion; closing a job preserves applications.
            response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                    "Deletion disabled. Close the job instead to preserve applications.");
            return;
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
            return;
        }
        response.sendRedirect(request.getContextPath() + "/ManageJobsServlet?updated=" + (ok ? "success" : "error"));
    }
}
