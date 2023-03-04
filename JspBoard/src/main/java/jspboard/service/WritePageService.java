package jspboard.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jspboard.dao.BoardDAO;
import jspboard.dao.BoardDAO_Impl;
import jspboard.dto.Board;

public class WritePageService implements Service {

	BoardDAO boardDao = new BoardDAO_Impl();
	List<Board> boards;
	
	@Override
	public String process(HttpServletRequest request) {
		
		String sql = "SELECT * FROM boards ORDER BY board_id DESC";
		boards = boardDao.selectAllBoards(sql);
		
		request.setAttribute("board_id", boards.size()+1);
		
		return "board/write";
	}
}
