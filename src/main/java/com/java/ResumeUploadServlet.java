package com.java;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/ResumeUploadServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,
    maxFileSize = 5 * 1024 * 1024,
    maxRequestSize = 10 * 1024 * 1024
)
public class ResumeUploadServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Check whether user is logged in
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        // Get uploaded resume
        Part filePart = request.getPart("resume");

        if (filePart == null || filePart.getSize() == 0) {
            response.sendRedirect("profile.jsp?error=NoFileSelected");
            return;
        }

        // Get file name
        String fileName = new File(
                filePart.getSubmittedFileName()
        ).getName();

        // Upload directory
        String uploadPath = getServletContext()
                .getRealPath("")
                + File.separator + "uploads";

        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // File path
        String filePath = uploadPath
                + File.separator + fileName;

        // Save file
        filePart.write(filePath);

        // Create Resume object
        Resume resume = new Resume();

        resume.setUserId(user.getUserId());
        resume.setResumeFileName(fileName);
        resume.setResumePath(filePath);

        // Save resume information in database
        ResumeDAO resumeDAO = new ResumeDAO();

        boolean success = resumeDAO.saveResume(resume);

        if (success) {

            response.sendRedirect(
                    "profile.jsp?message=ResumeUploaded"
            );

        } else {

            response.sendRedirect(
                    "profile.jsp?error=ResumeUploadFailed"
            );
        }
    }
}