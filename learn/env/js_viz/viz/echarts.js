d3.csv("/data/County_Health_Rankings.csv").then(data => {
    const chart = echarts.init(document.getElementById('echarts-viz'));
    
    // Filter and process data
    const usData = data.filter(d => d.State === "US");
    const years = usData.map(d => d["Year span"]);
    const rates = usData.map(d => parseFloat(d["Raw value"]));
    const lowerBounds = usData.map(d => parseFloat(d["Confidence Interval Lower Bound"] || 0));
    const upperBounds = usData.map(d => parseFloat(d["Confidence Interval Upper Bound"] || 0));

    const option = {
        title: {
            text: 'US Violent Crime Rate Analysis',
            left: 'center',
            top: 10
        },
        tooltip: {
            trigger: 'axis',
            formatter: function(params) {
                const rate = params[0].value;
                return `${params[0].name}<br/>
                        Crime Rate: ${rate.toFixed(2)}`;
            }
        },
        grid: {
            left: '5%',
            right: '5%',
            bottom: '15%',
            top: '15%',
            containLabel: true
        },
        xAxis: {
            type: 'category',
            data: years,
            axisLabel: {
                rotate: 45
            }
        },
        yAxis: {
            type: 'value',
            name: 'Violent Crime Rate',
            nameLocation: 'middle',
            nameGap: 50,
            min: function(value) {
                return Math.floor(value.min * 0.9);
            }
        },
        series: [{
            name: 'Crime Rate',
            type: 'line',
            data: rates,
            symbolSize: 8,
            itemStyle: {
                color: '#5470c6'
            },
            areaStyle: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: 'rgba(84,112,198,0.5)'
                }, {
                    offset: 1,
                    color: 'rgba(84,112,198,0.1)'
                }])
            }
        }],
        toolbox: {
            feature: {
                saveAsImage: {},
                dataZoom: {},
                restore: {}
            },
            right: 20,
            top: 20
        },
        dataZoom: [{
            type: 'inside',
            start: 0,
            end: 100
        }, {
            type: 'slider',
            start: 0,
            end: 100
        }]
    };

    // Handle window resize
    window.addEventListener('resize', () => {
        chart.resize();
    });

    chart.setOption(option);
});