
package com.jobportal.jobServlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jobportal.dao.JobDAO;

@WebServlet("/jobs")
public class JobServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        try {

            JobDAO dao = new JobDAO();

            request.setAttribute("jobs", dao.getAllJobs());

            request.getRequestDispatcher("/jobs.jsp")
                   .forward(request, response);

        }
        catch(SQLException e) {

            throw new ServletException("Unable to load jobs", e);
        }
    }
}
