package jspboard.dto;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.sql.Date;

public class Board {

	private Integer board_id;
	private String title;
	private String type;
	private String content;
	private String writer;
	private String password;
	private String write_date;
	private Integer view;
	private Integer recommand;
	private	Integer not_recommand;
	
	private static SimpleDateFormat timeFormat = new SimpleDateFormat("kk:mm");
	private static SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy/MM/dd");
	
	public Board() {}
	
	public Board(Integer board_id, String title, String type, String content, String writer,
				String password, String write_date, Integer view, Integer recommand, Integer not_recommand) {
		this.board_id = board_id;
		this.title = title;
		this.type = type;
		this.content = content;
		this.writer = writer;
		this.password = password;
		this.write_date = write_date;
		this.view = view;
		this.recommand = recommand;
		this.not_recommand = not_recommand;
	}
	
	public Board(ResultSet rs) throws SQLException {
		this.board_id = rs.getInt("board_id");
		this.writer = rs.getString("writer");
		this.password = rs.getString("write_pw");
		this.title = rs.getString("write_title");
		this.type = rs.getString("write_type");
		this.content = rs.getString("write_content");
		this.write_date = rs.getString("write_date");
		this.view = rs.getInt("write_view");
		this.recommand = rs.getInt("write_recommand");
		this.not_recommand = rs.getInt("write_not_recommand");
	}
	
	// Getter를 만들어 놓으면 JSP의 EL에서는 필드가 있는 것처럼 사용할 수 있다.
//	public String getCreationDateTime() {
//		
//		LocalDate today = LocalDate.now();
//		// (1) DTO에는 java.util.Date 타입으로 설정 되어 있음
//		// (2) 우리가 rs.getDate()로 꺼내면 java.sql.Date 타입으로 꺼내짐
//		//		(java.sql.Date -> java.util.Date로 업캐스팅 발생)
//		// (3) java.sql.Date의 toLocalDate()를 사용하기 위해서는 다운캐스팅이 필요
//		LocalDate creationDate = ((java.sql.Date) write_date).toLocalDate();
//		
////		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		
////		System.out.println(format.format(write_date));
//		return creationDate.isEqual(today) ?
//				timeFormat.format(write_date) : dayFormat.format(write_date);
//	}
	
	// write_date를 String 타입으로 넣어줄때 (simpledateformat을 이용)
	public String getCreationDateTime() {
		Calendar today = Calendar.getInstance();
		String formatted_today = dayFormat.format(today.getTime());
		String write_date_day = write_date.substring(0,10);
		String write_date_time = write_date.substring(11,16);
		
		return write_date_day.equals(formatted_today) ?
				write_date_time : write_date_day;
	}
	
	public Integer getBoard_id() {
		return board_id;
	}

	public void setBoard_id(Integer board_id) {
		this.board_id = board_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public Integer getView() {
		return view;
	}

	public void setView(Integer view) {
		this.view = view;
	}

	public Integer getRecommand() {
		return recommand;
	}

	public void setRecommand(Integer recommand) {
		this.recommand = recommand;
	}

	public Integer getNot_recommand() {
		return not_recommand;
	}

	public void setNot_recommand(Integer not_recommand) {
		this.not_recommand = not_recommand;
	}
}
