package jspboard.service.comment;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import jspboard.dao.comment.CommentDAO;
import jspboard.dao.comment.CommentDAO_Impl;
import jspboard.dto.comment.Comment;
import jspboard.service.Service;

public class WriteCommentService implements Service {
	
	CommentDAO commentDao = new CommentDAO_Impl();
	
	@Override
	public String process(HttpServletRequest request) {
		
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String board_id = request.getParameter("board_id");
		String comment_writer = request.getParameter("comment_writer");
		String comment_pw = request.getParameter("comment_pw");
		String comment_content = request.getParameter("comment_content");
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		String today = formatter.format(calendar.getTime());
		
		String comment_write_date = today;
		
		int success = commentDao.insertComment(new Comment(board_id, comment_writer,
										comment_pw, comment_content, comment_write_date));
		
		if(success > 0) {
			return "redirect::" + request.getContextPath() + "/show?board_id=" + board_id;
		} else {
			return "redirect::" + request.getContextPath() + "/comment/fail";
		}		
	}
}
