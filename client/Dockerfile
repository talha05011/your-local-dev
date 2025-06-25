FROM node:18-alpine as dev
WORKDIR /app
COPY package*.json ./
RUN npm install -g browser-sync && npm install
COPY . .
CMD ["npx", "browser-sync", "start", "--server", "--files", "'**/*'"]

FROM nginx:alpine as prod
COPY --from=dev /app /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 3000
