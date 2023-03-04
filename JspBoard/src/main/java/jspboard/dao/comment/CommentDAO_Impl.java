package jspboard.dao.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jspboard.dao.DBConnection;
import jspboard.dto.comment.Comment;

public class CommentDAO_Impl implements CommentDAO {

	@Override
	public List<Comment> selectComments(String board_id) {
		
		String query = "SELECT * FROM comments WHERE board_id=? ORDER BY comment_id ASC";
		List<Comment> comments = new ArrayList<>();
		Comment comment = null;
		try(Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(query);) {
			
			pstmt.setString(1, board_id);
			
			ResultSet rs = pstmt.executeQuery();
						
			while(rs.next()) {
				comment = new Comment();
				comment.setComment_id(rs.getString("comment_id"));
				comment.setComment_writer(rs.getString("comment_writer"));
				comment.setComment_content(rs.getString("comment_content"));
				comment.setComment_write_date(rs.getString("comment_write_date"));
				comments.add(comment);
			}
						
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return comments;
	}
	
	@Override
	public Integer insertComment(Comment comment) {
		
		String query = "INSERT INTO comments VALUES(comment_id_seq.nextval,?,?,?,?,?)";
		int success = 0;
		
		try(Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(query);) {
			
			pstmt.setString(1, comment.getBoard_id());
			pstmt.setString(2, comment.getComment_writer());
			pstmt.setString(3, comment.getComment_pw());
			pstmt.setString(4, comment.getComment_content());
			pstmt.setString(5, comment.getComment_write_date());
			
			success = pstmt.executeUpdate();
			
			if(success > 0) {
				System.out.println("댓글 입력 성공 (DAO)");
			} else {
				System.out.println("댓글 입력 실패 (DAO)");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return success;
	}
	
	@Override
	public Comment getComment(String comment_id) {
		
		String query = "SELECT * FROM comments WHERE comment_id=?";
		Comment comment = null;
		
		try(Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(query);) {
			
			pstmt.setString(1, comment_id);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				comment = new Comment(rs.getString("comment_id"), rs.getString("board_id"),
						rs.getString("comment_writer"), rs.getString("comment_pw"),
						rs.getString("comment_content"), rs.getString("comment_write_date"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
 		
		return comment;
	}
	
	@Override
	public Integer modifyComment(Comment comment) {
		
		String query = "UPDATE comments SET comment_writer=?, comment_pw=?, comment_content=?"
					 + ", comment_write_date=? WHERE comment_id=?";
		int success = 0;
		
		try(Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(query);) {
			
			pstmt.setString(1, comment.getComment_writer());
			pstmt.setString(2, comment.getComment_pw());
			pstmt.setString(3, comment.getComment_content());
			pstmt.setString(4, comment.getComment_write_date());
			pstmt.setString(5, comment.getComment_id());
			
			success = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
			
		return success;
	}
	
	@Override
	public Integer deleteComment(String comment_id) {
		
		String query = "DELETE FROM comments WHERE comment_id=?";
		int success = 0;
		
		try(Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(query);) {
			
			pstmt.setString(1, comment_id);
			
			success = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return success;
	}
	
	@Override
	public Integer deleteComments(String board_id) {
		
		String query = "DELETE FROM comments WHERE board_id=?";
		int success = 0;
		
		try(Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(query);) {
			
			pstmt.setString(1, board_id);
			
			success = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return success;
	}
	
}
