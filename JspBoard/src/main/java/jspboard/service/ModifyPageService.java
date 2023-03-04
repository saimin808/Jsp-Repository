package jspboard.service;

import javax.servlet.http.HttpServletRequest;

import jspboard.dao.BoardDAO;
import jspboard.dao.BoardDAO_Impl;
import jspboard.dto.Board;

public class ModifyPageService implements Service {

	BoardDAO boardDao = new BoardDAO_Impl();
	
	@Override
	public String process(HttpServletRequest request) {
		
		String board_id = request.getParameter("board_id");
		String password = request.getParameter("pw");

		Board board = boardDao.getBoard(board_id);
		
		if(password.equals(board.getPassword())) {
			request.setAttribute("board", board);
			return "board/modify";
		} else {
			System.out.println("잘못된 비밀번호");
			return "redirect::"+ request.getContextPath() + "/pw_check?board_id=" + board_id
					+ "&msg=modify&pw_check=fail";
		}
	}
}
