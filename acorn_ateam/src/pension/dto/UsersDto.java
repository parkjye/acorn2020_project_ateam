package pension.dto;

public class UsersDto {

	private String users_id;
	private String users_pwd;
	private String users_phone;
	private String users_email;
	
	public UsersDto() {}

	public UsersDto(String users_id, String users_pwd, String users_phone, String users_email) {
		super();
		this.users_id = users_id;
		this.users_pwd = users_pwd;
		this.users_phone = users_phone;
		this.users_email = users_email;
	}

	public String getUsers_id() {
		return users_id;
	}

	public void setUsers_id(String users_id) {
		this.users_id = users_id;
	}

	public String getUsers_pwd() {
		return users_pwd;
	}

	public void setUsers_pwd(String users_pwd) {
		this.users_pwd = users_pwd;
	}

	public String getUsers_phone() {
		return users_phone;
	}

	public void setUsers_phone(String users_phone) {
		this.users_phone = users_phone;
	}

	public String getUsers_email() {
		return users_email;
	}

	public void setUsers_email(String users_email) {
		this.users_email = users_email;
	}	
}
