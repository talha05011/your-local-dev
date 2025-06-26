const express = require('express');
const app = express();
const PORT = 5000;

// Set timezone to match host system (pass via environment variable)
process.env.TZ = 'Asia/Kolkata'; // Replace with your timezone, e.g., 'America/New_York'

// Immediate response middleware
app.use((req, res, next) => {
  res.set('Connection', 'keep-alive');
  next();
});

// Health check
app.get('/health', (req, res) => {
  res.status(200).send('OK');
});

// Root endpoint with auto-updating time
app.get('/', (req, res) => {
  const now = new Date();
  res.send(`
    <!DOCTYPE html>
    <html>
    <head>
        <title>Backend Time</title>
        <style>
            body {
                font-family: Arial;
                text-align: center;
                background: #4CAF50;
                color: white;
                padding: 50px;
            }
            .timestamp {
                font-size: 24px;
                margin: 20px;
                padding: 10px;
                background: rgba(0,0,0,0.2);
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
        <h1>✅ BACKEND WORKING FOR NOW</h1>
        <div class="timestamp">
            <div>Current Time: <span id="time">${now.toLocaleTimeString()}</span></div>
            <div>Current Date: <span id="date">${now.toLocaleDateString()}</span></div>
        </div>
        
        <script>
            function updateTime() {
                fetch('/current-time')
                    .then(res => res.json())
                    .then(data => {
                        document.getElementById('time').textContent = new Date(data.time).toLocaleTimeString();
                        document.getElementById('date').textContent = new Date(data.time).toLocaleDateString();
                    });
            }
            setInterval(updateTime, 1000);
            updateTime();
        </script>
    </body>
    </html>
  `);
});

// New endpoint for current time
app.get('/current-time', (req, res) => {
  res.json({ time: new Date().toISOString() });
});

// Start server
app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server running on port ${PORT}`);
});
