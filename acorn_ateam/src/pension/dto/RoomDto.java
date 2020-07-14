package pension.dto;

public class RoomDto {
	private int room_num;
	private int room_isUse;
	
	public RoomDto() {}
	
	public RoomDto(int room_num, int room_isUse) {
		super();
		this.room_num = room_num;
		this.room_isUse = room_isUse;
	}
	
	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public int getRoom_isUse() {
		return room_isUse;
	}

	public void setRoom_isUse(int room_isUse) {
		this.room_isUse = room_isUse;
	}
	
	
}
