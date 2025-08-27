/* When the user scrolls down, hide the navbar. When the user scrolls up, show the navbar. From W3 schools*/
var prevScrollpos = window.pageYOffset;
window.onscroll = function () {
  var currentScrollPos = window.pageYOffset;
  if (prevScrollpos > currentScrollPos) {
    if (window.innerWidth > 575) {
      document.getElementById("navbar").style.top = "0";
    } else if (window.pageYOffset < 150) {
      document.getElementById("navbar").style.top = "0";
    }
  } else {
    document.getElementById("navbar").style.top = "-277px";
  }
  prevScrollpos = currentScrollPos;
};

function openNav() {
  document.getElementById("navbar").style.top = "0";
}
