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

    <script defer src="${pageContext.request.contextPath}/assets/js/navBar.js?v=<%=System.currentTimeMillis() %>"></script>
  </head>
  <body>
    <jsp:include page="templates/nav.jsp"></jsp:include>
    <!--로그인 페이지-->
    <div class="signin__container">
      <div class="signin__container__wrapper">
        <h3>Wellcome! A 펜션에 오신 것을 환영합니다/</h3>
        <form action="signup.jsp" method="post">
          <div class="form-group">
            <input type="text" name="users_id" id="users_id" placeholder="아이디를 입력해주세요" />
          </div>
          <div class="form-group">
            <input type="password" name="users_pwd" id="users_pwd" placeholder="비밀번호를 입력해주세요" />
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
        </form>
      </div>
    </div>
  </body>
</html>
