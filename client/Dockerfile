FROM nginx:alpine
COPY index.html /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 3000
HEALTHCHECK --interval=30s CMD curl -f http://localhost:3000 || exit 1
CMD ["nginx", "-g", "daemon off;"]
