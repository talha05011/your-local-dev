FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm install -g nodemon
EXPOSE 5000
CMD ["nodemon", "--legacy-watch", "server.js"]
