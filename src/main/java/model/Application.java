// src/model/Application.java
package model;
import java.util.Date;
public class Application {
    private int applicationId, userId, scholarshipId;
    private Date appliedAt;
    private String status, remarks;
    // getters/setters...
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
	public int getScholarshipId() {
		return scholarshipId;
	}
	public void setScholarshipId(int scholarshipId) {
		this.scholarshipId = scholarshipId;
	}
	public Date getAppliedAt() {
		return appliedAt;
	}
	public void setAppliedAt(Date appliedAt) {
		this.appliedAt = appliedAt;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
    
    
}
