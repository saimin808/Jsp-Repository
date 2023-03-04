package jspboard.dao;

import java.util.List;

import jspboard.dto.Board;

public interface BoardDAO {

	// 모든 게시물을 불러오는 역할
	List<Board> selectAllBoards(String query);
	
	// 하나의 게시물을 가져오는 역할
	Board getBoard(String board_id);
	
	// 하나의 게시물을 보고 조회수 올리는 역할
	Board selectBoard(String board_id);
	
	// DB에 새로운 게시글을 추가하는 역할
	Integer insert(Board board);
	
	// DB에 하나의 글을 수정하는 역할
	Integer modify(Board board);
	
	// DB에 하나의 글을 삭제하는 역할
	Integer delete(String board_id);
}
