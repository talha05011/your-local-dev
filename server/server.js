const express = require('express');
const app = express();
const PORT = 5000;

app.get('/health', (req, res) => {
    res.json({ status: 'OK', timestamp: new Date() });
});

app.get('/', (req, res) => {
    res.send('<h1>Local Backend</h1><p>Try <a href="/health">/health</a></p>');
});

app.listen(PORT, () => console.log(`Local backend running on http://localhost:${PORT}`));
