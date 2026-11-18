package utilities;

public class Application {

    private int applicationId;
    private int userId;
    private int jobId;
    private String applyDate;
    private String status;

    public Application() {
    }

    public Application(int applicationId, int userId, int jobId,
                       String applyDate, String status) {
        this.applicationId = applicationId;
        this.userId = userId;
        this.jobId = jobId;
        this.applyDate = applyDate;
        this.status = status;
    }

    public int getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(int applicationId) {
        this.applicationId = applicationId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getApplyDate() {
        return applyDate;
    }

    public void setApplyDate(String applyDate) {
        this.applyDate = applyDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}