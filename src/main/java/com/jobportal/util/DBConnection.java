package com.jobportal.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/jobportal";

    private static final String USER = "root";

    public static Connection getConnection() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String password = System.getenv("DB_PASSWORD");

            if (password == null || password.isEmpty()) {
                throw new IllegalStateException(
                    "DB_PASSWORD environment variable is not set."
                );
            }

            return DriverManager.getConnection(
                    URL, USER, password
            );

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(
                "Database connection failed", e
            );
        }
    }
}