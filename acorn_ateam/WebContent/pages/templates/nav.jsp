<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>
  
<!-- Navbar -->
<nav id="navbar" class="">
  <div class="navbar__logo">
    <a href="${pageContext.request.contextPath}/index.jsp">ACORN PENSION</a>
    
    <img id="home__cup" src="${pageContext.request.contextPath}/assets/images/cup.png" alt="cup" />
  </div>
  <ul class="navbar__menu">
    <li class="navbar__menu__item" data-link="#about">
	    <a href="${pageContext.request.contextPath}/pages/introduce.jsp">
	      <i class="fas fa-book"></i><br />
	      <span>소개</span>
	    </a>
    </li>
    <li class="navbar__menu__item" data-link="#reserve">
	    <a href="${pageContext.request.contextPath}/pages/reserve.jsp">
	      <i class="far fa-calendar-alt"></i><br />
	      <span>예약하기</span>
	    </a>
    </li>
    <li class="navbar__menu__item" data-link="#review">
  	    <a href="${pageContext.request.contextPath}/pages/reviews.jsp">
	      <i class="fas fa-clipboard-list"></i><br />
	      <span>이용후기</span>
	    </a>
    </li>
    <li class="navbar__menu__item" data-link="#login">
   	    <a href="${pageContext.request.contextPath}/pages/login-form.jsp">
	      <i class="fas fa-sign-in-alt"></i><br />
	      <span>로그인</span>
	    </a>
    </li>
    <li class="navbar__menu__item" data-link="#signup">
   	    <a href="${pageContext.request.contextPath}/pages/signup-form.jsp">
	      <i class="fas fa-user-plus"></i><br />
	      <span>회원가입</span>
	    </a>
    </li>
  </ul>

  <button class="navbar__toggle-btn">
    <i class="fas fa-bars"></i>
  </button>
</nav>