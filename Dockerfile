
FROM node:16 AS build
WORKDIR /home/vuejs/portfolio2
COPY . .
RUN npm install
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
#docker build -t vue-nginx .
#docker run -d -p 80:80 vue-nginx