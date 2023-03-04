package jspboard.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jspboard.dao.BoardDAO;
import jspboard.dao.BoardDAO_Impl;
import jspboard.dao.comment.CommentDAO;
import jspboard.dao.comment.CommentDAO_Impl;
import jspboard.dto.Board;
import jspboard.dto.comment.Comment;

public class ShowBoardService implements Service {

	BoardDAO boardDao = new BoardDAO_Impl();
	CommentDAO commentDao = new CommentDAO_Impl();
	
	@Override
	public String process(HttpServletRequest request) {
		
		String board_id = request.getParameter("board_id");
		
		if(board_id == null) {
			return "board/not_exists.jsp";
		} 
		
		Board board = boardDao.selectBoard(board_id);
		List<Comment> comments = commentDao.selectComments(board_id);
		
		request.setAttribute("board", board);
		request.setAttribute("comments", comments);
		request.setAttribute("comments_size", comments.size());
		
		return "board/show";
	}
}
