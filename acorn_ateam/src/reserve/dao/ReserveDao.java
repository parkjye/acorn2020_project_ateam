package reserve.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import app.util.DbcpBean;
import date.dto.DateDto;
import reserve.dto.ReserveDto;


public class ReserveDao {
	private static ReserveDao dao;
	private ReserveDao() {}
	
	public static ReserveDao getInstance() {
		if(dao==null) {
			dao=new ReserveDao();
		}
		return dao;
	}
	
	public void switchCase(int msg) {
		
		switch(msg){
		case 1:
			System.out.println("1��2��");
			break;
		case 2:
			System.out.println("2��3��");
			break;
		case 3:
			System.out.println("3��4��");
			break;
		case 4:
			System.out.println("4��5��");
			break;
		case 5:
			System.out.println("5��6��");
			break;
		case 6:
			System.out.println("6��7��");
			break;
		}
	}
	
	
	public boolean insert(ReserveDto dto1,DateDto dto2) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "insert into tb_reserve(date_num,date_year,date_month,date_day,users_id,room_name)"
					+ "values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto2.getDate_num());
			pstmt.setString(2, dto1.getDate_year());
			pstmt.setString(3, dto1.getDate_month());
			pstmt.setString(4, dto1.getDate_day());
			pstmt.setString(5, dto1.getUsers_id());
			pstmt.setString(6, dto1.getRoom_name());
			
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
