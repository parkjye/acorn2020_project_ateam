function hoverClassImg() {
  document.documentElement.querySelectorAll(".room__rows").forEach((item, index) => {
    // console.log(item);
    item.addEventListener("mouseover", floatingTitle);
    item.addEventListener("mouseout", hiddenTitle);
  });
}

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
document.addEventListener("scroll", () => {
  let y = window.scrollY;
  if (y > navbarHeight) {
    navbar.classList.add("navbar--dark");
    document.querySelector(".navbar__logo").childNodes[1].classList.add("white");

    const a = document.querySelectorAll(".navbar__menu__item").forEach((item) => {
      item.classList.add("white");
      item.childNodes[1].classList.add("white");
      item.childNodes[4].classList.add("white");
    });
  } else {
    navbar.classList.remove("navbar--dark");
    document.querySelector(".navbar__logo").childNodes[1].classList.remove("white");

    const a = document.querySelectorAll(".navbar__menu__item").forEach((item) => {
      item.classList.remove("white");
      item.childNodes[1].classList.remove("white");
      item.childNodes[4].classList.remove("white");
    });
  }
});
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
  window.addEventListener("load", () => {
    scrollTo(document.getElementsByTagName("body")[0], "up");
  });
}

hoverClassImg();
init();
