package users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import app.util.DbcpBean;
import users.dto.UsersDto;

public class UsersDao {

	private static UsersDao dao;
	private UsersDao() {}
	
	public static UsersDao getInstance() {
		if(dao==null) {
			dao=new UsersDao();
		}
		return dao;
	}
	
	public boolean insert(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();

			String sql = "insert into tb_users (users_id,users_pwd,users_email,users_phone) values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getUsers_id());
			pstmt.setString(2, dto.getUsers_pwd());
			pstmt.setString(3, dto.getUsers_email());
			pstmt.setString(4, dto.getUsers_phone());
 
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
	
	public boolean isValid(UsersDto dto) {
		
		boolean isValid=false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "select users_id"
					+" from tb_users"
					+" where users_id=? and users_pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUsers_id());
			pstmt.setString(2, dto.getUsers_pwd());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				isValid=true;
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
		return isValid;
	}
	
	public boolean delete(String id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag=0;
		
		try {
			conn = new DbcpBean().getConn();

			String sql = "delete from tb_users where users_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			flag=pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {}
		}if(flag>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public UsersDto getData(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		UsersDto dto=null;
		
		try {
			conn = new DbcpBean().getConn();
			String sql = "select * from tb_users where users_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto=new UsersDto();
				dto.setUsers_id(id);
				dto.setUsers_pwd(rs.getString("users_pwd"));
				dto.setUsers_email(rs.getString("users_email"));
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
	
	public boolean update(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "update tb_users set users_pwd=?,users_phone=?, users_email=? where users_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUsers_pwd());
			pstmt.setString(2, dto.getUsers_phone());
			pstmt.setString(3, dto.getUsers_email());
			pstmt.setString(4, dto.getUsers_id());
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
	
	// 마이페이지에 내 정보 띄우기
	public UsersDto myData(String users_id) {
 
		UsersDto dto=null;
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "SELECT users_phone,users_email"
					+ " FROM tb_users"
					+ " WHERE users_id=?";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setString(1, users_id);
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//결과 값 추출하기 
			if (rs.next()) {
				dto=new UsersDto();
				dto.setUsers_phone(rs.getString("users_phone"));
				dto.setUsers_email(rs.getString("users_email"));
				
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

	// 중복확인
	public boolean idcheck(String users_id) {
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		boolean isExist=false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "select users_id from tb_users"
						+" where users_id=? ";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setString(1, users_id);
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				isExist=true;
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
		return isExist;
	}
	
}

























