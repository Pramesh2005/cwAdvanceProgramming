// src/dao/UserDAO.java
package dao;

import java.sql.*;
import model.User;
import org.mindrot.jbcrypt.BCrypt;

public class UserDAO {

  public User findByEmailPwd(String email, String pwd) throws SQLException {
    String sql = "SELECT * FROM users WHERE email=?";
    try (Connection c = DBUtil.getConnection();
         PreparedStatement p = c.prepareStatement(sql)) {
      p.setString(1, email);
      ResultSet r = p.executeQuery();
      if (r.next()) {
        String hashedPwd = r.getString("password");
        if (BCrypt.checkpw(pwd, hashedPwd)) {
          User u = new User();
          u.setUserId(r.getInt("user_id"));
          u.setFirstName(r.getString("first_name"));
          u.setLastName(r.getString("last_name"));
          u.setEmail(r.getString("email"));
          u.setRole(r.getString("role"));
          return u;
        }
      }
    }
    return null;
  }

  public void register(User u) throws SQLException {
    String sql = "INSERT INTO users(first_name,last_name,email,password,role) VALUES(?,?,?,?,?)";
    try (Connection c = DBUtil.getConnection();
         PreparedStatement p = c.prepareStatement(sql)) {
      String hashedPwd = BCrypt.hashpw(u.getPassword(), BCrypt.gensalt());
      p.setString(1, u.getFirstName());
      p.setString(2, u.getLastName());
      p.setString(3, u.getEmail());
      p.setString(4, hashedPwd);
      p.setString(5, u.getRole());
      p.executeUpdate();
    }
  }
}
