package JDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnect {
	public Connection con;
	public PreparedStatement pstmt;
	public Statement stmt;
	public ResultSet rs;

	public JDBConnect() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "shopping", "1234");
			
			System.out.println("DB 연결중");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void JDBClose() {
		try {
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
			if(stmt != null) stmt.close();
			if(rs != null) rs.close();
			
			System.out.println("DB 자원해제");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
