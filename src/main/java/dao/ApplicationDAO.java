// src/dao/ApplicationDAO.java
package dao;
import java.sql.*;
import java.util.*;
import model.Application;
public class ApplicationDAO {
  public List<Application> listByUser(int uid) throws SQLException {
    String sql="SELECT * FROM application WHERE user_id=?";
    try(Connection c=DBUtil.getConnection();
        PreparedStatement p=c.prepareStatement(sql)){
      p.setInt(1,uid);
      ResultSet r=p.executeQuery();
      List<Application> L=new ArrayList<>();
      while(r.next()){
        Application a=new Application();
        a.setApplicationId(r.getInt("application_id"));
        a.setUserId(uid);
        a.setScholarshipId(r.getInt("scholarship_id"));
        a.setAppliedAt(r.getTimestamp("applied_at"));
        a.setStatus(r.getString("status"));
        a.setRemarks(r.getString("remarks"));
        L.add(a);
      }
      return L;
    }
  }
  public void apply(Application a) throws SQLException {
    String sql="INSERT INTO application(user_id,scholarship_id,remarks) VALUES(?,?,?)";
    try(Connection c=DBUtil.getConnection();
        PreparedStatement p=c.prepareStatement(sql)){
      p.setInt(1,a.getUserId());
      p.setInt(2,a.getScholarshipId());
      p.setString(3,a.getRemarks());
      p.executeUpdate();
    }
  }
  public void updateStatus(int appId, String status) throws SQLException {
    String sql="UPDATE application SET status=? WHERE application_id=?";
    try(Connection c=DBUtil.getConnection();
        PreparedStatement p=c.prepareStatement(sql)){
      p.setString(1,status);
      p.setInt(2,appId);
      p.executeUpdate();
    }
  }
  public void delete(int appId) throws SQLException {
    String sql="DELETE FROM application WHERE application_id=?";
    try(Connection c=DBUtil.getConnection();
        PreparedStatement p=c.prepareStatement(sql)){
      p.setInt(1,appId);
      p.executeUpdate();
    }
  }
}
