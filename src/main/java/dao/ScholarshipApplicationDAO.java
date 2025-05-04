package dao;

import model.ScholarshipApplication;
import java.sql.*;
import java.io.InputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.File;

public class ScholarshipApplicationDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/scholarship_db?useSSL=false";
    private String jdbcUsername = "root"; // Default XAMPP MySQL username
    private String jdbcPassword = ""; // No password for default XAMPP setup
    private String uploadPath = "C:" + File.separator + "uploads" + File.separator; // Adjust to a valid path on your system

    private static final String INSERT_APPLICATION_SQL = "INSERT INTO applications (fullname, email, scholarship_type, document_path) VALUES (?, ?, ?, ?)";

    public ScholarshipApplicationDAO() {
        // Ensure the upload directory exists
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // Create the directory if it doesn't exist
        }
    }

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL Driver not found", e);
        }
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public void insertApplication(ScholarshipApplication application, InputStream fileInputStream, String fileName) throws SQLException, IOException {
        String documentPath = saveFile(fileInputStream, fileName);
        if (documentPath != null) {
            try (Connection connection = getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(INSERT_APPLICATION_SQL)) {
                preparedStatement.setString(1, application.getFullname());
                preparedStatement.setString(2, application.getEmail());
                preparedStatement.setString(3, application.getScholarshipType());
                preparedStatement.setString(4, documentPath);
                preparedStatement.executeUpdate();
            }
        }
    }

    private String saveFile(InputStream fileInputStream, String fileName) throws IOException {
        if (fileInputStream == null || fileName == null || fileName.isEmpty()) {
            return null;
        }
        String filePath = uploadPath + fileName;
        try (FileOutputStream fos = new FileOutputStream(filePath)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fileInputStream.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }
        }
        return filePath;
    }
}