FROM node:16-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 5000
# Remove any existing CMD/ENTRYPOINT that might interfere
CMD ["npm", "start"] 
