package jspboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jspboard.dto.Board;

public class BoardDAO_Impl implements BoardDAO {

	@Override
	public List<Board> selectAllBoards(String query) {
		
		List<Board> boards = new ArrayList<>();
		
		try (Connection conn = DBConnection.getConnection();
			 PreparedStatement pstmt = conn.prepareStatement(query);
			 ResultSet rs = pstmt.executeQuery();) {
			
			while(rs.next()) {
				boards.add(new Board(rs));
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return boards;
	}
	
	@Override
	public Board getBoard(String board_id) {
		
		Board board = null;
		String query = "SELECT * FROM boards WHERE board_id="+ board_id +" ORDER BY board_id";
		
		try (Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();) {
			
				while(rs.next()) {
					board = new Board(rs);
				}
				
			} catch(SQLException e) {
				e.printStackTrace();
			}
		
		return board;
	}
	
	@Override
	public Board selectBoard(String board_id) {
		
		Board board = null;
		
		String select = "SELECT * FROM boards WHERE board_id=? ORDER BY board_id";
		String update = "UPDATE boards SET write_view = write_view + 1 WHERE board_id=?";
		
		try (Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(select);
			PreparedStatement pstmt2 = conn.prepareStatement(update);) {
			
			pstmt.setString(1, board_id);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
					board = new Board(rs);
				}
				int updated_view = board.getView() + 1;
				board.setView(updated_view);
				
				pstmt2.setInt(1, board.getBoard_id());
				pstmt2.executeQuery();
				
			} catch(SQLException e) {
				e.printStackTrace();
			}
		
		return board;
	}
	
	@Override
	public Integer insert(Board board) {
		
		String query = "INSERT INTO boards VALUES (?,?,?,?,?,?,?,?,?,?)";
		
		int success = 0;
		
		try (Connection conn = DBConnection.getConnection();
			 PreparedStatement pstmt = conn.prepareStatement(query);) {
			
			pstmt.setInt(1, board.getBoard_id());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getPassword());
			pstmt.setString(4, board.getType());
			pstmt.setString(5, board.getTitle());
			pstmt.setString(6, board.getContent());
			pstmt.setString(7, board.getWrite_date());
			pstmt.setInt(8, board.getView());
			pstmt.setInt(9, board.getRecommand());
			pstmt.setInt(10, board.getNot_recommand());
			
			success = pstmt.executeUpdate();
			
			if(success > 0) {
				System.out.println("게시글 추가 완료");
			} else {
				System.out.println("게시글 추가 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return success;
	}
	
	@Override
	public Integer modify(Board board) {
		
		String query = "UPDATE boards SET writer=?, write_pw=?,"
				+ "write_type=?, write_title=?, write_content=?, write_date=?"
				+ "WHERE board_id =?";		
		int success = 0;
		
		System.out.println(query);
		
		try (Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(query);) {
			
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getPassword());
			pstmt.setString(3, board.getType());
			pstmt.setString(4, board.getTitle());
			pstmt.setString(5, board.getContent());
			pstmt.setString(6, board.getWrite_date());
			pstmt.setInt(7, board.getBoard_id());
			
			success = pstmt.executeUpdate();
			
			if(success > 0) {
				System.out.println("게시글 수정 완료");
			} else {
				System.out.println("게시글 수정 실패");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return success;
	}
	
	@Override
	public Integer delete(String board_id) {
		
		String query = "DELETE FROM boards WHERE board_id=" + board_id;
		
		int success = 0;
		
		try (Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(query);) {
			
			success = pstmt.executeUpdate();
			
			if(success > 0) {
				System.out.println("게시글 삭제 완료");
			} else {
				System.out.println("게시글 삭제 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return success;
	}
}
