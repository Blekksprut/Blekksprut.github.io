// Calculate how long I have been at CTB AND CO!
function calculateTimeAtCTB() {
  let startDate = new Date("2023-10-09");
  let currentDate = new Date();
  let timeDifference = currentDate - startDate;
  let timeDifferenceDays = Math.round(timeDifference / (1000 * 3600 * 24));
  let years = Math.floor(timeDifferenceDays / 365);
  let days = timeDifferenceDays % 365;
  document.getElementById(
    "time-at-ctb"
  ).innerHTML = `${years} year and ${days} days`;
}

onload = calculateTimeAtCTB;
