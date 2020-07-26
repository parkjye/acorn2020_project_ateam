package date.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import app.util.DbcpBean;
import date.dto.DateDto;

public class DateDao {
	private static DateDao dao;
	private DateDao() {}
	public static DateDao getInstance() {
		if(dao==null) {
			dao=new DateDao();
		}
		return dao;
	}
	
	//예약가능 여부 확인 예약가능=1, 예약불가=0
	public DateDto isUsing(DateDto dto) {
		
		DateDto Dto = null;
		
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();

			//실행할 sql 문 준비하기
			String sql = "select date_isusing from tb_date"
					+ " where date_year=? and date_month=? and date_day=?"
					+ " and room_name=?";

			pstmt = conn.prepareStatement(sql);

			//sql 문에 ? 에 바인딩
			pstmt.setString(1, dto.getDate_year());
			pstmt.setString(2, dto.getDate_month());
			pstmt.setString(3, dto.getDate_day());
			pstmt.setString(4, dto.getRoom_name());

			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();

			//반복문 돌면서 결과 값 추출하기 
			while (rs.next()) {
				dto = new DateDto();
				dto.setDate_year(rs.getString("date_isusing"));
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
		return Dto;
	}
	
}//isUsing
