const express = require('express');
const path = require('path');
const app = express();

app.use(express.static(path.join(__dirname, '..')));
app.use('/static', express.static('static'));
app.use('/data', express.static('data'));

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '..', 'index.html'));
});

const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});