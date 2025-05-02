package model;
import java.util.Date;
public class Scholarship {
    private int scholarshipId;
    private String title, description, eligibilityCriteria;
    private double amount;
    private Date applicationDeadline;
    private int createdBy;

    public int getScholarshipId() {
        return scholarshipId;
    }
    public void setScholarshipId(int scholarshipId) {
        this.scholarshipId = scholarshipId;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getEligibilityCriteria() {
        return eligibilityCriteria;
    }
    public void setEligibilityCriteria(String eligibilityCriteria) {
        this.eligibilityCriteria = eligibilityCriteria;
    }
    public double getAmount() {
        return amount;
    }
    public void setAmount(double amount) {
        this.amount = amount;
    }
    public Date getApplicationDeadline() {
        return applicationDeadline;
    }
    public void setApplicationDeadline(Date date) {
        this.applicationDeadline = date;
    }
    public int getCreatedBy() {
        return createdBy;
    }
    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }
}