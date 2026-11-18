package com.java;

public class Education {

    private int educationId;
    private int userId;
    private String degree;
    private String institution;
    private String fieldOfStudy;
    private int passingYear;

    public Education() {
    }

    public Education(int educationId, int userId, String degree,
                     String institution, String fieldOfStudy,
                     int passingYear) {
        this.educationId = educationId;
        this.userId = userId;
        this.degree = degree;
        this.institution = institution;
        this.fieldOfStudy = fieldOfStudy;
        this.passingYear = passingYear;
    }

    public int getEducationId() {
        return educationId;
    }

    public void setEducationId(int educationId) {
        this.educationId = educationId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getInstitution() {
        return institution;
    }

    public void setInstitution(String institution) {
        this.institution = institution;
    }

    public String getFieldOfStudy() {
        return fieldOfStudy;
    }

    public void setFieldOfStudy(String fieldOfStudy) {
        this.fieldOfStudy = fieldOfStudy;
    }

    public int getPassingYear() {
        return passingYear;
    }

    public void setPassingYear(int passingYear) {
        this.passingYear = passingYear;
    }
}