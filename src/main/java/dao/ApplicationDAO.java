package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;




import utilities.Application;
import util.DBConnection;

public class ApplicationDAO {

    // Apply for a job
    public boolean applyJob(int userId, int jobId) {

        boolean result = false;

        String sql = "INSERT INTO applications(user_id, job_id, status) "
                   + "VALUES (?, ?, 'Applied')";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setInt(2, jobId);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                result = true;
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }


    // Check whether user already applied
    public boolean alreadyApplied(int userId, int jobId) {

        boolean result = false;

        String sql = "SELECT * FROM applications "
                   + "WHERE user_id=? AND job_id=?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setInt(2, jobId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                result = true;
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }


    // Get all applications of a user
    public List<Application> getMyApplications(int userId) {

        List<Application> list = new ArrayList<>();

        String sql = "SELECT * FROM applications WHERE user_id=?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Application app = new Application();

                app.setApplicationId(
                        rs.getInt("application_id")
                );

                app.setUserId(
                        rs.getInt("user_id")
                );

                app.setJobId(
                        rs.getInt("job_id")
                );

                app.setApplyDate(
                        rs.getString("apply_date")
                );

                app.setStatus(
                        rs.getString("status")
                );

                list.add(app);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }


    // Get status of one application
    public Application getApplicationStatus(int applicationId) {

        Application app = null;

        String sql = "SELECT * FROM applications "
                   + "WHERE application_id=?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, applicationId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                app = new Application();

                app.setApplicationId(
                        rs.getInt("application_id")
                );

                app.setUserId(
                        rs.getInt("user_id")
                );

                app.setJobId(
                        rs.getInt("job_id")
                );

                app.setApplyDate(
                        rs.getString("apply_date")
                );

                app.setStatus(
                        rs.getString("status")
                );
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return app;
    }


    // Cancel application
    public boolean cancelApplication(int applicationId) {

        boolean result = false;

        String sql = "UPDATE applications "
                   + "SET status='Cancelled' "
                   + "WHERE application_id=?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, applicationId);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                result = true;
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}