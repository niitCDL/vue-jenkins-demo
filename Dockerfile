FROM nginx:1-alpine-slim
COPY ./dist/ /app/
COPY ./nginx.conf /etc/nginx/conf/nginx.conf
COPY ./default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
