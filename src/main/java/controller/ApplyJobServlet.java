package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ApplicationDAO;

@WebServlet("/ApplyJobServlet")
public class ApplyJobServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Integer userId =
                (Integer) session.getAttribute("userId");

        // First check whether user is logged in
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get jobId from the form
        String jobIdString =
                request.getParameter("jobId");

        // Check whether jobId was received
        if (jobIdString == null || jobIdString.trim().isEmpty()) {
            response.getWriter().println("Job ID is missing.");
            return;
        }

        int jobId;

        try {
            jobId = Integer.parseInt(jobIdString);
        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid Job ID.");
            return;
        }

        ApplicationDAO dao = new ApplicationDAO();

        // Check duplicate application
        if (dao.alreadyApplied(userId, jobId)) {

            response.sendRedirect(
                    "job-details.jsp?jobId=" + jobId
                    + "&msg=already"
            );

            return;
        }

        // Apply for job
        boolean result =
                dao.applyJob(userId, jobId);

        if (result) {

            response.sendRedirect(
                    "my-applications.jsp"
            );

        } else {

            response.sendRedirect(
                    "job-details.jsp?jobId=" + jobId
                    + "&msg=failed"
            );
        }
    }
}