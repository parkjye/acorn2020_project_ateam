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

hoverClassImg();
