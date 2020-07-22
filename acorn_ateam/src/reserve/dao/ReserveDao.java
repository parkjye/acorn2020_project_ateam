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
//			System.out.println("1��2��");
//			break;
//		case 2:
//			System.out.println("2��3��");
//			break;
//		case 3:
//			System.out.println("3��4��");
//			break;
//		case 4:
//			System.out.println("4��5��");
//			break;
//		case 5:
//			System.out.println("5��6��");
//			break;
//		case 6:
//			System.out.println("6��7��");
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
	
	// reserve.jsp -> date_num �������� �޼ҵ�
	public int getDateNum() {
		//�ʿ��� ��ü�� �������� ���� �������� ����� 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int date_num = 0;
		
		try {
			//Connection ��ü�� ������ ������ 
			conn = new DbcpBean().getConn();
			//������ sql �� �غ��ϱ�
			String sql = "select date_num "
						+" from tb_date "; // where ���� �� �־�� �ұ�� �Ф�
			pstmt = conn.prepareStatement(sql);
			//sql ���� ? �� ���ε��� ���� ������ ���ε��ϰ� 
				//select �� �����ϰ� ��� �޾ƿ��� 
			rs = pstmt.executeQuery();
			//�ݺ��� ���鼭 ��� �� �����ϱ� 
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
	
	// ���������� -> �� ���� ��Ȳ ���� ������ ���̺� ��ȸ�ϴ� �޼ҵ�
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
						+" users_phone " // �ڵ��� ��ȣ ( tb_users ���̺� )
						+" from tb_reserve,tb_users"
						+" where tb_reserve.users_id=? "
						+" and tb_users.users_id=tb_reserve.users_id;";			
			
			pstmt = conn.prepareStatement(sql);
			//sql ���� ? �� ���ε��� ���� ������ ���ε��ϰ� 
			pstmt.setString(1, users_id);
			//select �� �����ϰ� ��� �޾ƿ��� 
			rs = pstmt.executeQuery();
			//�ݺ��� ���鼭 ��� �� �����ϱ� 
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
