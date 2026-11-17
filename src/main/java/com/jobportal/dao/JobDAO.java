package com.jobportal.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.jobportal.beans.Job;
import com.jobportal.util.DBConnection;

public class JobDAO {

    // Common SQL Query
    private String baseQuery() {

        return "SELECT " +
               "j.job_id, " +
               "j.job_title AS title, " +
               "j.company_id, " +
               "j.job_type, " +
               "j.salary, " +
               "j.description, " +
               "j.responsibilities, " +
               "j.skills, " +
               "c.company_name, " +
               "c.company_logo, " +
               "l.city, " +
               "l.state, " +
               "cat.category_name AS category " +

               "FROM jobs j " +

               "JOIN companies c " +
               "ON j.company_id = c.company_id " +

               "LEFT JOIN locations l " +
               "ON j.location_id = l.location_id " +

               "LEFT JOIN categories cat " +
               "ON j.category_id = cat.category_id ";

    }


    // Convert ResultSet into Job object
    private Job map(ResultSet rs) throws SQLException {

        Job j = new Job();

        j.setJobId(rs.getInt("job_id"));

        j.setCompanyId(rs.getInt("company_id"));

        // Company Name
        String compName = rs.getString("company_name");

        j.setCompanyName(compName);

        // Company Logo Image from Database
        j.setLogoImage(rs.getString("company_logo"));


        // Generate Logo Text from Company Name
        if (compName != null && !compName.trim().isEmpty()) {

            j.setLogoText(
                compName.trim()
                        .substring(0, Math.min(compName.trim().length(), 3))
                        .toUpperCase()
            );

        } else {

            j.setLogoText("JOB");

        }


        // Job Title
        j.setTitle(rs.getString("title"));

        // Location
        j.setLocation(rs.getString("city"));

        // State
        j.setRegion(rs.getString("state"));

        // Job Information
        j.setJobType(rs.getString("job_type"));

        j.setSalary(rs.getString("salary"));

        j.setCategory(rs.getString("category"));

        // Job Description
        j.setDescription(rs.getString("description"));

        j.setResponsibilities(rs.getString("responsibilities"));

        j.setSkills(rs.getString("skills"));

        // These fields are not available in current database
        j.setExperience(null);
        j.setWorkMode(null);
        j.setEducation(null);
        j.setPostedOn(null);
        j.setLastDate(null);

        return j;
    }


    // Display All Jobs
    public List<Job> getAllJobs() throws SQLException {

        List<Job> list = new ArrayList<Job>();

        String sql = baseQuery() + " ORDER BY j.job_id DESC";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {

                list.add(map(rs));

            }

        }

        return list;
    }


    // Search Jobs by Keyword, City and Job Type
    public List<Job> searchJobs(
            String keyword,
            String region,
            String jobType) throws SQLException {

        List<Job> list = new ArrayList<Job>();

        StringBuilder sql = new StringBuilder(baseQuery());

        sql.append(" WHERE 1=1 ");


        // Search by Company Name, Job Title or Category
        if (keyword != null && !keyword.trim().isEmpty()) {

            sql.append(
                " AND (c.company_name LIKE ? " +
                "OR j.job_title LIKE ? " +
                "OR cat.category_name LIKE ? " +
                "OR j.skills LIKE ?) "
            );

        }


        // Filter by City
        if (region != null && !region.trim().isEmpty()) {

            sql.append(" AND l.city = ? ");

        }


        // Filter by Job Type
        if (jobType != null && !jobType.trim().isEmpty()) {

            sql.append(" AND j.job_type = ? ");

        }


        sql.append(" ORDER BY j.job_id DESC ");


        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql.toString())
        ) {

            int i = 1;

            // Set Keyword Parameters
            if (keyword != null && !keyword.trim().isEmpty()) {

                String k = "%" + keyword.trim() + "%";

                ps.setString(i++, k);
                ps.setString(i++, k);
                ps.setString(i++, k);
                ps.setString(i++, k);

            }


            // Set City Parameter
            if (region != null && !region.trim().isEmpty()) {

                ps.setString(i++, region.trim());

            }


            // Set Job Type Parameter
            if (jobType != null && !jobType.trim().isEmpty()) {

                ps.setString(i++, jobType.trim());

            }


            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    list.add(map(rs));

                }

            }

        }

        return list;
    }


    // Display Selected Job Details by Job ID
    public Job getJobById(int id) throws SQLException {

        String sql = baseQuery() + " WHERE j.job_id = ? ";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    return map(rs);

                }

            }

        }

        return null;
    }

}