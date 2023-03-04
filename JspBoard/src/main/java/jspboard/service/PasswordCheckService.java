package jspboard.service;

import javax.servlet.http.HttpServletRequest;

import jspboard.dao.BoardDAO;
import jspboard.dao.BoardDAO_Impl;
import jspboard.dto.Board;

public class PasswordCheckService implements Service {

	BoardDAO boardDao = new BoardDAO_Impl();
	
	@Override
	public String process(HttpServletRequest request) {
		
		String board_id = request.getParameter("board_id");
		String msg = request.getParameter("msg");
		
		Board board = boardDao.getBoard(board_id);
		
		request.setAttribute("board", board);
		request.setAttribute("msg", msg);
		
		return "board/pw_check";
	}
}
