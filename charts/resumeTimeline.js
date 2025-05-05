function formatDate(date) {
  return d3.timeFormat("%B %Y")(date);
}

function resumeTimeline() {
  // DATA
  var timelineData = [
    {
      image: "img/graduation-cap-solid.svg",
      times: [
        {
          id: 1,
          label: "Certificate IV Business",
          startDate: new Date(2011, 3, 1),
          endDate: new Date(2012, 9, 29),
        },
        {
          id: 2,
          label: "Diploma of Laboratory Technology",
          startDate: new Date(2015, 1, 1),
          endDate: new Date(2016, 11, 1),
        },
        {
          id: 3,
          label: "Bachelor of Computer Science",
          startDate: new Date(2019, 7, 1),
          endDate: new Date(2023, 10, 1),
        },
      ],
    },
    {
      image: "img/briefcase-solid.svg",
      times: [
        {
          id: 4,
          label: "Sales and Marketing Assistant, Eagle Lighting Australia",
          startDate: new Date(2011, 3, 1),
          endDate: new Date(2014, 9, 1),
        },
        {
          id: 5,
          label: "Pizza Delivery Driver, Batman Pizza",
          startDate: new Date(2015, 1, 1),
          endDate: new Date(2017, 11, 1),
        },
        {
          id: 6,
          label: "Laboratory Assistant, Dorevitch Pathology",
          startDate: new Date(2017, 5, 1),
          endDate: new Date(2019, 2, 1),
        },
        {
          id: 7,
          label:
            "Volunteer Team Leader/Founder, Melbourne Science & Tech Group",
          startDate: new Date(2018, 7, 1),
          endDate: new Date(2019, 5, 1),
        },
        {
          id: 8,
          label: "Laboratory Assistant, Australian Clinical Labs",
          startDate: new Date(2019, 2, 2),
          endDate: new Date(2019, 5, 1),
        },
        {
          id: 9,
          label: "Information Officer/Office Administrator, Emerge Australia",
          startDate: new Date(2020, 2, 1),
          endDate: new Date(2021, 1, 1),
        },
        {
          id: 10,
          label: "Dogwalker & Pet Sitter/DoorDasher",
          startDate: new Date(2021, 2, 1),
          endDate: new Date(2023, 9, 1),
        },
        {
          id: 11,
          label: "Junior Business Analyst, CTB AND CO.",
          startDate: new Date(2023, 9, 1),
          endDate: new Date(),
        },
      ],
    },
  ];

  // CHART SETUP
  var fileToLoad = "description/11.html";
  $("#includeHtml").load(fileToLoad);
  var activeClicked = null;
  var primaryColor = "#1dbedd";
  var showTextBlock = 11;

  var chart = document.getElementById("resumeTimeline");
  var margin = { top: 20, right: 30, bottom: 50, left: 50 },
    width = 800 - margin.left - margin.right,
    height = 150 - margin.top - margin.bottom;

  var svg = d3
    .select(chart)
    .append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
    .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

  // X AXIS SCALE
  var allTimes = [].concat(...timelineData.map((d) => d.times));
  //var scaleStartDate = d3.min(allTimes, (d) => d.startDate);
  var scaleStartDate = new Date(2010, 0, 1);
  var scaleEndDate = new Date(2026, 0, 1);

  var xScale = d3
    .scaleTime()
    .domain([scaleStartDate, scaleEndDate])
    .range([0, width]);

  // Y AXIS SCALE
  var yScale = d3
    .scaleBand()
    .domain(timelineData.map((d) => d.image))
    .range([0, height]);

  // PLOT X AXIS
  var xAxis = d3.axisTop(xScale).ticks(6).tickFormat(d3.timeFormat("%Y"));
  svg
    .append("g")
    .attr("transform", "translate(0," + margin.top + ")")
    .attr("stroke-width", 2)
    .call(xAxis);

  // PLOT Y AXIS
  groups = svg
    .selectAll(".group")
    .data(timelineData)
    .enter()
    .append("g")
    .attr("class", "group")
    .attr("transform", (d) => "translate(0," + yScale(d.image) + ")");

  // X AXIS LABELS
  svg
    .selectAll("text")
    .attr("class", "x-axis-label")
    .style("font", "18px Open Sans")
    .style("fill", "black");

  // Y AXIS LABELS
  svg
    .selectAll(".image")
    .data(timelineData)
    .enter()
    .append("image")
    .attr("class", "image")
    .attr("xlink:href", (d) => d.image)
    .attr("x", -50)
    .attr("y", (d) => yScale(d.image) + 34)
    .attr("width", 30)
    .attr("height", 30);

  // TOOLTIP
  var myTooltip = d3
    .select(chart)
    .append("div")
    .style("opacity", 0)
    .attr("class", "tooltip")
    .style("position", "absolute")
    .style("text-anchor", "middle")
    .style("text-align", "middle");

  // TIMELINES
  // Outlines
  groups
    .selectAll(".timelines")
    .data((d) => d.times)
    .enter()
    .append("line")
    .attr("class", "outlines")
    .attr("id", (d) => "outline-" + d.id)
    .attr("x1", (d) => xScale(d.startDate) + 20)
    .attr("y1", () => {
      return margin.top + 30;
    })
    .attr("x2", (d) => xScale(d.endDate))
    .attr("y2", () => {
      return margin.top + 30;
    })
    .attr("stroke-linecap", "round")
    .attr("stroke-width", 27)
    .attr("stroke", "black")
    .attr("opacity", 1)
    .attr("visibility", "hidden");

  d3.select("#outline-11").attr("visibility", "visible");

  // Timelines
  groups
    .selectAll(".timelines")
    .data((d) => d.times)
    .enter()
    .append("line")
    .attr("class", "timelines")
    .attr("id", (d) => "timeline-" + d.id)
    .attr("x1", (d) => xScale(d.startDate) + 20)
    .attr("y1", () => {
      return margin.top + 30;
    })
    .attr("x2", (d) => xScale(d.endDate))
    .attr("y2", () => {
      return margin.top + 30;
    })
    .attr("stroke-linecap", "round")
    .attr("stroke-width", 20)
    .attr("stroke", primaryColor)
    .attr("opacity", 0.5)
    .on("mouseover", function (event, d) {
      d3.select(this).attr("opacity", 1);
      d3.select(this).attr("stroke-width", 23);
      d3.select(this).attr("stroke", primaryColor);
      myTooltip.transition().duration(200).style("opacity", 1);
      if (d.id == 11) {
        myTooltip.html(
          `<strong>${d.label}</strong><br>
          <strong>Start:</strong> ${formatDate(d.startDate)}<br>
           <strong>End:</strong> Present`
        );
      } else {
        myTooltip.html(
          `<strong>${d.label}</strong><br>
          <strong>Start:</strong> ${formatDate(d.startDate)}<br>
           <strong>End:</strong> ${formatDate(d.endDate)}`
        );
      }
    })
    .on("mousemove", function (event) {
      myTooltip
        .style("left", event.pageX + 10 + "px")
        .style("top", event.pageY + 10 + "px");
    })
    .on("mouseout", function () {
      if (this !== activeClicked) {
        d3.select(this)
          .attr("opacity", 0.5)
          .attr("stroke-width", 20)
          .attr("stroke", primaryColor);
      }
      myTooltip.transition().duration(200).style("opacity", 0);
    })
    .on("click", function (event, d) {
      d3.selectAll(".timelines").attr("opacity", 0.5).attr("stroke-width", 20);
      d3.selectAll(".outlines").attr("visibility", "hidden");

      activeClicked = this;
      showTextBlock = d.id;

      d3.select(this).attr("stroke-width", 23).attr("opacity", 1);

      d3.select("#outline-" + d.id).attr("visibility", "visible");

      console.log(d);

      fileToLoad = "description/" + d.id + ".html";
      $("#includeHtml").load(fileToLoad);
    });
  d3.select("#timeline-11").attr("stroke-width", 23).attr("opacity", 1);
  activeClicked = d3.select("#timeline-11").node();
}

function init() {
  resumeTimeline();
}

window.onload = init;
