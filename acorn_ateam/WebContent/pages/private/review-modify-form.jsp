<%@page import="board.dao.BoardDao"%>
<%@page import="board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int board_num = Integer.parseInt(request.getParameter("board_num"));
	    String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		
		BoardDao dao = BoardDao.getInstance();
		BoardDto dto = dao.getReview(board_num);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="review-modify.jsp" method="post">
		<div class="form-group"> </div>
			<!-- board_num은 사용자에게 hidden -->
			<input type="hidden" name="board_num" value="<%=dto.getBoard_num()%>"/>
		
			<!-- label은 구분을 위해 임시로 작성했습니다. -->
			<label for="board_title">제목</label>
			<input type="text" name="board_title" id="board_title" value="<%=dto.getBoard_title()%>"/>
			
			<input type="hidden" name="board_date" value="<%=dto.getBoard_date() %>"/>
			<label for="board_date">날짜</label>
			<input type="text" id="board_date" value="<%=dto.getBoard_date() %>" disabled/>
			
			<input type="hidden" name=board_view value="<%=dto.getBoard_view() %>"/>
			<label for="board_view">조회수</label>
			<input type="text" id="board_view" value="<%=dto.getBoard_view() %>" disabled/>
			
			<input type="hidden" name=board_up value="<%=dto.getBoard_up() %>"/>
			<label for="board_up">추천</label>
			<input type="text" id="board_up" value="<%=dto.getBoard_up() %>" disabled/>
			
			<input type="hidden" name=board_down value="<%=dto.getBoard_down() %>"/>
			<label for="board_down">비추</label>
			<input type="text" id="board_down" value="<%=dto.getBoard_down() %>" disabled/>

			<label for="board_content">내용</label>
			<textarea name="board_content" id="board_content" cols="100" rows="10"><%=dto.getBoard_content() %></textarea>
			
			<!-- comment(댓글) 추가 -->
			
		<div class="buttonWrap">
			<button type="submit" onclick="submitContents(this);">수정</button>
			<button type="button" onclick="location.href='${pageContext.request.contextPath}/pages/review-detail.jsp?board_num=<%=board_num%>'">취소</button>
		</div>
	</form>

<!-- SmartEditor  -->
<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
<script>
<%-- Smart Editor --%>
	var oEditors = [];
	
	//추가 글꼴 목록
	//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "board_content",
		sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
			fOnBeforeUnload : function(){
				//alert("완료!");
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	
	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["board_content"].exec("PASTE_HTML", [sHTML]);
	}
	
	function showHTML() {
		var sHTML = oEditors.getById["board_content"].getIR();
		alert(sHTML);
	}
		
	function submitContents(elClickedObj) {
		oEditors.getById["board_content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
		
		try {
			elClickedObj.form.submit();
		} catch(e) {}
	}
	
	function setDefaultFont() {
		var sDefaultFont = '궁서';
		var nFontSize = 24;
		oEditors.getById["board_content"].setDefaultFont(sDefaultFont, nFontSize);
	}
</script>
</body>
</html>