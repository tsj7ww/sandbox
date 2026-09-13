d3.csv("/data/County_Health_Rankings.csv").then(data => {
    // Filter for specific states
    const stateData = data.filter(d => ["US", "AL"].includes(d.State));
    
    const ctx = document.getElementById('chartjs-canvas').getContext('2d');
    
    const datasets = [];
    const states = [...new Set(stateData.map(d => d.State))];
    
    states.forEach(state => {
        const statePoints = stateData.filter(d => d.State === state);
        datasets.push({
            label: state === "US" ? "United States" : state,
            data: statePoints.map(d => ({
                x: d["Year span"].split("-")[0],
                y: parseFloat(d["Raw value"])
            })),
            borderColor: state === "US" ? "#1f77b4" : "#ff7f0e",
            fill: false,
            tension: 0.1
        });
    });

    new Chart(ctx, {
        type: 'line',
        data: {
            datasets: datasets
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                title: {
                    display: true,
                    text: 'Violent Crime Rate Comparison',
                    padding: 20
                },
                legend: {
                    position: 'top'
                }
            },
            scales: {
                x: {
                    type: 'category',
                    title: {
                        display: true,
                        text: 'Year'
                    }
                },
                y: {
                    title: {
                        display: true,
                        text: 'Violent Crime Rate'
                    },
                    beginAtZero: true
                }
            }
        }
    });
});