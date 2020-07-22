package pension.dto;

public class DateDto {
	private int date_num;
	private String date_year;
	private String date_month;
	private String date_day;
	private int date_isUsing;
	private int date_sale;
	private int date_holiday;
	private String room_name;
	
	public DateDto() {}

	public DateDto(int date_num, String date_year, String date_month, String date_day, int date_isUsing, int date_sale,
			int date_holiday, String room_name) {
		super();
		this.date_num = date_num;
		this.date_year = date_year;
		this.date_month = date_month;
		this.date_day = date_day;
		this.date_isUsing = date_isUsing;
		this.date_sale = date_sale;
		this.date_holiday = date_holiday;
		this.room_name = room_name;
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

	public int getDate_isUsing() {
		return date_isUsing;
	}

	public void setDate_isUsing(int date_isUsing) {
		this.date_isUsing = date_isUsing;
	}

	public int getDate_sale() {
		return date_sale;
	}

	public void setDate_sale(int date_sale) {
		this.date_sale = date_sale;
	}

	public int getDate_holiday() {
		return date_holiday;
	}

	public void setDate_holiday(int date_holiday) {
		this.date_holiday = date_holiday;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	
	
}
