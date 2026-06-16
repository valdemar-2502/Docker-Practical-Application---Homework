#!/bin/bash
set -e
PROJECT_DIR="/opt/shvirtd-app"
REPO_URL="https://github.com/......"

curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER

sudo rm -rf $PROJECT_DIR
sudo git clone $REPO_URL $PROJECT_DIR
cd $PROJECT_DIR

sudo tee .env << ENVEOF
MYSQL_ROOT_PASSWORD=должен быть пароль
MYSQL_DATABASE=virtd
MYSQL_USER=appuser
MYSQL_PASSWORD=должен быть пароль
ENVEOF

sudo docker compose up -d
sleep 30
curl -s http://localhost:8090
