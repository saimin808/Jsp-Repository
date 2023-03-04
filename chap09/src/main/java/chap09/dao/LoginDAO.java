package chap09.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import chap09.dto.Account;
import chap09.dao.DBConnection;

public class LoginDAO {

	public static Account login(String id, String pw) { 
		
		String query = "SELECT * FROM accounts WHERE id=? and password=?";
		
		Account account = null;
		String user_id; 
		String user_pw;
		String user_name;
		
		try (Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(query);) {
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				user_id = rs.getString("id");
				user_pw = rs.getString("password");
				user_name = rs.getString("user_name");
				account = new Account(user_id, user_pw, user_name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("로그인 실패 (DAO)");
		}
		return account; 
	}
	
}
