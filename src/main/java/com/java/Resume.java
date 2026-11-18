package com.java;

public class Resume {

    private int resumeId;
    private int userId;
    private String resumeFileName;
    private String resumePath;

    public Resume() {
    }

    public Resume(int resumeId, int userId, String resumeFileName,
                  String resumePath) {
        this.resumeId = resumeId;
        this.userId = userId;
        this.resumeFileName = resumeFileName;
        this.resumePath = resumePath;
    }

    public int getResumeId() {
        return resumeId;
    }

    public void setResumeId(int resumeId) {
        this.resumeId = resumeId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getResumeFileName() {
        return resumeFileName;
    }

    public void setResumeFileName(String resumeFileName) {
        this.resumeFileName = resumeFileName;
    }

    public String getResumePath() {
        return resumePath;
    }

    public void setResumePath(String resumePath) {
        this.resumePath = resumePath;
    }
}