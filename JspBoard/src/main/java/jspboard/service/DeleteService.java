package jspboard.service;

import javax.servlet.http.HttpServletRequest;

import jspboard.dao.BoardDAO;
import jspboard.dao.BoardDAO_Impl;
import jspboard.dao.comment.CommentDAO;
import jspboard.dao.comment.CommentDAO_Impl;
import jspboard.dto.Board;

public class DeleteService implements Service {

	BoardDAO boardDao = new BoardDAO_Impl();
	CommentDAO commentDao = new CommentDAO_Impl();

	@Override
	public String process(HttpServletRequest request) {

		String board_id = request.getParameter("board_id");
		String password = request.getParameter("pw");

		Board board = boardDao.getBoard(board_id);

		if (password.equals(board.getPassword())) {

			int delete_comment = commentDao.deleteComments(board_id);
			if (delete_comment > 0) {
				int delete_board = boardDao.delete(board_id);

				if (delete_board > 0) {
					return "redirect::/JspBoard/list?delete=complete";
				} else {
					return "redirect::/JspBoard/list?delete=fail";
				}
			} else {
				return "redirect::" + request.getContextPath() + "/pw_check?board_id=" + board_id
						+ "&msg=delete&pw_check=fail";
			}
		} else
			return "redirect::" + request.getContextPath() + "/pw_check?board_id=" + board_id
					+ "&msg=delete&pw_check=fail";
	}
}
