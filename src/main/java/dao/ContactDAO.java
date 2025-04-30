// src/dao/ContactDAO.java
package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.ContactMessage;
public class ContactDAO {
  public void save(ContactMessage m) throws SQLException {
    String sql="INSERT INTO contact_message(name,email,subject,message) VALUES(?,?,?,?)";
    try(Connection c=DBUtil.getConnection();
        PreparedStatement p=c.prepareStatement(sql)){
      p.setString(1,m.getName());
      p.setString(2,m.getEmail());
      p.setString(3,m.getSubject());
      p.setString(4,m.getMessage());
      p.executeUpdate();
    }
  }
  public List<ContactMessage> findAll() throws SQLException {
      List<ContactMessage> messages = new ArrayList<>();
      String sql = "SELECT * FROM contact_message";
      try (Connection conn = DBUtil.getConnection(); 
           PreparedStatement stmt = conn.prepareStatement(sql); 
           ResultSet rs = stmt.executeQuery()) {
          while (rs.next()) {
              ContactMessage message = new ContactMessage();
              message.setMessageId(rs.getInt("message_id")); // Assuming an ID field
              message.setName(rs.getString("name"));
              message.setEmail(rs.getString("email"));
              message.setSubject(rs.getString("subject"));
              message.setMessage(rs.getString("message"));
              messages.add(message);
          }
      }
      return messages;
  }
  
}
