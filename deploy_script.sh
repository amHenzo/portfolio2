#!/bin/bash
#used cron bc it was simpler
#exit if it fails whitch ?
cd /home/vuejs/portfolio2 || exit 1

git pull

docker build -t vue-nginx .

# continue if docker not runing
docker stop vue-nginx || true

# same
docker rm vue-nginx || true

docker run -d --name vue-nginx -p 70:70 vue-nginx
