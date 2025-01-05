const months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
];
const daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
const years = [2025, 2026];

// Holidays dataset
const holidays = {
    '2025-01-01': { text: "New Year's Day", color: '#FFF5F5' },
    '2025-02-14': { text: "Valentine's Day", color: '#FFF5F5' },
    '2025-03-17': { text: "St. Patrick's Day", color: '#FFF5F5' },
    '2025-05-26': { text: "Memorial Day", color: '#FFF5F5' },
    '2025-07-04': { text: "Independence Day", color: '#FFF5F5' },
    '2025-09-01': { text: "Labor Day", color: '#FFF5F5' },
    '2025-11-27': { text: "Thanksgiving", color: '#FFF5F5' },
    '2025-12-25': { text: "Christmas Day", color: '#FFF5F5' },
    
    '2026-01-01': { text: "New Year's Day", color: '#FFF5F5' },
    '2026-02-14': { text: "Valentine's Day", color: '#FFF5F5' },
    '2026-03-17': { text: "St. Patrick's Day", color: '#FFF5F5' },
    '2026-05-25': { text: "Memorial Day", color: '#FFF5F5' },
    '2026-07-04': { text: "Independence Day", color: '#FFF5F5' },
    '2026-09-07': { text: "Labor Day", color: '#FFF5F5' },
    '2026-11-26': { text: "Thanksgiving", color: '#FFF5F5' },
    '2026-12-25': { text: "Christmas Day", color: '#FFF5F5' }
};

// Events dataset
const events = {
    '2025-01-15': { text: "Quarterly Planning Meeting", color: '#EBF8FF' },
    '2025-04-22': { text: "Team Building Workshop", color: '#EBF8FF' },
    '2025-06-20': { text: "Sarah's Birthday", color: '#EBF8FF' },
    '2025-10-31': { text: "Company Halloween Party", color: '#EBF8FF' },
    
    '2026-03-30': { text: "Annual Review", color: '#EBF8FF' },
    '2026-06-20': { text: "Sarah's Birthday", color: '#EBF8FF' },
    '2026-08-15': { text: "Summer Picnic", color: '#EBF8FF' },
    '2026-12-20': { text: "End of Year Party", color: '#EBF8FF' }
};

function adjustTextSize(element) {
    const container = element.parentElement;
    const maxWidth = container.clientWidth;
    const maxHeight = container.clientHeight;
    
    let fontSize = 11;
    element.style.fontSize = fontSize + 'px';

    while ((element.scrollWidth > maxWidth || element.scrollHeight > maxHeight) && fontSize > 6) {
        fontSize -= 0.5;
        element.style.fontSize = fontSize + 'px';
    }
}

function getDaysInMonth(year, month) {
    return new Date(year, month + 1, 0).getDate();
}

function getFirstDayOfMonth(year, month) {
    return new Date(year, month, 1).getDay();
}

function isToday(year, month, day) {
    const today = new Date();
    return today.getDate() === day && 
           today.getMonth() === month && 
           today.getFullYear() === year;
}

function isPastDate(year, month, day) {
    const today = new Date();
    const checkDate = new Date(year, month, day);
    return checkDate < new Date(today.getFullYear(), today.getMonth(), today.getDate());
}

function renderMonth(year, month) {
    const daysInMonth = getDaysInMonth(year, month);
    const firstDay = getFirstDayOfMonth(year, month);
    let html = `
        <div class="month">
            <div class="month-title">${months[month]} ${year}</div>
            <table>
                <tr>
                    ${daysOfWeek.map(day => `<th>${day}</th>`).join('')}
                </tr>
    `;

    let dayCount = 1;
    const weeksInMonth = Math.ceil((firstDay + daysInMonth) / 7);

    for (let week = 0; week < weeksInMonth; week++) {
        html += '<tr>';
        for (let dayOfWeek = 0; dayOfWeek < 7; dayOfWeek++) {
            if ((week === 0 && dayOfWeek < firstDay) || dayCount > daysInMonth) {
                html += '<td class="empty"></td>';
            } else {
                const date = `${year}-${String(month + 1).padStart(2, '0')}-${String(dayCount).padStart(2, '0')}`;
                const holiday = holidays[date];
                const event = events[date];
                
                let classes = [];
                if (isToday(year, month, dayCount)) {
                    classes.push('today');
                } else if (isPastDate(year, month, dayCount)) {
                    classes.push('past-date');
                }
                
                html += `<td class="${classes.join(' ')}">`;
                html += `<div class="date">${dayCount}</div>`;
                
                if (holiday || event) {
                    html += '<div class="event-container">';
                    if (holiday) {
                        html += `<div class="event" style="background-color: ${holiday.color}">${holiday.text}</div>`;
                    }
                    if (event) {
                        html += `<div class="event" style="background-color: ${event.color}">${event.text}</div>`;
                    }
                    html += '</div>';
                }
                
                html += '</td>';
                dayCount++;
            }
        }
        html += '</tr>';
    }

    html += '</table></div>';
    return html;
}

function renderCalendar() {
    const calendarEl = document.getElementById('calendar');
    let html = '';

    years.forEach(year => {
        html += `
            <div class="year-section">
                <h2 class="year-title">${year}</h2>
                <div class="months-grid">
        `;

        for (let month = 0; month < 12; month++) {
            html += renderMonth(year, month);
        }

        html += '</div></div>';
    });

    calendarEl.innerHTML = html;
    document.querySelectorAll('.event').forEach(adjustTextSize);
}

async function loadEventsFromCSV() {
    try {
        // Load holidays
        const holidaysResponse = await window.fs.readFile('holidays.csv', { encoding: 'utf8' });
        Papa.parse(holidaysResponse, {
            header: true,
            complete: (results) => {
                results.data.forEach(row => {
                    if (row.date && row.event) {
                        holidays[row.date] = { 
                            text: row.event, 
                            color: row.color || '#FFF5F5'
                        };
                    }
                });
                
                // Load events
                loadEvents();
            },
            error: (error) => {
                console.error('Error parsing holidays CSV:', error);
                loadEvents();
            }
        });
    } catch (error) {
        console.error('Error loading holidays:', error);
        loadEvents();
    }
}

async function loadEvents() {
    try {
        const eventsResponse = await window.fs.readFile('events.csv', { encoding: 'utf8' });
        Papa.parse(eventsResponse, {
            header: true,
            complete: (results) => {
                results.data.forEach(row => {
                    if (row.date && row.event) {
                        events[row.date] = { 
                            text: row.event, 
                            color: row.color || '#EBF8FF'
                        };
                    }
                });
                renderCalendar();
            },
            error: (error) => {
                console.error('Error parsing events CSV:', error);
                renderCalendar();
            }
        });
    } catch (error) {
        console.error('Error loading events:', error);
        renderCalendar();
    }
}

// Initialize calendar
loadEventsFromCSV();

// Adjust text sizes when window is resized
window.addEventListener('resize', () => {
    document.querySelectorAll('.event').forEach(adjustTextSize);
});