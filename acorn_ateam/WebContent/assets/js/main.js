// import Calendar from "./tui-calendar"; /* ES6 */
// // import Calendar from 'tui-calendar'
// import "./tui-calendar/dist/tui-calendar.css";

// // If you use the default popups, use this.
// import "./tui-date-picker/dist/tui-date-picker.css";
// import "./tui-time-picker/dist/tui-time-picker.css";

// 스크롤시 부드러운 움직임.
function scrollTo(element, dir) {
  if (dir == "up") {
    dir = element.offsetTop;
  } else {
    dir = element.offsetHeight;
  }
  window.scroll({
    behavior: "smooth",
    left: 0,
    top: dir,
  });
}

//홈화면일경우만 nav탭을 변경함
function changeNavColor() {
  const home = document.getElementById("home");
  if (home) {
    const nav = document.getElementById("navbar");
    // nav.setAttribute("backgroundColor","rgba(0,0,0,0");
    // nav.style.backgroundColor = "rgba(0,0,0,0)";
    // nav.style.setProperty("background", "rgba(0,0,0,0");
  }
}
function init() {
  window.addEventListener("DOMContentLoaded", () => {
    scrollTo(document.getElementsByTagName("body")[0], "up");
  });
  changeNavColor();
}

var container = document.getElementById("map");
var options = {
  center: new kakao.maps.LatLng(37.4986951, 127.0316076),
  level: 4,
};
var map = new kakao.maps.Map(container, options);
// 마커가 표시될 위치입니다
var markerPosition = new kakao.maps.LatLng(37.4986951, 127.0316076);
// 마커를 생성합니다
var marker = new kakao.maps.Marker({
  position: markerPosition,
});
// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

/* home화면의 이미지 클릭시 동작되는 로직 */
let homeImg = document.getElementById("home").style.backgroundImage;
const changeHomeImg = function (e) {
  if (e.target.nodeName === "IMG") {
    e.target.parentNode.classList.add("active");
    const src = e.target.getAttribute("src").split("/");
    const changeSrc = `${e.target.getAttribute("src")}`;
    const ss = `url('${changeSrc}')`;
    document.getElementById("home").style.backgroundImage = ss;
  }
};
const roomCardImg = document.querySelectorAll(".room__rows");
roomCardImg.forEach((item) => {
  item.addEventListener("click", (e) => {
    roomCardImg.forEach((item) => {
      item.classList.remove("active");
    });
    changeHomeImg(e);
  });
});

/*Modal Logic*/
const whereModal = document.getElementById("whereModal");
const openWhereModalBtn = document.querySelector(".openWhereModalBtn");
const overlayModal = document.querySelector(".modal__overaly");
const closeBtnModal = document.querySelector(".modal__close__btn");
const openWhereModal = () => {
  whereModal.classList.remove("hidden");
  map.relayout(); //모달창에서 카카오맵을 띄우면 리 레이아웃을해줘야함.
  var moveLatLon = new kakao.maps.LatLng(37.4986951, 127.0316076);
  // 지도 중심을 이동 시킵니다
  map.setCenter(moveLatLon);
};
const closeModal = () => {
  whereModal.classList.add("hidden");
};
//close Modal
overlayModal.addEventListener("click", closeModal);
closeBtnModal.addEventListener("click", closeModal);
//open Modal
openWhereModalBtn.addEventListener("click", openWhereModal);

// var calendar = tui.Calendar;

// var calendar = tui.Calendar;

init();
