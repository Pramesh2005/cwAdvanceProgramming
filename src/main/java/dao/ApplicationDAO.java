package dao;

import java.sql.*;
import java.util.*;
import model.Application;
import java.io.InputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.File;

public class ApplicationDAO {
    private String uploadPath = "C:" + File.separator + "Uploads" + File.separator;

    public ApplicationDAO() {
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
    }

    public List<Application> listByEmail(String email) throws SQLException {
        String sql = "SELECT a.id, a.fullname, a.email, a.document_path, a.submitted_at, a.scholarship_id, s.title " +
                     "FROM applications a " +
                     "LEFT JOIN scholarship s ON a.scholarship_id = s.scholarship_id " +
                     "WHERE a.email = ?";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement p = c.prepareStatement(sql)) {
            p.setString(1, email);
            ResultSet r = p.executeQuery();
            List<Application> applications = new ArrayList<>();
            while (r.next()) {
                Application a = new Application();
                a.setId(r.getInt("id"));
                a.setFullname(r.getString("fullname"));
                a.setEmail(r.getString("email"));
                a.setDocumentPath(r.getString("document_path"));
                a.setSubmittedAt(r.getTimestamp("submitted_at"));
                a.setScholarshipId(r.getInt("scholarship_id"));
                a.setScholarshipTitle(r.getString("title") != null ? r.getString("title") : "Unknown Scholarship");
                applications.add(a);
            }
            return applications;
        }
    }

    public void apply(Application a, InputStream fileInputStream, String fileName) throws SQLException, IOException {
        String documentPath = saveFile(fileInputStream, fileName);
        String sql = "INSERT INTO applications (fullname, email, document_path, scholarship_id) VALUES (?, ?, ?, ?)";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement p = c.prepareStatement(sql)) {
            p.setString(1, a.getFullname());
            p.setString(2, a.getEmail());
            p.setString(3, documentPath);
            p.setInt(4, a.getScholarshipId());
            p.executeUpdate();
        }
    }

    public void update(Application a, InputStream fileInputStream, String fileName) throws SQLException, IOException {
        String documentPath = a.getDocumentPath();
        if (fileInputStream != null && fileName != null && !fileName.isEmpty()) {
            // Delete old file if it exists
            if (documentPath != null) {
                new File(documentPath).delete();
            }
            documentPath = saveFile(fileInputStream, fileName);
        }
        String sql = "UPDATE applications SET fullname = ?, email = ?, document_path = ? WHERE id = ?";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement p = c.prepareStatement(sql)) {
            p.setString(1, a.getFullname());
            p.setString(2, a.getEmail());
            p.setString(3, documentPath);
            p.setInt(4, a.getId());
            p.executeUpdate();
        }
    }

    public void delete(int id) throws SQLException {
        // Get document path to delete the file
        String sqlSelect = "SELECT document_path FROM applications WHERE id = ?";
        String documentPath = null;
        try (Connection c = DBUtil.getConnection();
             PreparedStatement p = c.prepareStatement(sqlSelect)) {
            p.setInt(1, id);
            ResultSet r = p.executeQuery();
            if (r.next()) {
                documentPath = r.getString("document_path");
            }
        }
        // Delete the application record
        String sqlDelete = "DELETE FROM applications WHERE id = ?";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement p = c.prepareStatement(sqlDelete)) {
            p.setInt(1, id);
            p.executeUpdate();
        }
        // Delete the file if it exists
        if (documentPath != null) {
            new File(documentPath).delete();
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