package jspboard.service;

import java.util.Calendar;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jspboard.dao.BoardDAO;
import jspboard.dao.BoardDAO_Impl;
import jspboard.dto.Board;

public class WriteService implements Service {

	BoardDAO boardDao = new BoardDAO_Impl();
	
	@Override
	public String process(HttpServletRequest request) {
		
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String sql = "SELECT * FROM boards ORDER BY board_id DESC";
		List<Board> boards = boardDao.selectAllBoards(sql);
		
		int board_id = boards.size() + 1;
		String title = request.getParameter("title");
		String type = request.getParameter("type");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String pw = request.getParameter("pw");
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		String write_date = formatter.format(calendar.getTime());
		
		int row = boardDao.insert(
				new Board(board_id, title, type, content, writer, pw, write_date, 0, 0, 0));
		
		if(row > 0) {
			return "redirect::/JspBoard/show?board_id=" + board_id;
		} else {
			request.setAttribute("message", "글 작성 실패");
			return null;
		}
	}
}
