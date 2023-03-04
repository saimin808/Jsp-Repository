package jspboard.service.comment;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import jspboard.dao.comment.CommentDAO;
import jspboard.dao.comment.CommentDAO_Impl;
import jspboard.dto.comment.Comment;
import jspboard.service.Service;

public class ModifyCommentService implements Service {

	CommentDAO commentDao = new CommentDAO_Impl();
	
	@Override
	public String process(HttpServletRequest request) {
		
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Comment comment = new Comment();
		
		comment.setComment_id(request.getParameter("comment_id"));
		comment.setComment_writer( request.getParameter("comment_writer"));
		comment.setComment_pw( request.getParameter("comment_pw"));
		comment.setComment_content(request.getParameter("comment_content"));
		String board_id = request.getParameter("board_id");
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		String today = formatter.format(calendar.getTime());
		
		comment.setComment_write_date(today);
		
		int success = commentDao.modifyComment(comment);
		
		if(success > 0) {
			System.out.println("댓글 수정 성공");
			return "redirect::" + request.getContextPath() + "/show?board_id=" + board_id
					+"&modify=complete";
		} else {
			System.out.println("댓글 수정 실패");
			comment = commentDao.getComment(request.getParameter("comment_id"));
			request.setAttribute("comment", comment);
			request.setAttribute("modify", "fail");
			return "comment/comment_modify";
		}
		
	}
}
