<%@page import="pension.dao.UsersDao"%>
<%@page import="pension.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	UsersDto dto=UsersDao.getInstance().getData(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<form action="update.jsp" method="post">
		<div class="form-group">
			<label for="id">아이디</label>
			<input type="text" id="id" value="<%=dto.getUsers_id() %>" disabled />
		</div>
		<div class="form-group">
			<label for="phone">전화번호</label>
			<input type="text" id="phone" name="phone" />
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input type="text" id="email" name="email" />
		</div>
		<button type="submit" id="sendBtn">수정하기</button>
		<button type="reset">취소</button>
	</form>
</div>

<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<script>
	$("#sendBtn").on("click",function(){
		var result=confirm("수정하시겠습니까?");

		if(result){
			alert("수정되었습니다.");
			location.href="${pageContext.request.contextPath }/index.jsp";
		}else{
			location.href="${pageContext.request.contextPath }/mypage.jsp";
		}
	}

</script>

</body>
</html>



