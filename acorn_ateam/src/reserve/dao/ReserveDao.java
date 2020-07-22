package reserve.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
//	
//	public void switchCase(int msg) {
//		
//		switch(msg){
//		case 1:
//			System.out.println("1占쏙옙2占쏙옙");
//			break;
//		case 2:
//			System.out.println("2占쏙옙3占쏙옙");
//			break;
//		case 3:
//			System.out.println("3占쏙옙4占쏙옙");
//			break;
//		case 4:
//			System.out.println("4占쏙옙5占쏙옙");
//			break;
//		case 5:
//			System.out.println("5占쏙옙6占쏙옙");
//			break;
//		case 6:
//			System.out.println("6占쏙옙7占쏙옙");
//			break;
//		}
//	}
//	
	
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
	
	// reserve.jsp -> date_num 가져오는 메소드
	public int getDateNum() {
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int date_num = 0;
		
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "select date_num "
						+" from tb_date "; // where 절에 뭘 넣어야 할까요 ㅠㅠ
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
				//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				date_num=Integer.parseInt(rs.getString("date_num"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return date_num;
	}
	
	// 마이페이지 -> 내 예약 현황 보기 했을때 테이블 조회하는 메소드
	public ReserveDto myReservation(String users_id) {
			// dto 비워놓기
		ReserveDto dto=null;
		
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "select tb_reserve.users_id,date_year,date_month,date_day,room_name, " // 아이디,날짜,방이름 ( tb_reserve 테이블)
						+" users_phone " // 핸드폰 번호 ( tb_users 테이블 )
						+" from tb_reserve,tb_users"
						+" where tb_reserve.users_id=? "
						+" and tb_users.users_id=tb_reserve.users_id;";			
			
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setString(1, users_id);
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				dto=new ReserveDto();
				dto.setUsers_id(users_id);
				dto.setDate_year(rs.getString("date_year"));
				dto.setDate_month(rs.getString("date_month"));
				dto.setDate_day(rs.getString("date_day"));
				dto.setRoom_name(rs.getString("room_name"));
				dto.setUsers_phone(rs.getString("users_phone"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return dto;
	}
	
}
