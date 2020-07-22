<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=s, initial-scale=1.0" />
    <title>Acorn Pension</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Reset.css?ver=1" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css?ver=1" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Navbar.css?ver=1" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/SideBar.css?ver=1.1" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Home.css?ver=1" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/RoomIntroduce.css?ver=1" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/RoomCard.css?ver=1" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Food.css?ver=1" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Footer.css?ver=1" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Yeon+Sung&display=swap" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/c0a9fdc19a.js"></script>

    <script defer src="${pageContext.request.contextPath}/assets/js/main.js?ver=1.1"></script>
  </head>

  <body class="animate__animated animate__zoomIn animate__delay-0.3s">
    <jsp:include page="pages/templates/nav.jsp"></jsp:include>

    <!-- sideBar -->
    <aside id="sideBar">
      <div class="container">
        <ul>
          <li><i class="fas fa-book"></i><br /></li>
          <li><i class="far fa-calendar-alt"></i><br /></li>
          <li><i class="fas fa-clipboard-list"></i><br /></li>
        </ul>
      </div>
    </aside>

    <!--Home-->
    <main id="home">
      <div class="home__container">
        <h1 class="home__title">
          여기다가 뭐라고 쓸까요
        </h1>
        <h2 class="home__description">
          무슨말이 어울려요
        </h2>
      </div>
      <div id="home__arrow" class="animate__animated animate__slideInDown animate__infinite">
        <i class="fas fa-arrow-down"></i>
      </div>
    </main>

    <!-- roomIntroduce -->
    <section id="roomIntroduce" class="section">
      <div class="container">
        <div class="room__rows">
          <img src="./assets/images/room1.jpg" alt="" />
          <div class="title">1 강의실</div>
        </div>
        <div class="room__rows">
          <img src="./assets/images/room2.jpg" alt="" />
          <div class="title">2 강의실</div>
        </div>
        <div class="room__rows">
          <img src="./assets/images/room3.jpg" alt="" />
          <div class="title">3 강의실</div>
        </div>
        <div class="room__rows">
          <img src="./assets/images/room4.jpg" alt="" />
          <div class="title">4 강의실</div>
        </div>
      </div>
    </section>

    <!-- roomCard -->
    <section id="roomCard" class="section">
      <div class="__title">
        <h1>Room Information</h1>
        <div class="__title__line animate__animated animate__pulse animate__infinite"></div>
      </div>
      <div class="container">
        <div id="roomCard_content" class="content__area">
          <div class="content__area__row">
            <h4 id="roomInfo__title" class="title-orange">1.강의실</h4>
          </div>
          <div class="content__area__row">
            <h5 id="roomInfo__info" class="title-gray">좋은 구조/좌석30개</h5>
          </div>
          <div class="content__area__row">
            <h5>스타일</h5>
            <div class="divider"></div>
            <h5 id="roomInfo__floor">카페형</h5>
          </div>
          <div class="content__area__row">
            <h5>인원(최대)</h5>
            <div class="divider"></div>
            <h5 id="roomInfo__Capacity">30명</h5>
          </div>
          <div class="content__area__row">
            <h5>크기</h5>
            <div class="divider"></div>
            <h5 id="roomInfo__Size">51평형</h5>
          </div>
          <div class="content__area__row">
            <button id="roomInfo__btn-left" class="btn"><</button>
            <button id="roomInfo__btn-right" class="btn">></button>
          </div>
        </div>

        <img id="roomInfo__img" src="assets/images/room1.jpg" alt="" class="content__img" />
        <div class="detail__info">
          <span class="title-orange">Contact Us</span>
          <h4>010-2325-1002</h4>
          <h5 class="title-gray">서울특별시 강남구 테헤란로</h5>
          <span class="title-orange">Account Info</span>
          <h5 class="title-gray">서울특별시 강남구 테헤란로</h5>
          <div class="buttons">
            <button>예약하기</button>
            <button>오시는길</button>
          </div>
        </div>
      </div>
    </section>
    <!-- food -->
    <section id="food" class="section">
      <div class="__title">
        <h1>Food</h1>
        <div class="__title__line animate__animated animate__pulse animate__infinite"></div>
      </div>
      <ul class="list__area">
        <li>
          <div class="thum">
            <a href="#">
              <img src="http://udon0410.com/wp-content/uploads/2018/08/main_slide1-1910x1075.png" alt="역전우동" />
            </a>
          </div>
          <div class="cont_area">
            <i>
              <span>#</span>

              역전우동
            </i>
            <h4>따뜻한 국물이 일품인 백종원의 역전우동</h4>
            <div class="cont">
              "어쩌구 저쩌구 튀김우동 존맛탱이라고~"
            </div>
            <a href="#">➡Find</a>
          </div>
        </li>
        <li>
          <div class="thum">
            <a href="#">
              <img src="https://m.foodnjob.com/upload/upload/thumb3_offer_user/201911/1572593574_mem.PNG" alt="오미라식당" />
            </a>
          </div>
          <div class="cont_area">
            <i>
              <span>#</span>
              오마리식당
            </i>
            <h4>오미라 머시기</h4>
            <div class="cont">
              "어쩌구 저쩌구 한식뷔페입니다"
            </div>
            <a href="#">➡Find</a>
          </div>
        </li>
      </ul>
    </section>

    <!-- footer -->
    <footer id="footer">
      <div class="section">
        <div class="container">
          <div class="footer__row">
            <h4>에이콘 팬션</h4>
          </div>
          <div class="footer__row">
            <h5>이용약관</h5>
            <div class="divider"></div>
            <h5>개인정보 처리방침</h5>
            <div class="divider"></div>
            <h5>사업자정보확인</h5>
          </div>
          <div class="footer__row">
            <span>
              대표 : 000 상호/대표자명: 에이콘펜션/000 | 사업자등록번호: 000-00-00000 | 통신판매업신고번호: 제 202020-0000-0000호
            </span>
          </div>
          <div class="footer__row">
            <span>
              주소: 서울특별시 강남구 테헤란로 124 삼원타워 | 대표전화 : 000-000-0000 | 예약문의/이메일: 010-0000-0000, 0000@naver.com | 입금계좌: 00금고 0,
              예금주: 000
            </span>
          </div>
          <div class="footer__row">
            <div class="line"></div>
          </div>
          <div class="footer__row">
            <span>Copyright ⓒ All rights reserved.</span>
          </div>
        </div>
      </div>
    </footer>
  </body>
</html>
