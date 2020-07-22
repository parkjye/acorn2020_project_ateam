package pension.dto;

public class ReserveDto {
	
	private int reserve_num;
	private int date_num;
	private String date_year;
	private String date_month;
	private String date_day;
	private String users_id;
	private String room_name;
	
	public ReserveDto() {}
	
	public ReserveDto(int reserve_num, int date_num, String date_year, String date_month, String date_day,
			String users_id, String room_name) {
		super();
		this.reserve_num = reserve_num;
		this.date_num = date_num;
		this.date_year = date_year;
		this.date_month = date_month;
		this.date_day = date_day;
		this.users_id = users_id;
		this.room_name = room_name;
	}

	public int getReserve_num() {
		return reserve_num;
	}

	public void setReserve_num(int reserve_num) {
		this.reserve_num = reserve_num;
	}

	public int getDate_num() {
		return date_num;
	}

	public void setDate_num(int date_num) {
		this.date_num = date_num;
	}

	public String getDate_year() {
		return date_year;
	}

	public void setDate_year(String date_year) {
		this.date_year = date_year;
	}

	public String getDate_month() {
		return date_month;
	}

	public void setDate_month(String date_month) {
		this.date_month = date_month;
	}

	public String getDate_day() {
		return date_day;
	}

	public void setDate_day(String date_day) {
		this.date_day = date_day;
	}

	public String getUsers_id() {
		return users_id;
	}

	public void setUsers_id(String users_id) {
		this.users_id = users_id;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	
	
}
