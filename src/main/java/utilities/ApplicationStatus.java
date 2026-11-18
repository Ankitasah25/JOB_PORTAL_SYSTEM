package utilities;


public class ApplicationStatus {

    private int statusId;
    private String statusName;

    // Default constructor
    public ApplicationStatus() {
    }

    // Parameterized constructor
    public ApplicationStatus(int statusId, String statusName) {
        this.statusId = statusId;
        this.statusName = statusName;
    }

    // Getter for statusId
    public int getStatusId() {
        return statusId;
    }

    // Setter for statusId
    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    // Getter for statusName
    public String getStatusName() {
        return statusName;
    }

    // Setter for statusName
    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }
}