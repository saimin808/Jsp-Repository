package jspboard.service.comment;

import javax.servlet.http.HttpServletRequest;

import jspboard.service.Service;

public class CommentFailService implements Service {

	@Override
	public String process(HttpServletRequest request) {
		
		return "comment/comment_fail";
	}
}
