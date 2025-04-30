package dao;

import java.sql.*;
import java.util.*;
import model.ContactMessage;

public class ContactDAO {
    public List<ContactMessage> getAllMessages() throws SQLException {
        String sql = "SELECT * FROM contact_message ORDER BY submitted_at DESC";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            List<ContactMessage> messages = new ArrayList<>();
            while (rs.next()) {
                ContactMessage m = new ContactMessage();
                m.setMessageId(rs.getInt("message_id"));
                m.setName(rs.getString("name"));
                m.setEmail(rs.getString("email"));
                m.setSubject(rs.getString("subject"));
                m.setMessage(rs.getString("message"));
                m.setSubmittedAt(rs.getTimestamp("submitted_at"));
                messages.add(m);
            }
            return messages;
        }
    }
}