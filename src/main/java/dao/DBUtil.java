// src/dao/DBUtil.java
package dao;
import java.sql.*;

public class DBUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/scholarship_db?useSSL=false";
    private static final String USER = "root";
    private static final String PASS = "";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
