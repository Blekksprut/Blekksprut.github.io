// Fetch the navigation component
fetch("/nav.html")
  .then((response) => {
    // Check if the request was successful
    if (!response.ok) {
      throw new Error(`Failed to load nav: ${response.status}`);
    }
    return response.text(); // Convert response to text
  })
  .then((navHTML) => {
    // Insert the navigation HTML into the placeholder
    document.getElementById("navbar-placeholder").innerHTML = navHTML;
    initNavbar();
  })
  .catch((error) => {
    // Log errors (e.g., if nav.html is missing)
    console.error("Error loading navigation:", error);
  });

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

//set the nav item as active on click
function initNavbar() {
  document.querySelectorAll(".nav-link").forEach((link) => {
    if (link.href === window.location.href) {
      link.classList.add("active");
    }
  });
}
