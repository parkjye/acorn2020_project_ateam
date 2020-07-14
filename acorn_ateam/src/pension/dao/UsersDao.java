package pension.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import pension.dto.UsersDto;
import pension.util.DbcpBean;

public class UsersDao {

	private static UsersDao dao;
	private UsersDao() {}
	
	// ?—†?œ¼ë©? ë§Œë“¦
	public static UsersDao getInstance() {
		if(dao==null) {
			dao=new UsersDao();
		}
		return dao;
	}
	
	// ?šŒ?›ê°??…
	public boolean insert(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//?‹¤?–‰?•  sql ë¬? ì¤?ë¹„í•˜ê¸? 
			String sql = "insert into users (users_id,users_pwd,users_email,users_phone) values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			//? ?— ë°”ì¸?”© ?•  ê°’ì´ ?ˆ?œ¼ë©? ë°”ì¸?”©?•œ?‹¤.
			pstmt.setString(1, dto.getUsers_id());
			pstmt.setString(2, dto.getUsers_pwd());
			pstmt.setString(3, dto.getUsers_email());
			pstmt.setString(4, dto.getUsers_phone());
			//sql  ë¬? ?ˆ˜?–‰?•˜ê³? update or insert or delete ?œ row ?˜ ê°??ˆ˜ ë¦¬í„´ë°›ê¸° 
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
