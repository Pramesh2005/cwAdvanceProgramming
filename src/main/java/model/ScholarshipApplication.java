package model;

public class ScholarshipApplication {
    private int id;
    private String fullname;
    private String email;
    private String scholarshipType;
    private String documentPath;
    private String submittedAt;

    // Default constructor
    public ScholarshipApplication() {}

    // Parameterized constructor
    public ScholarshipApplication(int id, String fullname, String email, String scholarshipType, String documentPath, String submittedAt) {
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.scholarshipType = scholarshipType;
        this.documentPath = documentPath;
        this.submittedAt = submittedAt;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getScholarshipType() {
        return scholarshipType;
    }

    public void setScholarshipType(String scholarshipType) {
        this.scholarshipType = scholarshipType;
    }

    public String getDocumentPath() {
        return documentPath;
    }

    public void setDocumentPath(String documentPath) {
        this.documentPath = documentPath;
    }

    public String getSubmittedAt() {
        return submittedAt;
    }

    public void setSubmittedAt(String submittedAt) {
        this.submittedAt = submittedAt;
    }
}