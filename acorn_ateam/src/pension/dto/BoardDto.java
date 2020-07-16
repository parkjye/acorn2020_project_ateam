package pension.dto;

public class BoardDto {
	//9, 조회수, 댓글수, 추천, 비추천 default=0
	private int board_num;
	private String users_id;
	private String board_title;
	private String board_content;
	private int board_view;
	private int board_comment_count;
	private int board_up;
	private int board_down;
	private String board_date;
	
	public BoardDto() {}

	public BoardDto(int board_num, String users_id, String board_title, String board_content, int board_view,
			int board_comment_count, int board_up, int board_down, String board_date) {
		super();
		this.board_num = board_num;
		this.users_id = users_id;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_view = board_view;
		this.board_comment_count = board_comment_count;
		this.board_up = board_up;
		this.board_down = board_down;
		this.board_date = board_date;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getUsers_id() {
		return users_id;
	}

	public void setUsers_id(String users_id) {
		this.users_id = users_id;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public int getBoard_view() {
		return board_view;
	}

	public void setBoard_view(int board_view) {
		this.board_view = board_view;
	}

	public int getBoard_comment_count() {
		return board_comment_count;
	}

	public void setBoard_comment_count(int board_comment_count) {
		this.board_comment_count = board_comment_count;
	}

	public int getBoard_up() {
		return board_up;
	}

	public void setBoard_up(int board_up) {
		this.board_up = board_up;
	}

	public int getBoard_down() {
		return board_down;
	}

	public void setBoard_down(int board_down) {
		this.board_down = board_down;
	}

	public String getBoard_date() {
		return board_date;
	}

	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	
}
