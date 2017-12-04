package shop.models;

public class User {
	private long user_id;
	private String username;
	private String password;
	public User(int user_id, String username, String password) {
		super();
		this.user_id = user_id;
		this.username = username;
		this.password = password;
	}
	public User() {
		super();
	}
	public long getUser_id() {
		return user_id;
	}
	public void setUser_id(long l) {
		this.user_id = l;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
