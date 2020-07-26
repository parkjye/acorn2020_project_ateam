// // nav var관련
// function hoverClassImg() {
//   document.documentElement.querySelectorAll(".room__rows").forEach((item, index) => {
//     item.addEventListener("mouseover", floatingTitle);
//     item.addEventListener("mouseout", hiddenTitle);
//   });
// }
// //
// function floatingTitle(e) {
//   let title = e.target;
//   if (e.target.nodeName === "IMG") {
//     title = title.nextSibling.nextSibling;
//     title.classList.add("view");
//     title.classList.add("animate__animated", "animate__fadeIn");
//   } else {
//     title.classList.add("view");
//     title.classList.add("animate__animated", "animate__fadeIn");
//   }
// }
// function hiddenTitle(e) {
//   let title = e.target;
//   if (e.target.nodeName === "IMG") {
//     title = title.nextSibling.nextSibling;
//     title.classList.remove("view");
//     title.classList.remove("animate__animated", "animate__fadeIn");
//   } else {
//     title.classList.remove("view");
//     title.classList.remove("animate__animated", "animate__fadeIn");
//   }
// }
//hoverClassImg();

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
    navbar.classList.remove("navbar--transparent");
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
    navbar.classList.add("navbar--transparent");
    document.querySelector(".navbar__logo").childNodes[1].classList.remove("white");

    const a = document.querySelectorAll(".navbar__menu__item").forEach((item) => {
      item.classList.remove("white");
      item.childNodes[1].childNodes[1].classList.remove("white");
      item.childNodes[1].childNodes[4].classList.remove("white");
    });
  }
});
