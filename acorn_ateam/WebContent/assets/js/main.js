function hoverClassImg() {
  document.documentElement.querySelectorAll(".room__rows").forEach((item, index) => {
    item.addEventListener("mouseover", floatingTitle);
    item.addEventListener("mouseout", hiddenTitle);
  });
}
//
function floatingTitle(e) {
  let title = e.target;
  if (e.target.nodeName === "IMG") {
    title = title.nextSibling.nextSibling;
    title.classList.add("view");
    title.classList.add("animate__animated", "animate__fadeIn");
  } else {
    title.classList.add("view");
    title.classList.add("animate__animated", "animate__fadeIn");
  }
}
function hiddenTitle(e) {
  let title = e.target;
  if (e.target.nodeName === "IMG") {
    title = title.nextSibling.nextSibling;
    title.classList.remove("view");
    title.classList.remove("animate__animated", "animate__fadeIn");
  } else {
    title.classList.remove("view");
    title.classList.remove("animate__animated", "animate__fadeIn");
  }
}

//navbar를 투명하게만들고 움직일때 최상단에 위치하게함.
const navbar = document.getElementById("navbar");
const navbarHeight = navbar.getBoundingClientRect().height;
const homeCup = document.getElementById("home__cup");
//사이드바 관련 변수
const sideBar = document.getElementById("sideBar");
let angle = 0;
document.addEventListener("scroll", () => {
  angle = (angle + 60) % 36000;
  homeCup.style.transform = "rotate(" + angle + "deg)";

  let y = window.scrollY;
  if (y > navbarHeight) {
    sideBar.classList.remove("hidden");
    
    sideBar.classList.add("view");
    navbar.classList.add("navbar--dark");

    document.querySelector(".navbar__logo").childNodes[1].classList.add("white");

    const a = document.querySelectorAll(".navbar__menu__item").forEach((item) => {
      item.classList.add("white");
      item.childNodes[1].childNodes[1].classList.add("white");
      item.childNodes[1].childNodes[4].classList.add("white");
    });
  } else {
    sideBar.classList.remove("view");
    sideBar.classList.add("hidden");
    navbar.classList.remove("navbar--dark");
    document.querySelector(".navbar__logo").childNodes[1].classList.remove("white");

    const a = document.querySelectorAll(".navbar__menu__item").forEach((item) => {
      item.classList.remove("white");
      item.childNodes[1].childNodes[1].classList.remove("white");
      item.childNodes[1].childNodes[4].classList.remove("white");
    });
  }
});

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

function init() {
  window.addEventListener("DOMContentLoaded", () => {
    scrollTo(document.getElementsByTagName("body")[0], "up");
  });

  hoverClassImg();
}

const roomTitles = ["1.강의실", "2.강의실", "3.강의실", "4.강의실"];
const roomInfos = ["좋은 구조/좌석30개", "채광이 좋은 구조/좌석30개", "공간이 넓은 구조/좌석30개", "풍경이 좋은 구조/좌석30개"];
const roomFloors = ["카페형", "사무실형", "도서관형", "야외형"];
const roomCapacity = ["30명", "25명", "35명", "99명"];
const roomSize = ["51평형", "48평형", "60평형", "55평형"];
const roomImges = ["room1", "room2", "room3", "room4"];
let roomInfoCount = 0;
const roomInfoMaxCount = 4;
function roomInfo() {
  //
  const content = document.querySelector("#roomCard_content");

  const leftBtn = document.querySelector("#roomInfo__btn-left");
  const rightBtn = document.querySelector("#roomInfo__btn-right");
  const title = document.querySelector("#roomInfo__title");
  const info = document.querySelector("#roomInfo__info");
  const floor = document.querySelector("#roomInfo__floor");
  const capacity = document.querySelector("#roomInfo__Capacity");
  const size = document.querySelector("#roomInfo__Size");
  const img = document.querySelector("#roomInfo__img");

  leftBtn.addEventListener("click", () => {
    roomInfoCount = (roomInfoCount - 1) % roomInfoMaxCount;
    if (roomInfoCount < 0) roomInfoCount = 3;
    changeElement(roomInfoCount);
  });
  rightBtn.addEventListener("click", () => {
    roomInfoCount = (roomInfoCount + 1) % roomInfoMaxCount;
    changeElement(roomInfoCount);
  });

  const changeElement = function (roomInfoCount) {
    if (content.classList.contains("animate__animated")) {
      content.classList.remove("animate__animated", "animate__zoomIn");
      img.classList.remove("animate__animated", "animate__zoomIn");
    }

    setTimeout(animate, 16);

    function animate() {
      title.innerText = roomTitles[roomInfoCount];
      info.innerText = roomInfos[roomInfoCount];
      floor.innerText = roomFloors[roomInfoCount];
      capacity.innerText = roomCapacity[roomInfoCount];
      size.innerText = roomCapacity[roomInfoCount];
      img.src = `./assets/images/${roomImges[roomInfoCount]}.jpg`;
      content.classList.add("animate__animated", "animate__zoomIn");
      img.classList.add("animate__animated", "animate__zoomIn");
    }
  };
}

init();
roomInfo();
