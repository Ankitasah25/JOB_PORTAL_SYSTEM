package com.jobportal.dao;

import com.jobportal.admin.util.DBConnection;
import com.jobportal.bean.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {
	public java.util.Map<String, Integer> getReportStatistics() {

	    java.util.Map<String, Integer> stats =
	            new java.util.HashMap<>();

	    String sql =
	        "SELECT " +
	        "(SELECT COUNT(*) FROM users) AS totalUsers, " +
	        "(SELECT COUNT(*) FROM users WHERE role='RECRUITER') AS recruiters, " +
	        "(SELECT COUNT(*) FROM users WHERE role='JOB_SEEKER') AS jobSeekers, " +
	        "(SELECT COUNT(*) FROM jobs) AS totalJobs, " +
	        "(SELECT COUNT(*) FROM jobs WHERE status='ACTIVE') AS activeJobs, " +
	        "(SELECT COUNT(*) FROM job_applications) AS totalApplications, " +
	        "(SELECT COUNT(*) FROM job_applications WHERE status='SHORTLISTED') AS shortlistedApplications";

	    try (java.sql.Connection conn =
	                 com.jobportal.admin.util.DBConnection.getConnection();
	         java.sql.PreparedStatement stmt = conn.prepareStatement(sql);
	         java.sql.ResultSet rs = stmt.executeQuery()) {

	        if (rs.next()) {
	            stats.put("totalUsers", rs.getInt("totalUsers"));
	            stats.put("recruiters", rs.getInt("recruiters"));
	            stats.put("jobSeekers", rs.getInt("jobSeekers"));
	            stats.put("totalJobs", rs.getInt("totalJobs"));
	            stats.put("activeJobs", rs.getInt("activeJobs"));
	            stats.put("totalApplications", rs.getInt("totalApplications"));
	            stats.put("shortlistedApplications",
	                      rs.getInt("shortlistedApplications"));
	        }

	    } catch (java.sql.SQLException e) {
	        e.printStackTrace();
	        throw new IllegalStateException(
	                "Unable to load report statistics", e);
	    }

	    return stats;
	}
	
	/**
     * Retrieves all jobs joined with company names for the admin manage-jobs page.
     */
    public java.util.List<com.jobportal.bean.Job> getAllJobsForAdmin() {
        java.util.List<com.jobportal.bean.Job> jobList = new java.util.ArrayList<>();
        String sql = "SELECT j.job_id, j.title, j.location, j.job_type, j.status, j.posted_date, COALESCE(c.company_name, 'Direct Hire') AS company_name " +
                     "FROM jobs j LEFT JOIN companies c ON j.company_id = c.company_id ORDER BY j.posted_date DESC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                com.jobportal.bean.Job job = new com.jobportal.bean.Job();
                job.setJobId(rs.getInt("job_id"));
                job.setTitle(rs.getString("title"));
                job.setLocation(rs.getString("location"));
                job.setJobType(rs.getString("job_type"));
                job.setStatus(rs.getString("status"));
                job.setCreatedAt(rs.getTimestamp("posted_date"));
                job.setCompanyName(rs.getString("company_name"));
                jobList.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jobList;
    }

    /**
     * Updates a job status (ACTIVE, CLOSED, DRAFT, EXPIRED).
     */
    public boolean updateJobStatus(int jobId, String status) {
        if (!"ACTIVE".equals(status) && !"CLOSED".equals(status)
                && !"DRAFT".equals(status) && !"EXPIRED".equals(status)) {
            return false;
        }
        String sql = "UPDATE jobs SET status = ? WHERE job_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setInt(2, jobId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Deletes a job by ID.
     */
    public boolean deleteJob(int jobId) {
        String sql = "DELETE FROM jobs WHERE job_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, jobId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Retrieves the total count of registered users from the users table.
     */
    public int getTotalUsers() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM users";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
    /**
     * Retrieves the total count of active job postings.
     */
    public int getActiveJobsCount() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM jobs WHERE status = 'ACTIVE'";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    /**
     * Retrieves the count of draft jobs (legacy method name retained).
     */
    public int getPendingJobsCount() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM jobs WHERE status = 'DRAFT'";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    /**
     * Retrieves the total count of recruiters from the users table.
     */
    public int getRecruitersCount() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM users WHERE role = 'RECRUITER'";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    /**
     * Retrieves all users from the users table for the manage-users page.
     */
    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();
        String sql = "SELECT user_id, full_name, email, phone, role, status, created_at FROM users ORDER BY created_at DESC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setRole(rs.getString("role"));
                user.setStatus(rs.getString("status"));
                user.setCreatedAt(rs.getTimestamp("created_at"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    /**
     * Updates a user's status (ACTIVE, INACTIVE, BLOCKED).
     */
    public boolean updateUserStatus(int userId, String status) {
        String sql = "UPDATE users SET status = ? WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setInt(2, userId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Deletes a user by ID.
     */
    public boolean deleteUser(int userId) {
        String sql = "DELETE FROM users WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean logAdminAction(int adminId, String action) {

        String sql = "INSERT INTO system_logs "
                   + "(admin_id, action_performed, log_time) "
                   + "VALUES (?, ?, NOW())";

        try (java.sql.Connection conn =
                 com.jobportal.admin.util.DBConnection.getConnection();
             java.sql.PreparedStatement ps =
                 conn.prepareStatement(sql)) {

            ps.setInt(1, adminId);
            ps.setString(2, action);

            return ps.executeUpdate() > 0;

        } catch (java.sql.SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}