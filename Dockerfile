
FROM node:18.16.0 AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 70
#docker build -t vue-nginx .
#docker run -d -p 80:80 vue-nginx