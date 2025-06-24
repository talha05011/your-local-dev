FROM node:16-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --production  # Install deps before copying code
COPY . .
EXPOSE 5000
CMD ["node", "server.js"]
