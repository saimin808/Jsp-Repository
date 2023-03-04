package jspboard.service.comment;

import javax.servlet.http.HttpServletRequest;

import jspboard.dao.comment.CommentDAO;
import jspboard.dao.comment.CommentDAO_Impl;
import jspboard.dto.comment.Comment;
import jspboard.service.Service;

public class DeleteCommentService implements Service {

	CommentDAO commentDao = new CommentDAO_Impl();
//	BoardDAO boardDao = new BoardDAO_Impl();
	
	@Override
	public String process(HttpServletRequest request) {
		
		String comment_id = request.getParameter("comment_id");
		String comment_pw = request.getParameter("comment_pw");
		String board_id = request.getParameter("board_id");
		
		Comment comment = commentDao.getComment(comment_id);
		
		if(comment_pw.equals(comment.getComment_pw())) {
			int success = commentDao.deleteComment(comment_id);
			if(success > 0) {
				System.out.println("댓글 수정 성공");
				return "redirect::" + request.getContextPath() + "/show?board_id=" + board_id
						+"&delete=complete";
			} else {
				return "redirect::" + request.getContextPath() + "/show?board_id=" + board_id
						+"&delete=fail";
			}
		} else {
			
			return "redirect::"+ request.getContextPath() + "/modify_comment?comment_id=" + comment_id
					+ "&msg=delete&pw_check=fail";
		}
	}
}
