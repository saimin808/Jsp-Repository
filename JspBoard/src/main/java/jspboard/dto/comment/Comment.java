package jspboard.dto.comment;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Comment {

	String comment_id;
	String board_id;
	String comment_writer;
	String comment_pw;
	String comment_content;
	String comment_write_date;
	
	private static SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy/MM/dd");
	
	public Comment() {}
	
	public Comment(String board_id, String comment_writer, String comment_pw, String comment_content,
			String comment_write_date) {
		this.board_id = board_id;
		this.comment_writer = comment_writer;
		this.comment_pw = comment_pw;
		this.comment_content = comment_content;
		this.comment_write_date = comment_write_date;
	}
	
	public Comment(String comment_id, String board_id, String comment_writer, String comment_pw, String comment_content,
			String comment_write_date) {
		this.comment_id = comment_id;
		this.board_id = board_id;
		this.comment_writer = comment_writer;
		this.comment_pw = comment_pw;
		this.comment_content = comment_content;
		this.comment_write_date = comment_write_date;
	}
	
	public String getCreationDateTime() {
		Calendar today = Calendar.getInstance();
		String formatted_today = dayFormat.format(today.getTime());
		String write_date_day = comment_write_date.substring(0,10);
		String write_date_time = comment_write_date.substring(11,16);
				
		return write_date_day.equals(formatted_today) ?
				write_date_time : write_date_day;
	}

	public String getComment_id() {
		return comment_id;
	}

	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public String getComment_writer() {
		return comment_writer;
	}

	public void setComment_writer(String comment_writer) {
		this.comment_writer = comment_writer;
	}

	public String getComment_pw() {
		return comment_pw;
	}

	public void setComment_pw(String comment_pw) {
		this.comment_pw = comment_pw;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public String getComment_write_date() {
		return comment_write_date;
	}

	public void setComment_write_date(String comment_write_date) {
		this.comment_write_date = comment_write_date;
	}
}
