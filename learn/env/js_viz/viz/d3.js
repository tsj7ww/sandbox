d3.csv("/data/County_Health_Rankings.csv").then(data => {
    // Filter for US data only
    const usData = data.filter(d => d.State === "US");
    
    const margin = {top: 40, right: 30, bottom: 50, left: 60};
    const width = document.getElementById('d3-viz').clientWidth - margin.left - margin.right;
    const height = 300 - margin.top - margin.bottom;

    const svg = d3.select("#d3-viz")
        .append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform", `translate(${margin.left},${margin.top})`);

    // Parse data
    const parseYear = d => d["Year span"].split("-")[0];
    const parseRate = d => parseFloat(d["Raw value"]);

    // Create scales
    const x = d3.scaleTime()
        .domain(d3.extent(usData, d => new Date(parseYear(d), 0)))
        .range([0, width]);

    const y = d3.scaleLinear()
        .domain([0, d3.max(usData, d => parseRate(d))])
        .range([height, 0]);

    // Add line
    const line = d3.line()
        .x(d => x(new Date(parseYear(d), 0)))
        .y(d => y(parseRate(d)));

    svg.append("path")
        .datum(usData)
        .attr("fill", "none")
        .attr("stroke", "steelblue")
        .attr("stroke-width", 2)
        .attr("d", line);

    // Add axes
    svg.append("g")
        .attr("transform", `translate(0,${height})`)
        .call(d3.axisBottom(x))
        .selectAll("text")
        .style("text-anchor", "end")
        .attr("dx", "-.8em")
        .attr("dy", ".15em")
        .attr("transform", "rotate(-45)");

    svg.append("g")
        .call(d3.axisLeft(y));

    // Add title
    svg.append("text")
        .attr("x", width / 2)
        .attr("y", -margin.top / 2)
        .attr("text-anchor", "middle")
        .style("font-size", "16px")
        .text("US Violent Crime Rate Trend");

    // Add axis labels
    svg.append("text")
        .attr("transform", "rotate(-90)")
        .attr("y", -margin.left)
        .attr("x", -height / 2)
        .attr("dy", "1em")
        .style("text-anchor", "middle")
        .text("Violent Crime Rate");
});