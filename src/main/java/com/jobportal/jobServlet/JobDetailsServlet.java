package com.jobportal.jobServlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jobportal.dao.JobDAO;
import com.jobportal.beans.Job;

@WebServlet("/job-details")
public class JobDetailsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String jobId = request.getParameter("id");

        try {

            if (jobId == null || jobId.trim().isEmpty()) {
                response.sendError(400, "Job ID is required");
                return;
            }

            int id = Integer.parseInt(jobId);

            JobDAO dao = new JobDAO();

            Job job = dao.getJobById(id);

            if (job == null) {
                response.sendError(404, "Job not found");
                return;
            }

            request.setAttribute("job", job);

            request.getRequestDispatcher("/job-details.jsp")
                   .forward(request, response);

        } catch (NumberFormatException e) {

            response.sendError(400, "Invalid Job ID");

        } catch (SQLException e) {

            e.printStackTrace();

            throw new ServletException(
                "Unable to load job details", e
            );
        }
    }
}