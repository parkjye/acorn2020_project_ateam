package room.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import room.dto.*;
import app.util.*;
 
public class RoomDao {

	private static RoomDao dao;
	private RoomDao() {}
	
	public static RoomDao getInstance() {
		if(dao==null) {
			dao=new RoomDao();
		}
		return dao;
	}
	

	public List<RoomDto> getList(){
		List<RoomDto> list=new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=new DbcpBean().getConn();
			String sql="SELECT *"
					+ " FROM db_room"
					+ " ORDER BY room_num ASC";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				RoomDto dto=new RoomDto();
				dto.setRoom_num(rs.getInt("room_num"));
				dto.setRoom_isUse(rs.getInt("room_isUse"));
				
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		return list;
	}
	
	
	
}









