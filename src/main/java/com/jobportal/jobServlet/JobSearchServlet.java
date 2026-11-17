package com.jobportal.jobServlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jobportal.dao.JobDAO;

@WebServlet("/search-jobs")
public class JobSearchServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        String keyword = request.getParameter("keyword");
        String region = request.getParameter("region");
        String jobType = request.getParameter("type");

        try {

            JobDAO dao = new JobDAO();

            request.setAttribute(
                "jobs",
                dao.searchJobs(keyword, region, jobType)
            );

            request.setAttribute("keyword", keyword);
            request.setAttribute("selectedRegion", region);
            request.setAttribute("selectedType", jobType);

            request.getRequestDispatcher("/search-jobs.jsp")
                   .forward(request, response);

        } catch (SQLException e) {

            throw new ServletException("Unable to search jobs", e);
        }
    }
}