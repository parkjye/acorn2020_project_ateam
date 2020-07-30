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

//윈도우 load 순서: html -> DOMContentLoaded -> css
function init() {
  window.addEventListener("DOMContentLoaded", () => {
    scrollTo(document.getElementsByTagName("body")[0], "up");
  });
  changeNavColor();
}

// 위치찾기 맵
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

// 푸드맵 
var container2 = document.getElementById("map2");
var options2 = {
  center: new kakao.maps.LatLng(37.4986951, 2.0316076),
  level: 7,
};
var map2 = new kakao.maps.Map(container2, options2);
var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(1, 1), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(0, 0)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

var positions2 = [
  {
    title:'역전우동',
    latlng: new kakao.maps.LatLng(37.497554, 127.032973),
    content: `
    <div class="customoverlay">
      <a href="https://map.kakao.com/link/map/1461664660" target="_blank">
        <span class="title">역전우동</span>
      </a>
    </div>`
  },
  {
    title:'버거킹',
    latlng: new kakao.maps.LatLng(37.498882, 127.027533),
    content: `
    <div class="customoverlay">
      <a href="https://map.kakao.com/link/map/12119409" target="_blank">
        <span class="title">버거킹</span>
      </a>
    </div>`
  }
]
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
for(let i = 0; i<positions2.length; i++){
  // 마커 이미지를 생성합니다    
  var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
  var marker2 = new kakao.maps.CustomOverlay({
    map: map2, // 마커를 표시할 지도
    position: positions2[i].latlng, // 마커를 표시할 위치
    title : positions2[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    content: positions2[i].content,
    yAnchor:1
    // image : markerImage // 마커 이미지 
});
}
marker2.setMap(map2);
// 마커를 생성합니다
// var marker2 = new kakao.maps.Marker({
//   position: markerPosition2,markerPosition3
// });
// // 마커가 지도 위에 표시되도록 설정합니다
// marker2.setMap(map2);


/* home화면의 이미지 클릭시 동작되는 로직 */
let homeImg = document.getElementById("home").style.backgroundImage;
const changeHomeImg = function (e) {
  if (e.target.nodeName === "IMG") {
    e.target.parentNode.classList.add("active");
    // const src = e.target.getAttribute("src").split("/");
    const changeSrc = `${e.target.getAttribute("src")}`;
    const ss = `url('${changeSrc}')`;
    console.log(ss);
    document.getElementById("home").style.backgroundImage = ss;
  }
};
const roomCardImg = document.querySelectorAll(".room__rows");
roomCardImg.forEach((item) => {
  item.addEventListener("click", (e) => {
    roomCardImg.forEach((item) => {
      if(item.classList.contains("active")){
        item.classList.remove("active");
      }
    });
    changeHomeImg(e);
  });
});

/*Modal Logic*/
const whereModal = document.getElementById("whereModal");
const foodModal = document.getElementById("foodModal");
const openWhereModalBtn = document.querySelector(".openWhereModalBtn");
const openFoodModalBtn = document.querySelector(".openFoodModalBtn");
const overlayModal1 = document.querySelectorAll(".modal__overaly")[0];
const overlayModal2 = document.querySelectorAll(".modal__overaly")[1];
const closeBtnModal1 = document.querySelectorAll(".modal__close__btn")[0];
const closeBtnModal2 = document.querySelectorAll(".modal__close__btn")[1];
const openWhereModal = () => {
  whereModal.classList.remove("hidden");
  map.relayout(); //모달창에서 카카오맵을 띄우면 리 레이아웃을해줘야함.
  var moveLatLon = new kakao.maps.LatLng(37.4986951, 127.0316076);
  // 지도 중심을 이동 시킵니다
  map.setCenter(moveLatLon);
};
const openFoodModal = () => {
  foodModal.classList.remove("hidden");
  console.log(map2);
  map2.relayout(); //모달창에서 카카오맵을 띄우면 리 레이아웃을해줘야함.
  var moveLatLon2 = new kakao.maps.LatLng(37.4986951, 127.0316076);
  // 지도 중심을 이동 시킵니다
  map2.setCenter(moveLatLon2);
}

const closeModal = () => {
  whereModal.classList.add("hidden");
  foodModal.classList.add("hidden");
};
//close Modal
overlayModal1.addEventListener("click", closeModal);
closeBtnModal1.addEventListener("click", closeModal);
overlayModal2.addEventListener("click", closeModal);
closeBtnModal2.addEventListener("click", closeModal);

//open Modal
openWhereModalBtn.addEventListener("click", openWhereModal);
openFoodModalBtn.addEventListener("click", openFoodModal);

// Modal Logic (food)
// const foodModal = document.getElementById("foodModal");

init();