package dao;
import java.sql.*;
import java.util.*;
import model.Scholarship;
public class ScholarshipDAO {
    public List<Scholarship> listAll() throws SQLException {
        String sql = "SELECT * FROM scholarship";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement p = c.prepareStatement(sql);
             ResultSet r = p.executeQuery()) {
            List<Scholarship> L = new ArrayList<>();
            while (r.next()) {
                Scholarship s = new Scholarship();
                s.setScholarshipId(r.getInt("scholarship_id"));
                s.setTitle(r.getString("title"));
                s.setDescription(r.getString("description"));
                s.setEligibilityCriteria(r.getString("eligibility_criteria"));
                s.setAmount(r.getDouble("amount"));
                s.setApplicationDeadline(r.getDate("application_deadline"));
                s.setCreatedBy(r.getInt("created_by"));
                L.add(s);
            }
            return L;
        }
    }
    public Scholarship findById(int id) throws SQLException {
        String sql = "SELECT * FROM scholarship WHERE scholarship_id=?";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement p = c.prepareStatement(sql)) {
            p.setInt(1, id);
            try (ResultSet r = p.executeQuery()) {
                if (r.next()) {
                    Scholarship s = new Scholarship();
                    s.setScholarshipId(id);
                    s.setTitle(r.getString("title"));
                    s.setDescription(r.getString("description"));
                    s.setEligibilityCriteria(r.getString("eligibility_criteria"));
                    s.setAmount(r.getDouble("amount"));
                    s.setApplicationDeadline(r.getDate("application_deadline"));
                    s.setCreatedBy(r.getInt("created_by"));
                    return s;
                }
            }
        }
        return null;
    }
    public void create(Scholarship s) throws SQLException {
        String sql = "INSERT INTO scholarship (title, description, eligibility_criteria, amount, application_deadline, created_by) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement p = c.prepareStatement(sql)) {
            p.setString(1, s.getTitle());
            p.setString(2, s.getDescription());
            p.setString(3, s.getEligibilityCriteria());
            p.setDouble(4, s.getAmount());
            p.setDate(5, new java.sql.Date(s.getApplicationDeadline().getTime()));
            p.setInt(6, s.getCreatedBy());
            p.executeUpdate();
        }
    }
    public void update(Scholarship s) throws SQLException {
        String sql = "UPDATE scholarship SET title=?, description=?, eligibility_criteria=?, amount=?, application_deadline=? WHERE scholarship_id=?";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement p = c.prepareStatement(sql)) {
            p.setString(1, s.getTitle());
            p.setString(2, s.getDescription());
            p.setString(3, s.getEligibilityCriteria());
            p.setDouble(4, s.getAmount());
            p.setDate(5, new java.sql.Date(s.getApplicationDeadline().getTime()));
            p.setInt(6, s.getScholarshipId());
            p.executeUpdate();
        }
    }
    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM scholarship WHERE scholarship_id=?";
        try (Connection c = DBUtil.getConnection();
             PreparedStatement p = c.prepareStatement(sql)) {
            p.setInt(1, id);
            p.executeUpdate();
        }
    }
}