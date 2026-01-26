/**
 * Health Tracker - Daily Summary Email
 *
 * Sends a daily email containing:
 * 1. Threshold-based alerts and recommendations
 * 2. Summary table with color-coded trends
 * 3. Depression/Anxiety trend chart (dynamically generated)
 *
 * Setup:
 * 1. Update CONFIG with your email and spreadsheet ID
 * 2. Ensure "Summary" and "Calculations" sheets exist with expected data
 * 3. Run setupDailyTrigger() once to schedule daily emails at 9pm
 */

// ============================================================
// CONFIGURATION
// ============================================================

const CONFIG = {
  EMAIL_RECIPIENT: 'trevsjordan@gmail.com',
  SPREADSHEET_ID: '1j1okLCq45Euq6q5uqm_ZOIzKtGYy-NHub3Uc0lrnDVY',
  SHEET_NAME: 'Summary',
  TABLE_RANGE: 'A7:K15',
  CALCULATIONS_SHEET: 'Calculations',
  CHART_DAYS: 30,  // Number of recent days to show on chart (set to 91 for all data)
  TIMEZONE: 'America/New_York'
};

// ============================================================
// COPING TIPS & MOTIVATIONAL MESSAGES
// ============================================================

const motivational_quotes = [
    "Small steps forward are still progress. Try moving your body for just 10 minutes today.",
    "Your body is capable of amazing things. Give it the chance to show you.",
    "Energy creates energy - a short walk now can boost your mood for hours.",
    "You don't have to be perfect. Just aim to be a little better than yesterday.",
    "Rest is productive too, but gentle movement can restore what rest alone cannot.",
    "Every step counts. Start with one, and the next will come easier.",
    "Your future self will thank you for the small healthy choices you make today.",
    "Movement is medicine. Even 5 minutes of stretching can shift your entire day."
];

const depression_coping_tips = [
    "Try reaching out to one person today, even just a simple text can help you feel connected.",
    "Consider doing one small task you've been putting off - accomplishment builds momentum.",
    "Spend a few minutes outside if possible. Natural light can help regulate your mood.",
    "Be gentle with yourself today. You're doing better than you think.",
    "Try writing down three things that went okay today, no matter how small.",
    "Physical movement, even a short walk, can help shift your mental state.",
    "Remember: feelings are temporary visitors, not permanent residents.",
    "Consider calling a friend or loved one. Connection is powerful medicine.",
    "Do one kind thing for yourself today - you deserve the same compassion you'd give others.",
    "Focus on just the next hour. You don't have to solve everything at once."
];

const anxiety_coping_tips = [
    "Try the 5-4-3-2-1 grounding technique: notice 5 things you see, 4 you hear, 3 you can touch, 2 you smell, 1 you taste.",
    "Take 5 slow, deep breaths. Inhale for 4 counts, hold for 4, exhale for 6.",
    "Remember: anxiety lies. Most of what we worry about never actually happens.",
    "Try progressive muscle relaxation - tense and release each muscle group from your toes to your head.",
    "Step away from screens for 10 minutes and do something tactile like stretching or making tea.",
    "Write down your worries, then set them aside. Externalizing anxiety can reduce its power.",
    "Ask yourself: 'Will this matter in 5 years?' If not, try not to give it more than 5 minutes of worry.",
    "Go for a short walk - movement helps discharge anxious energy from your body.",
    "Limit caffeine today if possible - it can amplify anxious feelings.",
    "Try the 'worry time' technique: schedule 15 minutes later to worry, and postpone anxious thoughts until then."
];

const substance_use_coping_tips = [
    "Consider reaching out to your support network or sponsor today.",
    "Try the HALT check: Are you Hungry, Angry, Lonely, or Tired? Address those needs first.",
    "Replace the urge with a healthy alternative activity for just 15 minutes.",
    "Remember your reasons for wanting change. Write them down if it helps.",
    "Call someone who understands what you're going through - you don't have to face this alone.",
    "Focus on getting through just today. Tomorrow is a new opportunity.",
    "Try a brief mindfulness exercise to observe cravings without acting on them.",
    "Remove yourself from triggering environments if possible, even temporarily.",
    "Drink water and eat something nutritious - physical needs affect mental resilience.",
    "Remind yourself: cravings peak and pass. They rarely last more than 20-30 minutes."
];

const general_self_care_tips = [
    "Start with the basics: drink water, eat something nourishing, and take a few deep breaths.",
    "Try doing one small thing that usually brings you comfort or joy.",
    "Consider stepping outside for fresh air, even for just a few minutes.",
    "Reach out to someone you trust - connection can shift how you're feeling.",
    "Give yourself permission to rest without guilt. Recovery is not laziness.",
    "Try a brief body scan: notice where you're holding tension and consciously relax those areas.",
    "Do one thing at a time. Multitasking can increase stress and reduce effectiveness.",
    "Set a small, achievable goal for today. Accomplishment builds positive momentum.",
    "Practice self-compassion: speak to yourself the way you would to a good friend.",
    "Remember that difficult moments pass. You've gotten through hard times before."
];

// ============================================================
// ALERT THRESHOLDS
// ============================================================

const alert_thresholds = {
    overall_mood: {
        severe: [0, 35],
        warning: [36, 50],
        warn_message: general_self_care_tips
    },
    overall_basics: {
        severe: [0, 60],
        warning: [61, 80],
        warn_message: motivational_quotes
    },
    depression: {
        severe: [70, 100],
        warning: [50, 69],
        warn_message: depression_coping_tips
    },
    anxiety: {
        severe: [70, 100],
        warning: [50, 69],
        warn_message: anxiety_coping_tips
    },
    substance_use: {
        severe: [70, 100],
        warning: [50, 69],
        warn_message: substance_use_coping_tips
    },
    bipolar: {
        severe: [40, 100]
    },
    ptsd: {
        severe: [40, 100]
    },
    physical_activity: {
        warning: [0, 50],
        warn_message: motivational_quotes
    }
};

/**
 * Maps spreadsheet metric names to threshold keys
 */
const metricNameMap = {
  'Overall - Mood': 'overall_mood',
  'Overall - Basics': 'overall_basics',
  'Depression': 'depression',
  'Anxiety': 'anxiety',
  'Substance Use': 'substance_use',
  'Bipolar': 'bipolar',
  'PTSD': 'ptsd',
  'Physical Activity': 'physical_activity'
};

/**
 * Metrics where lower values indicate worse outcomes
 * (as opposed to depression/anxiety where higher is worse)
 */
const INVERTED_METRICS = ['overall_mood', 'overall_basics', 'physical_activity'];

/**
 * Critical mental health metrics that get priority sorting
 */
const CRITICAL_METRICS = ['depression', 'anxiety', 'bipolar', 'ptsd', 'substance_use'];

// ============================================================
// MAIN FUNCTION
// ============================================================

/**
 * Generates and sends the daily summary email
 */
function sendDailySummaryEmail() {
  const today = Utilities.formatDate(new Date(), CONFIG.TIMEZONE, 'yyyy-MM-dd');
  const sheet = SpreadsheetApp.openById(CONFIG.SPREADSHEET_ID).getSheetByName(CONFIG.SHEET_NAME);

  // Get table data and convert to HTML
  const tableData = sheet.getRange(CONFIG.TABLE_RANGE).getValues();
  const tableHtml = buildTableHtml(tableData);

  // Analyze metrics for threshold alerts
  const alerts = analyzeMetrics(tableData);

  // Generate trend chart from Calculations sheet
  const chartBlob = generateTrendChart();

  // Build and send email
  const subject = `Health Summary: ${today}`;
  const htmlBody = buildEmailHtml(tableHtml, today, alerts);

  MailApp.sendEmail({
    to: CONFIG.EMAIL_RECIPIENT,
    subject: subject,
    htmlBody: htmlBody,
    inlineImages: { trendChart: chartBlob }
  });

  Logger.log('Email sent successfully for ' + today);
}


// ============================================================
// HTML BUILDERS
// ============================================================

/**
 * Converts a 2D array of table data into an HTML table
 * @param {Array[]} data - 2D array from sheet range
 * @returns {string} HTML table string
 */
function buildTableHtml(data) {
  const rowCount = data.length;
  let html = '<table>';

  data.forEach((row, rowIndex) => {
    html += '<tr>';
    row.forEach((cell, colIndex) => {
      // First row becomes header
      const tag = rowIndex === 0 ? 'th' : 'td';

      // Build class attribute
      let cssClass = '';
      if (colIndex === 0 && rowIndex > 0) {
        cssClass = 'metrics-col';
      }

      // Apply dynamic coloring to percentage columns (columns 3-10, except header row)
      if (rowIndex > 0 && colIndex >= 3 && colIndex <= 10) {
        const colorClass = getColorClass(cell);
        if (colorClass) {
          cssClass = cssClass ? `${cssClass} ${colorClass}` : colorClass;
        }
      }

      const style = cssClass ? ` class="${cssClass}"` : '';
      html += `<${tag}${style}>${cell}</${tag}>`;
    });
    html += '</tr>';
  });

  html += '</table>';

  // Clean up table HTML
  html = html.replace('<td>MergedCell</td>', `<td rowspan="${rowCount}" class="merged-col">7D MA<br>vs.<br>28D MA</td>`);
  html = html.replace('<th>MergedHeader</th>', '<th></th>');
  html = html.replaceAll('<td>Merged</td>','')
  html = html.replaceAll('<td>—</td>','<td></td>')

  return html;
}

/**
 * Determines the color class based on percentage value
 * @param {string|number} value - Cell value (e.g., "-8%", "5%", "-10%")
 * @returns {string|null} CSS class name or null
 */
function getColorClass(value) {
  // Convert to string and extract percentage
  const str = String(value).trim();
  const match = str.match(/^([+-]?\d+(?:\.\d+)?)%?$/);

  if (!match) return null;

  const num = parseFloat(match[1]);
  const absNum = Math.abs(num);

  if (num > 0) {
    // Positive = improving
    if (absNum >= 9) return 'pos-dark';
    if (absNum >= 6) return 'pos-med';
    if (absNum >= 3) return 'pos-light';
  } else if (num < 0) {
    // Negative = worsening
    if (absNum >= 9) return 'neg-dark';
    if (absNum >= 6) return 'neg-med';
    if (absNum >= 3) return 'neg-light';
  }

  return null;
}

/**
 * Gets a random element from an array
 * @param {Array} arr - Array to pick from
 * @returns {*} Random element
 */
function getRandomTip(arr) {
  if (!arr || arr.length === 0) return '';
  return arr[Math.floor(Math.random() * arr.length)];
}

/**
 * Checks if a value falls within a threshold range (inclusive)
 * @param {number} value - The value to check
 * @param {Array} range - [min, max] range
 * @returns {boolean} True if value is within range
 */
function isInRange(value, range) {
  if (!range || range.length !== 2) return false;
  return value >= range[0] && value <= range[1];
}

/**
 * Analyzes metrics data and generates threshold-based alerts
 * @param {Array[]} data - 2D array from sheet range
 * @returns {Array} Array of alert objects
 */
function analyzeMetrics(data) {
  const alerts = [];

  // Process each row (skip header row)
  for (let i = 1; i < data.length; i++) {
    const metricName = data[i][0];
    const todayValue = data[i][1];      // e.g., "47 (78%)"
    const sevenDayAvg = data[i][2];     // e.g., "75%"

    // Skip empty rows
    if (!metricName || (!todayValue && !sevenDayAvg)) continue;

    // Map metric name to threshold key
    const thresholdKey = metricNameMap[metricName];
    if (!thresholdKey) continue;

    const threshold = alert_thresholds[thresholdKey];
    if (!threshold) continue;

    // Extract percentage from "Today" column (e.g., "47 (78%)" -> 78)
    const todayMatch = String(todayValue).match(/\((\d+)%\)/);
    const todayPct = todayMatch ? parseFloat(todayMatch[1]) : null;

    // Extract percentage from "7 Day Avg" column (e.g., "75%" -> 75)
    const avgMatch = String(sevenDayAvg).match(/^(\d+)%?$/);
    const avgPct = avgMatch ? parseFloat(avgMatch[1]) : null;

    // Skip if we couldn't extract any percentage
    if (todayPct === null && avgPct === null) continue;

    // Determine which value to use for threshold checking
    // For "inverted" metrics (mood, basics, physical_activity), lower is worse
    // For other metrics (depression, anxiety, etc.), higher is worse
    const isInverted = INVERTED_METRICS.includes(thresholdKey);

    let checkValue;
    let displayValue;
    if (isInverted) {
      // Use the lower value for inverted metrics (lower = worse)
      checkValue = Math.min(todayPct ?? 100, avgPct ?? 100);
      displayValue = (todayPct !== null && todayPct <= (avgPct ?? 100)) ? `${todayPct}%` : `${avgPct}%`;
    } else {
      // Use the higher value for regular metrics (higher = worse)
      checkValue = Math.max(todayPct ?? 0, avgPct ?? 0);
      displayValue = (todayPct !== null && todayPct >= (avgPct ?? 0)) ? `${todayPct}%` : `${avgPct}%`;
    }

    // Check severe threshold first
    if (threshold.severe && isInRange(checkValue, threshold.severe)) {
      alerts.push({
        severity: 'high',
        metric: metricName,
        thresholdKey: thresholdKey,
        message: `<strong>${metricName} score is at ${displayValue}</strong>. Please consider visiting a mental health provider.`
      });
    }
    // Then check warning threshold
    else if (threshold.warning && isInRange(checkValue, threshold.warning)) {
      const tip = threshold.warn_message ? getRandomTip(threshold.warn_message) : '';
      alerts.push({
        severity: 'medium',
        metric: metricName,
        thresholdKey: thresholdKey,
        message: `<strong>${metricName} is at ${displayValue}.</strong> ${tip}`
      });
    }
  }

  // Sort alerts: high severity first, then by critical metrics
  alerts.sort((a, b) => {
    if (a.severity !== b.severity) {
      return a.severity === 'high' ? -1 : 1;
    }
    // Within same severity, prioritize critical metrics
    const aPriority = CRITICAL_METRICS.includes(a.thresholdKey) ? 0 : 1;
    const bPriority = CRITICAL_METRICS.includes(b.thresholdKey) ? 0 : 1;
    return aPriority - bPriority;
  });

  return alerts;
}

/**
 * Builds the complete HTML email body
 * @param {string} tableHtml - HTML table string
 * @param {string} dateString - Formatted date
 * @param {Array} alerts - Array of alert objects from analyzeMetrics
 * @returns {string} Complete HTML email
 */
function buildEmailHtml(tableHtml, dateString, alerts) {
  // Build alerts HTML if there are any alerts
  let alertsHtml = '';
  if (alerts && alerts.length > 0) {
    alertsHtml = '<div class="alerts-section">';
    alertsHtml += '<h2>⚠️ Alerts & Recommendations</h2>';

    alerts.forEach(alert => {
      const alertClass = alert.severity === 'high' ? 'alert-high' : 'alert-medium';
      alertsHtml += `<div class="${alertClass}">${alert.message}</div>`;
    });

    alertsHtml += '</div>';
  }

  return `
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <style>
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
      line-height: 1.6;
      color: #000000;
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
    }

    h1 {
      color: #000000;
      border-bottom: 2px solid #667eea;
      padding-bottom: 10px;
    }

    h2 {
      color: #5a5a5a;
      margin-top: 10px;
    }

    table {
      width: 80%;
      border-collapse: collapse;
      margin: 10px 0;
      font-size: 14px;
    }

    th, td {
      padding: 5px;
      border: 1px solid #ddd;
      text-align: center;
    }

    th {
      background-color: #38428f;
      color: white;
      font-weight: 600;
    }

    tr:nth-child(even) {
      background-color: #f8f9fa;
    }

    .table-section,
    .chart-section {
      margin: 10px 0;
      padding: 15px;
      background-color: #f3f3f3;
      border-left: 4px solid #919090;
      border-radius: 4px;
    }

    .chart-section img {
      max-width: 100%;
      height: auto;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }

    .merged-col {
      width: 80px;
      word-wrap: break-word;
      overflow-wrap: break-word;
      white-space: normal;
      background-color: #dcddfa;
      font-weight: 600;
    }

    .metrics-col {
      background-color: #d4d4d4;
      font-weight: 600;
      width: 120px;
    }

    /* Dynamic coloring for percentage changes */
    .pos-light { background-color: #d1f4d1; }
    .pos-med { background-color: #4caf50; color: white; }
    .pos-dark { background-color: #2e7d32; color: white; font-weight: 600; }

    .neg-light { background-color: #ffcdd2; }
    .neg-med { background-color: #f44336; color: white; }
    .neg-dark { background-color: #c62828; color: white; font-weight: 600; }

    /* Alerts section */
    .alerts-section {
      margin: 10px 0;
      padding: 15px;
      background-color: #deedfe;
      border-left: 4px solid #4498f8;
      border-radius: 4px;
    }

    .alert-high {
      padding: 12px;
      margin: 10px 0;
      background-color: #f8d7da;
      border-left: 4px solid #dc3545;
      border-radius: 4px;
      color: #721c24;
    }

    .alert-medium {
      padding: 12px;
      margin: 10px 0;
      background-color: #fff3cd;
      border-left: 4px solid #ffc107;
      border-radius: 4px;
      color: #856404;
    }

  </style>
</head>
<body>
  <h1>Health Summary: ${dateString}</h1>

  ${alertsHtml}

  <div class="table-section">
    <h2>Summary Metrics</h2>
    ${tableHtml}
  </div>

  <div class="chart-section">
    <h2>Trends: Depression (Low) & Anxiety (High) Scores</h2>
    <img src="cid:trendChart" alt="Trend Chart">
  </div>

</body>
</html>
  `;
}


// ============================================================
// CHART GENERATION
// ============================================================

/**
 * Fetches trend data from Calculations sheet and generates chart via QuickChart.io
 * @returns {Blob} Chart image blob
 */
function generateTrendChart() {
  const spreadsheet = SpreadsheetApp.openById(CONFIG.SPREADSHEET_ID);
  const calcSheet = spreadsheet.getSheetByName(CONFIG.CALCULATIONS_SHEET);

  // Fetch data ranges
  const dates = calcSheet.getRange('A3:A92').getValues();
  const depression = calcSheet.getRange('I3:I92').getValues();
  const depressionMA = calcSheet.getRange('L3:L92').getValues();
  const anxiety = calcSheet.getRange('M3:M92').getValues();
  const anxietyMA = calcSheet.getRange('P3:P92').getValues();
  const substanceMA = calcSheet.getRange('T3:T92').getValues();
  const activityMA = calcSheet.getRange('AG3:AG92').getValues();

  // Filter out empty rows and limit to configured number of days
  const validData = [];
  for (let i = 0; i < dates.length; i++) {
    if (dates[i][0] && (depression[i][0] !== '' || anxiety[i][0] !== '')) {
      validData.push({
        date: dates[i][0],
        depression: depression[i][0] || null,
        depressionMA: depressionMA[i][0] || null,
        anxiety: anxiety[i][0] || null,
        anxietyMA: anxietyMA[i][0] || null,
        substanceMA: substanceMA[i][0] || null,
        activityMA: activityMA[i][0] || null
      });
    }
  }

  // Take only the most recent N days
  const recentData = validData.slice(-CONFIG.CHART_DAYS);

  // Format dates and extract values
  const chartLabels = recentData.map(d =>
    Utilities.formatDate(new Date(d.date), CONFIG.TIMEZONE, 'MM/dd')
  );
  const lowData = recentData.map(d => d.depression);
  const lowMAData = recentData.map(d => d.depressionMA ? d.depressionMA * 100 : null);
  const highData = recentData.map(d => d.anxiety);
  const highMAData = recentData.map(d => d.anxietyMA ? d.anxietyMA * 100 : null);
  const substanceMAData = recentData.map(d => d.substanceMA ? d.substanceMA * 100 : null);
  const activityMAData = recentData.map(d => d.activityMA ? d.activityMA * 100 : null);

  // Build Chart.js configuration
  const chartConfig = {
    type: 'line',
    data: {
      labels: chartLabels,
      datasets: [
        {
          label: 'Low',
          data: lowData,
          borderColor: 'rgb(56, 75, 181)',
          borderWidth: 2,
          pointRadius: 1,
          pointHoverRadius: 2,
          fill: false,
          yAxisID: 'left'
        },
        {
          label: 'Low (7D MA)',
          data: lowMAData,
          borderColor: 'rgb(75, 112, 198)',
          borderWidth: 2,
          pointRadius: 0,
          pointHoverRadius: 2,
          borderDash: [5, 5],
          fill: false,
          yAxisID: 'right'
        },
        {
          label: 'High',
          data: highData,
          borderColor: 'rgb(173, 62, 54)',
          borderWidth: 2,
          pointRadius: 1,
          pointHoverRadius: 2,
          fill: false,
          yAxisID: 'left'
        },
        {
          label: 'High (7D MA)',
          data: highMAData,
          borderColor: 'rgb(189, 94, 94)',
          borderWidth: 2,
          pointRadius: 0,
          pointHoverRadius: 2,
          borderDash: [5, 5],
          fill: false,
          yAxisID: 'right'
        },
        {
          label: 'Substance (7D MA)',
          data: substanceMAData,
          borderColor: 'rgb(52, 174, 119)',
          borderWidth: 2,
          pointRadius: 0,
          pointHoverRadius: 2,
          borderDash: [5, 5],
          fill: false,
          yAxisID: 'right'
        },
        {
          label: 'Activity (7D MA)',
          data: activityMAData,
          borderColor: 'rgb(110, 70, 157)',
          borderWidth: 2,
          pointRadius: 0,
          pointHoverRadius: 2,
          borderDash: [5, 5],
          fill: false,
          yAxisID: 'right'
        }
      ]
    },
    options: {
      title: {
        display: false
      },
      legend: {
        position: 'bottom',
        labels: {
          boxWidth: 9,
          fontSize: 8
        }
      },
      scales: {
        yAxes: [
          {
            id: 'left',
            position: 'left',
            ticks: {
              beginAtZero: true,
              fontSize: 9,
              callback: function(value) {
                return value + '%';
              }
            },
            scaleLabel: {
              display: true,
              labelString: 'Score',
              fontSize: 10
            }
          },
          {
            id: 'right',
            position: 'right',
            ticks: {
              beginAtZero: true,
              max: 100,
              fontSize: 9,
              callback: function(value) {
                return value + '%';
              }
            },
            scaleLabel: {
              display: true,
              labelString: '7D Moving Avg (%)',
              fontSize: 10
            },
            gridLines: {
              drawOnChartArea: false
            }
          }
        ],
        xAxes: [{
          ticks: {
            maxRotation: 45,
            minRotation: 45,
            fontSize: 9
          }
        }]
      }
    }
  };

  // Use POST request to avoid URL length limits
  const payload = {
    chart: chartConfig,
    width: 450,
    height: 250,
    format: 'png'
  };

  const options = {
    method: 'post',
    contentType: 'application/json',
    payload: JSON.stringify(payload)
  };

  const response = UrlFetchApp.fetch('https://quickchart.io/chart', options);
  const chartBlob = response.getBlob().setName('trend_chart.png');

  return chartBlob;
}


// ============================================================
// SETUP & TESTING
// ============================================================

/**
 * Sets up a daily trigger at 9pm
 * Run this once manually
 */
function setupDailyTrigger() {
  // Remove existing triggers for this function
  ScriptApp.getProjectTriggers()
    .filter(t => t.getHandlerFunction() === 'sendDailySummaryEmail')
    .forEach(t => ScriptApp.deleteTrigger(t));
  
  // Create new daily trigger
  ScriptApp.newTrigger('sendDailySummaryEmail')
    .timeBased()
    .atHour(21)
    .everyDays(1)
    .inTimezone(CONFIG.TIMEZONE)
    .create();
  
  Logger.log('Daily trigger set for 9pm ' + CONFIG.TIMEZONE);
}

/**
 * Test function - sends email immediately
 * Use this to verify everything works
 */
function testSendEmail() {
  sendDailySummaryEmail();
}