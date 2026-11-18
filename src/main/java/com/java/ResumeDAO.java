package com.java;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ResumeDAO {

    private static final String URL =
            "jdbc:mysql://localhost:3306/onlinejobportal";

    private static final String USER = "root";
    private static final String PASSWORD = "Surya@_1116";

    private Connection getConnection() throws Exception {

        Class.forName("com.mysql.cj.jdbc.Driver");

        return java.sql.DriverManager.getConnection(
                URL, USER, PASSWORD);
    }

    public boolean saveResume(Resume resume) {

        String sql = "INSERT INTO resumes "
                   + "(user_id, resume_file_name, resume_path) "
                   + "VALUES (?, ?, ?)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, resume.getUserId());
            ps.setString(2, resume.getResumeFileName());
            ps.setString(3, resume.getResumePath());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }
}