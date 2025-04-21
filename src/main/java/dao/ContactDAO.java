// src/dao/ContactDAO.java
package dao;
import java.sql.*;
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
}
