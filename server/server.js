const express = require('express');
const app = express();
const PORT = 5000;

// Immediate response middleware
app.use((req, res, next) => {
  res.set('Connection', 'keep-alive');
  next();
});

// Instant health check
app.get('/health', (req, res) => {
  res.status(200).send('OK');
});

// Root endpoint
app.get('/', (req, res) => {
  res.send(`
    <h1 style="color:green;text-align:center;">
      ✅ BACKEND WORKING FOR NOW
      <small>${new Date().toLocaleTimeString()}</small>
    </h1>
  `);
});

// Start server with zero-delay
const server = app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server ready on ${PORT}`);
  process.emit('server_ready'); // Special event
});

// Keep process alive
setInterval(() => {}, 1000);
