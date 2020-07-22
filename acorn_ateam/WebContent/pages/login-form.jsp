<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>에이콘팬션 로그인</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Reset.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Navbar.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/SideBar.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Login.css?v=<%=System.currentTimeMillis() %>" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Footer.css?v=<%=System.currentTimeMillis() %>" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet" />
    <!-- <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Yeon+Sung&display=swap" rel="stylesheet" /> -->
    <script src="https://kit.fontawesome.com/c0a9fdc19a.js"></script>
    <script defer src="${pageContext.request.contextPath}/assets/js/navBar.js?v=<%=System.currentTimeMillis() %>"></script>

    <style>
      .container {
        /*height: 100%;
margin: auto 0;
*/
        padding-top: 500px;
      }
    </style>
  </head>
  <body>
    <jsp:include page="templates/nav.jsp"></jsp:include>

    <!--로그인 페이지-->
    <div class="login__container">
      <div class="login__container__wrapper">
        <form action="login.jsp" method="post">
          <div class="form-group">
            <input type="text" name="users_id" id="users_id" placeholder="id" />
          </div>
          <div class="form-group">
            <input type="password" name="users_pwd" id="users_pwd" placeholder="pwd" />
          </div>
          <input class="login__submit" type="submit" value="로그인" />
        </form>
      </div>
    </div>
  </body>
</html>
