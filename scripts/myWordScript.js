/* PROCESS
1. I enter word with my details and runQuery = 1 into word-data.csv using github mobile
2. On load of page, for each item in dataset, if runQuery == 1 then query API for details
3. In the CSV Data text box, the runQuery field data will be replaced with 0 and the other API relevant fields will be replaced with API data if exists
4. I copy text from CSV Data text box to get API details, and paste into word-data.csv using github mobile
5. Now on load of page it will not query the new row anymore and I will have API data stored in csv
*/

function loadWordList() {
  d3.csv("/data/word-data.csv")
    .then(function (dataset) {
      prepareData(dataset);
    })
    .catch(function (error) {
      console.log(error);
    });
}

async function queryTwinWordAPI(word) {
  try {
    const [definition, difficulty, synonyms] = await Promise.all([
      fetch(
        `https://mywords-proxy-api.vercel.app/api/definition?entry=${word}`,
      ).then((response) => response.json()),
      fetch(
        `https://mywords-proxy-api.vercel.app/api/difficulty?entry=${word}`,
      ).then((response) => response.json()),
      fetch(
        `https://mywords-proxy-api.vercel.app/api/reference?entry=${word}`,
      ).then((response) => response.json()),
    ]);
    //does word match response word?
    return [definition, difficulty, synonyms];
  } catch (error) {
    console.log("Error:", error);
  }
}

function cleanDefinition(definition) {
  // get rid of double quotes, redundant words, and newlines
  return definition
    .substring(6)
    .replace(/\(nou\)|\(vrb\)|\(adj\)|\(adv\)|&quot;/gm, " ")
    .replace(/,|[\r\n]+/gm, ".");
}

function cleanAPIResult(APIResult, originalDatasetRow) {
  // initialise variables
  var newDefinition = [];
  var newPart = [];
  var newDifficulty = "";
  var newSynonyms = "";
  var cleanedDatasetRow = {};

  if (APIResult[0].meaning.noun != "") {
    newPart.push("noun");
    newDefinition.push(cleanDefinition(APIResult[0].meaning.noun));
  }
  if (APIResult[0].meaning.verb != "") {
    newPart.push("verb");
    newDefinition.push(cleanDefinition(APIResult[0].meaning.verb));
  }
  if (APIResult[0].meaning.adverb != "") {
    newPart.push("adverb");
    newDefinition.push(cleanDefinition(APIResult[0].meaning.adverb));
  }
  if (APIResult[0].meaning.adjective != "") {
    newPart.push("adjective");
    newDefinition.push(cleanDefinition(APIResult[0].meaning.adjective));
  }

  newDifficulty = APIResult[1].ten_degree;
  newSynonyms =
    APIResult[2].relation.broad_terms +
    ", " +
    APIResult[2].relation.related_terms +
    ", " +
    APIResult[2].relation.synonyms;

  for (let i = 0; i < newSynonyms.length; i++) {
    newSynonyms[i].trim();
  }

  return (cleanedDatasetRow = {
    runQuery: "0",
    word: originalDatasetRow.word,
    definition: newDefinition,
    synonyms: newSynonyms,
    part: newPart,
    dateEncountered: originalDatasetRow.dateEncountered,
    isMemorised: originalDatasetRow.isMemorised,
    sourceDetail: originalDatasetRow.sourceDetail,
    sourceType: originalDatasetRow.sourceType,
    difficulty: newDifficulty,
  });
}

function displayHistogram(difficultyArr) {
  var chart = document.getElementById("histogramCard");

  min = 1;
  max = 10;
  domain = [min, max];

  var margin = { top: 5, right: 30, bottom: 20, left: 10 },
    width = 200 - margin.left - margin.right,
    height = 150 - margin.top - margin.bottom;

  // The number of bins
  Nbin = 10;

  var x = d3.scaleLinear().domain(domain).range([0, width]);

  var histogram = d3
    .histogram()
    .domain(x.domain()) // then the domain of the graphic
    .thresholds(x.ticks(Nbin)); // then the numbers of bins

  // And apply this function to data to get the bins
  var bins = histogram(difficultyArr);

  var svg = d3
    .select(chart)
    .append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
    .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

  svg
    .append("g")
    .attr("transform", "translate(0," + height + ")")
    .call(d3.axisBottom(x));

  var y = d3
    .scaleLinear()
    .range([height, 0])
    .domain([
      0,
      d3.max(bins, function (d) {
        return d.length;
      }),
    ]);

  svg
    .selectAll("rect")
    .data(bins)
    .enter()
    .append("rect")
    .attr("x", 1)
    .attr("transform", function (d) {
      return "translate(" + x(d.x0) + "," + y(d.length) + ")";
    })
    .attr("width", function (d) {
      return x(d.x1) - x(d.x0) - 1;
    })
    .attr("height", function (d) {
      return height - y(d.length);
    })
    .style("fill", "#1dbedd");
}

function displayProgress(memorisedCount, datasetLength) {
  // reference https://d3-graph-gallery.com/graph/donut_label.html
  // set the dimensions and margins of the graph
  const progWidth = 150,
    progHeight = 150,
    progMargin = 10;

  // Calculate percentage of words memorised
  var percentageMemorised = Math.round((memorisedCount / datasetLength) * 100);
  const progressData = {
    a: percentageMemorised,
    b: 100 - percentageMemorised,
  };

  // The radius of the pieplot is half the width or half the height (smallest one). I subtract a bit of margin.
  const radius = Math.min(progWidth, progHeight) / 2 - progMargin;

  const progressChart = document.getElementById("progressCard");

  // append the svg object to the div
  const progSvg = d3
    .select(progressChart)
    .append("svg")
    .attr("width", progWidth)
    .attr("height", progHeight)
    .append("g")
    .attr("transform", `translate(${progWidth / 2},${progHeight / 2})`);

  // set the color scale
  const color = d3.scaleOrdinal().range(["#1dbedd", "#ccc"]);

  // Compute the position of each group on the pie
  const pie = d3.pie().value((d) => d[1]);

  const data_ready = pie(Object.entries(progressData));

  // Build the pie chart
  progSvg
    .selectAll("progress")
    .data(data_ready)
    .join("path")
    .attr(
      "d",
      d3
        .arc()
        .innerRadius(45) // size of donut hole
        .outerRadius(radius),
    )
    .attr("fill", (d) => color(d.data[0]))
    .style("opacity", 0.7);

  progSvg
    .append("text")
    .attr("x", 0)
    .attr("y", 0)
    .attr("text-anchor", "middle")
    .attr("dominant-baseline", "middle")
    .style("font-size", "28px")
    .style("font-weight", "bold")
    .text(progressData.a + "%");
}

function displayDifficultyGauge(difficulty) {
  // reference https://medium.com/d3-datavisualization-examples/gauge-chart-reuable-code-using-d3-js-be706e62f88
  // and chatgpt
  const gaugeWidth = 180;
  const gaugeHeight = 150;
  const innerRadius = 45;
  const outerRadius = 80;
  const needleRadius = 4;
  const needleHeight = outerRadius;

  const difficultyGauge = document.getElementById("difficultyGauge");

  // Clear previous gauge if re-rendering
  d3.select(difficultyGauge).selectAll("*").remove();

  const svg = d3
    .select(difficultyGauge)
    .append("svg")
    .attr("width", gaugeWidth)
    .attr("height", gaugeHeight)
    .append("g")
    .attr("transform", `translate(${gaugeWidth / 2 - 5}, ${outerRadius + 20})`);

  //  ARC
  const arc = d3
    .arc()
    .innerRadius(innerRadius)
    .outerRadius(outerRadius)
    .startAngle(-Math.PI / 2)
    .endAngle(Math.PI / 2);

  const arcGenerator = d3
    .arc()
    .innerRadius(innerRadius)
    .outerRadius(outerRadius);

  const segments = [
    { start: -Math.PI / 2, end: -Math.PI / 6, color: "#ffe063" },
    { start: -Math.PI / 6, end: Math.PI / 6, color: "#ffa353" },
    { start: Math.PI / 6, end: Math.PI / 2, color: "#ff6f5f" },
  ];

  svg
    .selectAll(".gauge-segment")
    .data(segments)
    .enter()
    .append("path")
    .attr("class", "gauge-segment")
    .attr("d", (d) =>
      arcGenerator({
        startAngle: d.start,
        endAngle: d.end,
      }),
    )
    .attr("fill", (d) => d.color);

  //  NEEDLE
  const needleGroup = svg.append("g").attr("class", "needle");

  needleGroup
    .append("circle")
    .attr("r", needleRadius + 2)
    .attr("fill", "black");

  const needlePath = needleGroup.append("path");

  // Convert percent (0–1) to radians (-90° to +90°)
  // Convert difficulty (0–10) to angle in radians
  const scoreToRadians = (d) => (d - 5) * (Math.PI / 10);

  const theta = scoreToRadians(difficulty);

  const topX = needleHeight * Math.sin(theta);
  const topY = -needleHeight * Math.cos(theta);

  const leftX = needleRadius * Math.sin(theta - Math.PI / 2);
  const leftY = -needleRadius * Math.cos(theta - Math.PI / 2);

  const rightX = needleRadius * Math.sin(theta + Math.PI / 2);
  const rightY = -needleRadius * Math.cos(theta + Math.PI / 2);

  needlePath.attr(
    "d",
    `M ${leftX} ${leftY} L ${topX} ${topY} L ${rightX} ${rightY}`,
  );

  //  PERCENT LABEL AT NEEDLE TIP
  svg
    .append("text")
    .attr("x", topX * 1.2) // slightly beyond needle tip
    .attr("y", topY * 1.2)
    .attr("text-anchor", "middle")
    .attr("dominant-baseline", "middle")
    .style("font-size", "14px")
    .style("font-weight", "bold")
    .text(difficulty);
}

function displayTotalWords(datasetLength) {
  // get total words element and put value into it
  var totalWordsElement = document.getElementById("totalWords");
  totalWordsElement.innerHTML = datasetLength;
}

async function prepareData(dataset) {
  // get csv data element and put data headers in element
  var csvDataElement = document.getElementById("csvData");
  csvDataElement.value = `runQuery,word,definition,synonyms,part,sourceType,sourceDetail,dateEncountered,isMemorised,difficulty\n`;

  var memorisedCounter = 0;
  var difficultySum = 0;
  var difficultyArr = [];
  for (let i = 0; i < dataset.length; i++) {
    // update row with api data if runQuery == 1
    if (dataset[i].runQuery == 1) {
      const APIResult = await queryTwinWordAPI(dataset[i].word);
      if (APIResult[0].result_code == "200") {
        var cleanedDatasetRow = cleanAPIResult(APIResult, dataset[i]);
        dataset[i] = cleanedDatasetRow;
      }
    }

    var icon = "";
    if (dataset[i].isMemorised == "TRUE") {
      icon = "<i class='fa-solid fa-circle-check' style='color: #63E6BE;'></i>";
      memorisedCounter++;
    } else {
      icon = "<i class='fa-solid fa-circle-xmark' style='color: #ff7d7d;'></i>";
    }

    // Put div structure and word title onto cards
    const cardDiv = document.createElement("div");
    cardDiv.innerHTML = `<div class="row justify-content-between"><h3 class=".card-title col-md-6 col-sm-12">${dataset[i].word}</h3>
    <h6 class="col-md-6 col-sm-12 text-end">
    <span class="me-1">MEMORISED ${icon}</span> 
    DIFFICULTY <span id="difficultyCard${i}" class="badge bg-light text-dark"></span></h6>
    </div>
    
    <div"><h6 id="partCard${i}" class=".card-subtitle mb-2 text-muted col-5"></h6></div>

    <p class=".card-text" id="definitionCard${i}"></p>
    <div class="mb-3">
      <button class="btn" type="button" data-bs-toggle="collapse" data-bs-target="#moreDetails${i}" aria-expanded="false" aria-controls="moreDetails${i}">
      Additional Details
      </button>
    </div>
    <div class="collapse ms-3" id="moreDetails${i}">
      <div>
        <h6>WORD SOURCE</h6><p id="wordSourceCard${i}" class=".card-text ms-2"></p>
      </div>
      <h6 id="synonymTitle${i}"></h6><div id="synonymList${i}"></div>
    </div>`;
    cardDiv.className =
      "wordCards card border-light shadow-sm p-3 mb-3 bg-white rounded";
    document.getElementById("cardsContainer").appendChild(cardDiv);

    //Put part/s and definitions onto cards
    if (!Array.isArray(dataset[i].part)) {
      // If there's a comma that means there are multiple and they need to be transformed into array split by comma
      dataset[i].definition = dataset[i].definition.split(",");
      dataset[i].part = dataset[i].part.split(",");
    }

    if (Array.isArray(dataset[i].part) && dataset[i].part.length > 1) {
      const card = document.getElementById(`definitionCard${i}`);
      card.innerHTML = "";
      for (let j = 0; j < dataset[i].part.length; j++) {
        const partDiv = document.createElement("div");
        const definitionDiv = document.createElement("div");
        partDiv.className = "card-subtitle mb-2 text-muted col-5";
        definitionDiv.className = ".card-text";

        partDiv.innerHTML = `<h6>${dataset[i].part[j]}.</h6>`;
        definitionDiv.innerHTML = `<p>${dataset[i].definition[j]}</p>`;

        card.appendChild(partDiv);
        card.appendChild(definitionDiv);
      }
    } else {
      // if still not an array then just put the text in directly
      document.getElementById(`partCard${i}`).innerHTML = `${dataset[i].part}.`;
      document.getElementById(`definitionCard${i}`).innerHTML =
        dataset[i].definition;
    }

    // Put difficulty onto cards
    if (
      (typeof dataset[i].difficulty === "string" &&
        dataset[i].difficulty.includes("undefined")) ||
      dataset[i].difficulty == null
    ) {
      document.getElementById(`difficultyCard${i}`).innerHTML = "-";
    } else {
      document.getElementById(`difficultyCard${i}`).innerHTML =
        dataset[i].difficulty;
      difficultySum += parseFloat(dataset[i].difficulty);
      difficultyArr.push(parseFloat(dataset[i].difficulty));
    }

    // Put word source onto cards
    document.getElementById(`wordSourceCard${i}`).innerHTML =
      `${dataset[i].sourceType}, ${dataset[i].sourceDetail}`;

    // Put synonyms onto cards if they exist
    var wordSynonyms = dataset[i].synonyms;
    var wordSynonymsArray = wordSynonyms.match(/[^,\s][^,]*/g) || [];
    if (wordSynonymsArray.length > 1) {
      document.getElementById(`synonymTitle${i}`).innerHTML = "SYNONYMS";
      for (let j = 0; j < wordSynonymsArray.length; j++) {
        const divSynonymsList = document.createElement("div");
        divSynonymsList.innerHTML = `<span class="badge rounded-pill bg-light text-dark m-1">${wordSynonymsArray[j]}</span>`;
        divSynonymsList.className = "d-inline-block";
        document.getElementById(`synonymList${i}`).appendChild(divSynonymsList);
      }
    }
    // dump all the data into a text block in csv format
    csvDataElement.value += `0,${dataset[i].word},"${dataset[i].definition}","${dataset[i].synonyms}","${dataset[i].part}",${dataset[i].sourceType},${dataset[i].sourceDetail},${dataset[i].dateEncountered},${dataset[i].isMemorised},${dataset[i].difficulty}\n`;
  }
  displayProgress(memorisedCounter, dataset.length);
  displayHistogram(difficultyArr);
  displayDifficultyGauge((difficultySum / difficultyArr.length).toFixed(2));
  displayTotalWords(dataset.length);
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
