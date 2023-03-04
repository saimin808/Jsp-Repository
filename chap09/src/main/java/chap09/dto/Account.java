package chap09.dto;

public class Account {

	String id;
	String password;
	String user_name;
	
	public Account() {};
	
	public Account(String id, String password, String user_name) {
		this.id = id;
		this.password = password;
		this.user_name = user_name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
}
