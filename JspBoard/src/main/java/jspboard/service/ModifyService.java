package jspboard.service;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import jspboard.dao.BoardDAO;
import jspboard.dao.BoardDAO_Impl;
import jspboard.dto.Board;

public class ModifyService implements Service {

	BoardDAO boardDao = new BoardDAO_Impl();
	Board board = new Board();
	
	@Override
	public String process(HttpServletRequest request) {
		
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		board.setBoard_id(Integer.parseInt(request.getParameter("board_id")));
		board.setTitle(request.getParameter("title"));
		board.setType(request.getParameter("type"));
		board.setWriter(request.getParameter("writer"));
		board.setContent(request.getParameter("content"));
		board.setPassword(request.getParameter("pw"));
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		String write_date = formatter.format(calendar.getTime());
		board.setWrite_date(write_date);
		
		int success = boardDao.modify(board);
		
		if(success > 0) {
			System.out.println("글 수정 성공");
			return "redirect::" + request.getContextPath() + "/list?modify=complete";
		} else {
			System.out.println("글 수정 실패");
			return "redirect::" + request.getContextPath() + "/list?modify=fail";
		}
	}
}
