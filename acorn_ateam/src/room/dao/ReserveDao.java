package pension.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import pension.dto.DateDto;
import pension.dto.ReserveDto;
import pension.util.DbcpBean;

public class ReserveDao {
	private static ReserveDao dao;
	private ReserveDao() {}
	
	// 없으면 만듦
	public static ReserveDao getInstance() {
		if(dao==null) {
			dao=new ReserveDao();
		}
		return dao;
	}
	
	public void switchCase(int msg) {
		
		switch(msg){
		case 1:
			System.out.println("1박2일");
			break;
		case 2:
			System.out.println("2박3일");
			break;
		case 3:
			System.out.println("3박4일");
			break;
		case 4:
			System.out.println("4박5일");
			break;
		case 5:
			System.out.println("5박6일");
			break;
		case 6:
			System.out.println("6박7일");
			break;
		}
	}
	
	
	// 예약하기 눌렀을때 예약되는 메소드
	public boolean insert(ReserveDto dto1,DateDto dto2) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			// dto1은 ReserveDto, dto2는 DateDto 
			String sql = "insert into tb_reserve(date_num,date_year,date_month,date_day,users_id,room_name)"
					+ "values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			// dto1은 ReserveDto, dto2는 DateDto
			pstmt.setInt(1, dto2.getDate_num());
			pstmt.setString(2, dto1.getDate_year());
			pstmt.setString(3, dto1.getDate_month());
			pstmt.setString(4, dto1.getDate_day());
			pstmt.setString(5, dto1.getUsers_id());
			pstmt.setString(6, dto1.getRoom_name());
			
			//sql  문 수행하고 update or insert or delete 된 row 의 갯수 리턴받기 
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
}
