function loadWordList() {
  d3.csv("/data/word-data.csv")
    .then(function (dataset) {
      displayWords(dataset);
    })
    .catch(function (error) {
      console.log(error);
    });
}

function displayWords(dataset) {
  for (let i = 0; i < dataset.length; i++) {
    const div = document.createElement("div");
    div.innerHTML = `<h5 class=".card-title">${dataset[i].word}</h5><h6 class=".card-subtitle mb-2 text-muted">${dataset[i].part}</h6><p class=".card-text">${dataset[i].definition}</p>`;
    div.className =
      "wordCards card border-light shadow-sm p-3 mb-3 bg-white rounded";
    document.getElementById("cardsContainer").appendChild(div);
  }
}

function filterCards() {
  const searchTerm = document.getElementById("searchTerm").value.toLowerCase();

  const cards = document.querySelectorAll(".wordCards");

  cards.forEach((card) => {
    const cardText = card.textContent.toLowerCase();

    if (cardText.includes(searchTerm)) {
      card.style.display = "";
    } else {
      card.style.display = "none";
    }
  });
}

function init() {
  loadWordList();
  document.getElementById("searchTerm").addEventListener("input", filterCards);
}

window.onload = init;
