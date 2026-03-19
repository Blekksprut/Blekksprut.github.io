// Fetch the navigation component
document.addEventListener("DOMContentLoaded", () => {
  fetch("/nav.html")
    .then((response) => {
      if (!response.ok) {
        throw new Error(`Failed to load nav: ${response.status}`);
      }
      return response.text();
    })
    .then((navHTML) => {
      const placeholder = document.getElementById("navbar-placeholder");

      if (!placeholder) {
        throw new Error("Navbar placeholder not found in DOM");
      }

      placeholder.innerHTML = navHTML;
      initNavbar();
    })
    .catch((error) => {
      console.error("Error loading navigation:", error);
    });
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
  const currentPath = window.location.pathname;

  document.querySelectorAll(".nav-link, .dropdown-item").forEach((link) => {
    const href = link.getAttribute("href");

    // Ignore dropdown toggles or invalid links
    if (!href || href === "#") return;

    if (new URL(link.href).pathname === currentPath) {
      link.classList.add("active");

      // Activate parent dropdown if child matches
      const dropdown = link.closest(".dropdown");
      if (dropdown) {
        dropdown.querySelector(".nav-link").classList.add("active");
      }
    }
  });
}
