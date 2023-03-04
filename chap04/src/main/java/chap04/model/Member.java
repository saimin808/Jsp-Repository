package chap04.model;

import java.util.ArrayList;
import java.util.List;

public class Member {

	private String name;
	private String id;
	private String password;
	private String birthday;
	
	private List<String> memos;
//	private LocalDate birthday;
	
	public Member(String name, String id, String password, String birthday) {
		this.name = name;
		this.id = id;
		this.password = password;
		this.birthday = birthday;
		this.memos = new ArrayList<>();
//		this.birthday = LocalDate.parse(birthday, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}
	
	public List<String> getMemos() {
		return memos;
	}
	
	public void putMemo(String memo) {
		memos.add(memo);
	}
	
	public boolean login(String id, String password) {
		return this.id.equals(id) && this.password.equals(password);
	}
	
	@Override
	public String toString() {
		return String.format("<b>%s(%s)</b>", name, id);
	}
}
