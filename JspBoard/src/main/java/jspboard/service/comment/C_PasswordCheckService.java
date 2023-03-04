package jspboard.service.comment;

import javax.servlet.http.HttpServletRequest;

import jspboard.dao.comment.CommentDAO;
import jspboard.dao.comment.CommentDAO_Impl;
import jspboard.dto.comment.Comment;
import jspboard.service.Service;

public class C_PasswordCheckService implements Service {

	CommentDAO commentDao = new CommentDAO_Impl();
	
	@Override
	public String process(HttpServletRequest request) {
		
		String comment_id = request.getParameter("comment_id");
		String msg = request.getParameter("msg");
		
		Comment comment = commentDao.getComment(comment_id);
		
		request.setAttribute("comment", comment);
		request.setAttribute("msg", msg);
		
		return "comment/comment_pw_check";
	}
}
