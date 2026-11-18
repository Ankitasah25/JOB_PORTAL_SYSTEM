package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ApplicationDAO;
import utilities.Application;

@WebServlet("/MyApplicationsServlet")
public class MyApplicationsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Integer userId =
                (Integer) session.getAttribute("userId");

        if (userId == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        ApplicationDAO dao =
                new ApplicationDAO();

        List<Application> applications =
                dao.getMyApplications(userId);

        request.setAttribute(
                "applications",
                applications
        );

        request.getRequestDispatcher(
                "my-applications.jsp"
        ).forward(request, response);
    }
}