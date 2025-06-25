const express = require('express');
const app = express();
const PORT = 5000;

// Middleware to handle connection errors
app.use((req, res, next) => {
  res.set('Connection', 'close');
  next();
});

// Root endpoint
app.get('/', (req, res) => {
  res.send(`
    <h1 style="color:green;">BACKEND IS WORKING</h1>
    <p>Server time: ${new Date()}</p>
  `);
});

// Start server with error handling
const server = app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server running on port ${PORT}`);
  process._healthy = true; // Manual health flag
});

// Keep process alive
setInterval(() => {}, 1000);
process.on('uncaughtException', (e) => {
  console.log('Error handled:', e.message);
});
