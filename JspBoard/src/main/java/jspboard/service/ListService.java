package jspboard.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jspboard.dao.BoardDAO;
import jspboard.dao.BoardDAO_Impl;
import jspboard.dto.Board;

public class ListService implements Service {

	BoardDAO boardDao = new BoardDAO_Impl();
	
	@Override
	public String process(HttpServletRequest request) {
		
		String pageStr = request.getParameter("page");
		
		String sql = "SELECT * FROM boards ORDER BY board_id DESC";
		List<Board> boards = boardDao.selectAllBoards(sql);
		
		//현재 페이지 값을 통해 가져온 전체 글들 중 10개만 어트리뷰트에 실을 수 있도록
		// 부분 리스트를 생성해야 한다.
		int page;
		
		if (pageStr == null) {
			page = 1;
		} else {
			page = Integer.parseInt(pageStr);
		}
		
		// start_inex : (page - 1) * 10
		// end_index : page * 10 - 1 or 글의 최대 개수
		int page_size = 10;
		int board_size  = boards.size();
		int start_index = (page - 1) * page_size;
		int end_index = page * page_size;
		end_index = end_index > board_size ? board_size : end_index;
		
		System.out.printf("현재 페이지는 %d페이지고, 시작 인덱스는 %d, 마지막 인덱스는 %d입니다.\n",
															page, start_index, end_index);
		
		// 전체 글이 47개면 5페이지 필요하다
		int max_page = board_size % page_size == 0 ?
				board_size / page_size : board_size / page_size + 1;
		
		// 현재 페이지가 7일때 1 ~ 10로 나왔으면 함
		int pagination_start = (page / page_size) * page_size + 1;
		int pagination_end = (page / page_size + 1) * page_size;
		pagination_end = pagination_end > max_page ? max_page : pagination_end;
		
		System.out.printf("현재 페이지는 %d이고, 페이지 네비게이션 시작 숫자는 %d, 마지막 숫자는 %d입니다.,",
				page, pagination_start, pagination_end);
		
		request.setAttribute("boards", boards.subList(start_index, end_index));
		request.setAttribute("pagination_start", pagination_start);
		request.setAttribute("pagination_end", pagination_end);
		
		return "board/list";
	}
}
