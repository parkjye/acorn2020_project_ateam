package reserve.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import app.util.DbcpBean;
import date.dto.DateDto;
import reserve.dto.ReserveDto;
import users.dto.UsersDto;


public class ReserveDao {
	private static ReserveDao dao;
	private ReserveDao() {}
	
	public static ReserveDao getInstance() {
		if(dao==null) {
			dao=new ReserveDao();
		}
		return dao;
	}

	
	
	public boolean insert(ReserveDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "insert into tb_reserve(date_num,date_year,date_month,date_day,users_id,room_name)"
					+" values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getDate_num());
			pstmt.setString(2, dto.getDate_year());
			pstmt.setString(3, dto.getDate_month());
			pstmt.setString(4, dto.getDate_day());
			pstmt.setString(5, dto.getUsers_id());
			pstmt.setString(6, dto.getRoom_name());
			
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
	
	// reserve.jsp -> date_num 받아오는 코드
	public int getDateNum(ReserveDto dto) {
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int date_num = 0;
		
		try {
			 
			conn = new DbcpBean().getConn();
			
			String sql = "select date_num "
						+" from tb_date "
						+" where date_year=? date_month=? date_day=? room_name=?"; 
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getDate_year());
			pstmt.setString(2, dto.getDate_month());
			pstmt.setString(3, dto.getDate_day());
			pstmt.setString(4, dto.getRoom_name());
			rs = pstmt.executeQuery();
			 
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
	
	// 내 예약현황 보기
	public ReserveDto myReservation(String users_id) {
			// dto �������
		ReserveDto dto=null;
		
		//�ʿ��� ��ü�� �������� ���� �������� ����� 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection ��ü�� ������ ������ 
			conn = new DbcpBean().getConn();
			//������ sql �� �غ��ϱ�
			String sql = "select tb_reserve.users_id,date_year,date_month,date_day,room_name, " // ���̵�,��¥,���̸� ( tb_reserve ���̺�)
						+" users_phone " // 
						+" from tb_reserve,tb_users"
						+" where tb_reserve.users_id=? "
						+" and tb_users.users_id=tb_reserve.users_id;";			
			
			pstmt = conn.prepareStatement(sql);
 
			pstmt.setString(1, users_id);
 
			rs = pstmt.executeQuery();

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
