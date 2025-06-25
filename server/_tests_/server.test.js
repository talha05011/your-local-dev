const request = require('supertest');
const { app, server } = require('../server');

describe('Server Endpoints', () => {
  afterAll((done) => {
    server.close(done);
  });

  it('GET /health should return healthy status', async () => {
    const res = await request(app).get('/health');
    expect(res.statusCode).toEqual(200);
    expect(res.body.status).toBe('OK');
  });

  it('GET / should return HTML', async () => {
    const res = await request(app).get('/');
    expect(res.statusCode).toEqual(200);
    expect(res.text).toContain('Local Backend');
  });
});
