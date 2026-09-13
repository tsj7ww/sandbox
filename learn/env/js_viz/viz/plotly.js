d3.csv("/data/County_Health_Rankings.csv").then(data => {
    const stateData = data.filter(d => ["US", "AL"].includes(d.State));
    
    const traces = ["US", "AL"].map(state => ({
        name: state === "US" ? "United States" : state,
        x: stateData.filter(d => d.State === state).map(d => d["Year span"]),
        y: stateData.filter(d => d.State === state).map(d => d["Raw value"]),
        type: 'scatter',
        mode: 'lines+markers',
        line: {
            width: 2
        },
        marker: {
            size: 6
        }
    }));

    const layout = {
        title: {
            text: 'Violent Crime Rate Trends',
            y: 0.95,
            x: 0.5,
            xanchor: 'center',
            yanchor: 'top'
        },
        margin: {
            l: 60,
            r: 30,
            t: 80,
            b: 60
        },
        xaxis: {
            title: 'Year Span',
            tickangle: 45
        },
        yaxis: {
            title: 'Violent Crime Rate',
            zeroline: false
        },
        showlegend: true,
        legend: {
            x: 1,
            xanchor: 'right',
            y: 1
        },
        autosize: true,
        height: 350
    };

    const config = {
        responsive: true,
        displayModeBar: true,
        displaylogo: false
    };

    Plotly.newPlot('plotly-viz', traces, layout, config);
});