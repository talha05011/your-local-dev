# Stage 1: Build
FROM node:16-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
# Create dist directory and copy only existing files
RUN mkdir -p dist && \
    { [ -f *.html ] && cp -v *.html dist/ || true; } && \
    { [ -f *.css ] && cp -v *.css dist/ || true; } && \
    { [ -f *.js ] && cp -v *.js dist/ || true; }

# Stage 2: Runtime
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 3000
