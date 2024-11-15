#!/bin/bash
#used cron bc it was simpler
#exit if it fails whitch ?
cd /home/vuejs/portfolio2 || exit 1

git checkout main || exit 1
git fetch origin
git reset --hard origin/main 

# Get the latest commit hash
latest_commit=$(git rev-parse HEAD)


if [ -f last_commit.txt ]; then
    last_commit=$(cat last_commit.txt)
else
    last_commit=""
fi

if [ "$latest_commit" != "$last_commit" ]; then
    echo "updating to :"
    docker build -t vue-nginx .

    # continue if docker not runing
    docker stop vue-nginx || true

    docker rm vue-nginx || true

    docker run -d --name vue-nginx -p 70:70 --restart always vue-nginx

    echo "$latest_commit" > last_commit.txt
else
    echo "No changes detected"
fi
