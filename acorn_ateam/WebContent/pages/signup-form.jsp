<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>signup/signup-form</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Reset.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Navbar.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/SideBar.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Main.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/SignUp.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Footer.css?v=<%=System.currentTimeMillis() %>" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/c0a9fdc19a.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery-3.5.1.js"></script>
    <script defer src="${pageContext.request.contextPath}/assets/js/navBar.js?v=<%=System.currentTimeMillis() %>"></script>
  </head>
  <body>
    <jsp:include page="templates/nav.jsp"></jsp:include>
    <!--로그인 페이지-->
    <div class="signin__container">	
      <div class="signin__container__wrapper">
        <h3>🎉 가입을 환영합니다 🎉</h3>
        <form action="signup.jsp" method="post" name="signup" onsubmit="return formTest()" id="myform">
          <div class="form-group">
            <input type="text" name="users_id" id="users_id" placeholder="아이디를 입력해주세요" />
            <button id="idcheck"  >중복확인</button>
            <span id="checkResult"></span>
          </div>
          <div class="form-group">
            <input type="password" name="users_pwd" id="users_pwd" placeholder="비밀번호를 입력해주세요" />
          </div>
          <div class="form-group">
            <input type="password" name="users_pwdcheck" id="users_pwdcheck" placeholder="비밀번호 확인" />
          </div>
          <div class="form-group">
            <input type="text" name="users_email" id="users_email" placeholder="이메일을 입력해주세요" />
          </div>
          <div class="form-group">
            <input type="text" name="users_phone" id="users_phone" placeholder="휴대폰 번호를 입력해주세요" />
          </div>
          <div class="form-group">
            <button class="login__submit" type="submit">회원가입</button>
            <button class="login__submit" type="submit">취소</button>
					</div>
					<div class="form-group">
						<div class="image__wrapper">
							<img src="../assets/images/char.gif" alt="움직이는사진">
							<p>Designed by - Markus Magnusson</p>
						</div>
					</div>
        </form>
      </div>
    </div>
    
    <script>
	
	//아이디 중복확인을 통과 했는지 여부
	var canUseId=false;
	//중복 확인 버튼을 눌렀을때 실행할 함수 등록
	$("#idcheck").on("click", function(){
		
		//입력한 아이디를 읽어온다.
		var users_id=$("#users_id").val();
		//ajax 를 이용해서 서버에 보낸후 결과를 응답 받는다.
		$.ajax({
			method:"GET",
			url:"idcheck.jsp",
			data:"users_id="+users_id,
			success:function(data){
				//data => {isExist:true} or {isExist:false} 인 object 이다.
				if(data.isExist){//이미 존재하는 아이디임으로 사용 불가
					$("#checkResult")
					.text("사용불가")
					.css("color","red");
					//아이디가 사용 불가 하다고 표시한다.
					canUseId=false;
				}else{//사용가능 
					$("#checkResult")
					.text("사용가능")
					.css("color","green");
					//아이디가 사용 가능 하다고 표시한다.
					canUseId=true;
				}
 			}
		});
		//form 안에 있는 일반 버튼을 눌러도 폼이 전송 되기 때문에 폼 전송을 막아준다.
		return false;
	});
	//폼에 submit 이벤트가 일어났을때 호출될 함수 등록 
	$("#myform").on("submit", function(){
		
		if(!canUseId){//사용 불가한 아이디 이면 
			alert("아이디 중복을 확인 하세요");
			return false; //폼 제출 막기 
		}
	});
	
	
	// 입력란이 비어있으면 경고창을 띄우는 코드
	function formTest(){
	    var test = document.signup;
	    if(test.users_id.value==""){
	        alert("아이디를 입력하세요");
	        test.users_id.focus();
	        return false;
	    }
	    if(test.users_pwd.value==""){
	        alert("비밀번호를 입력하세요");
	        test.users_pwd.focus();
	        return false;
	    }
	    if(test.users_pwdcheck.value!=test.users_pwd.value){
	    	alert("비밀번호가 다릅니다.");
	    	test.users_pwdcheck.focus();
	        return false;
	    }
	    if(test.users_email.value == ""){
	        alert("이메일을 입력해주세요");
	        test.users_email.focus();
	        return false;
	    }
	    if(test.users_phone.value == ""){
	        alert("휴대폰 번호를 입력해주세요.");
	        test.users_phone.focus();
	        return false;
	    }
	}
	
	</script>
  </body>
</html>
