package jspboard.dao.comment;

import java.util.List;

import jspboard.dto.comment.Comment;

public interface CommentDAO {

	// 모든 댓글 불러오기
	List<Comment> selectComments(String board_id);
	
//	// DB에 있는 댓글 하나 불러오기
	Comment getComment(String comment_id);
	
	// DB에 댓글 하나 추가
	Integer insertComment(Comment comment);
	
//	// DB에 댓글 하나 수정
	Integer modifyComment(Comment comment);
		
//	// DB에 댓글 하나 삭제
	Integer deleteComment(String comment_id);
	
	// DB에서 한 게시물의 모든 댓글 삭제
	Integer deleteComments(String board_id);
}
