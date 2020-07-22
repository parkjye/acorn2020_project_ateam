<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String users_id=(String)session.getAttribute("users_id");
	String date = "2020-07-14";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<form action="reserve.jsp">
		<input type="hidden" value=<%=users_id %> name="users_id" id="users_id" />
		
		<table>
			<thead>
				<tr>
					<th>객실 정보</th>
					<th>숙박 일자</th>
					<th>숙박 기간</th>
					<th>이용금액</th>
					<th>선택</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" name="room_name" value="1 강의실"  /></td>
					<td><input type="text" value=<%=date %> disabled /><input type="text" value=<%=date %> name="date" hidden /></td>
					<td>
						<select name="1days" class="days">
							<option value="1">1박 2일</option>
							<option value="2">2박 3일</option>
							<option value="3">3박 4일</option>
							<option value="4">4박 5일</option>
							<option value="5">5박 6일</option>
							<option value="6">6박 7일</option>
						</select>
					</td>
					<td>200,000원</td>
					<td><input type="checkbox" name="check" value="1" /></td>
				</tr>
				<tr>
					<td><input type="text" name="room_name" value="2 강의실"  /></td>
					<td><input type="text" value=<%=date %> disabled /></td>
					<td>
						<select name="2days" class="days">
							<option value="1">1박 2일</option>
							<option value="2">2박 3일</option>
							<option value="3">3박 4일</option>
							<option value="4">4박 5일</option>
							<option value="5">5박 6일</option>
							<option value="6">6박 7일</option>
						</select>
					</td>
					<td>200,000원</td>
					<td><input type="checkbox" name="check" value="2" /></td>
				</tr>
				<tr>
					<td><input type="text" name="room_name" value="3 강의실"  /></td>
					<td><input type="text" value=<%=date %> disabled /></td>
					<td>
						<select name="3days" class="days">
							<option value="1">1박 2일</option>
							<option value="2">2박 3일</option>
							<option value="3">3박 4일</option>
							<option value="4">4박 5일</option>
							<option value="5">5박 6일</option>
							<option value="6">6박 7일</option>
						</select>
					</td>
					<td>200,000원</td>
					<td><input type="checkbox" name="check" value="3"  /></td>
				</tr>
				<tr>
					<td><input type="text" name="room_name" value="4 강의실"  /></td>
					<td><input type="text" value=<%=date %> disabled /></td>
					<td>
						<select name="4days" class="days">
							<option value="1">1박 2일</option>
							<option value="2">2박 3일</option>
							<option value="3">3박 4일</option>
							<option value="4">4박 5일</option>
							<option value="5">5박 6일</option>
							<option value="6">6박 7일</option>
						</select>
					</td>
					<td>200,000원</td>
					<td><input type="checkbox" name="check" value="4" /></td>
				</tr>
			</tbody>
		</table>
		
		<input type="submit" value="제출"/>
	</form>
</div>

<script>
	
</script>

</body>
</html>








