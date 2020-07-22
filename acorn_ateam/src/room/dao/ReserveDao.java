package room.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import app.util.DbcpBean;
import room.dto.DateDto;
import room.dto.ReserveDto;
import users.dto.UsersDto;

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
