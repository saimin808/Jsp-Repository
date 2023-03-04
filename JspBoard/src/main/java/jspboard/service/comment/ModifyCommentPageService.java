package jspboard.service.comment;

import javax.servlet.http.HttpServletRequest;

import jspboard.dao.comment.CommentDAO;
import jspboard.dao.comment.CommentDAO_Impl;
import jspboard.dto.comment.Comment;
import jspboard.service.Service;

public class ModifyCommentPageService implements Service {

	CommentDAO commentDao = new CommentDAO_Impl();
	
	@Override
	public String process(HttpServletRequest request) {
		
		String comment_pw = request.getParameter("comment_pw");
		String comment_id = request.getParameter("comment_id");
		
		Comment comment = commentDao.getComment(comment_id);
		
		if(comment_pw.equals(comment.getComment_pw())) {
			request.setAttribute("comment", comment);
			return "comment/comment_modify";
		} else {
			return "redirect::"+ request.getContextPath() + "/modify_comment?comment_id=" + comment_id
					+ "&msg=modify&pw_check=fail";
		}
	}
}
