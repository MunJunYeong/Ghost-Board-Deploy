#!/bin/bash

# Github repo URL 설정
FRONTEND_REPO_URL="https://github.com/MunJunYeong/Ghost-Board-Frontend.git"
BACKEND_REPO_URL="https://github.com/MunJunYeong/Ghost-Board-Backend.git"

# dir name 
#       - `.gitignore`, `docker-compose` 파일 naming과 일치해야 함.
FRONTEND_DIR="frontend"
BACKEND_DIR="backend"

# FE - clone or pull
if [ -d "$FRONTEND_DIR" ]; then
  echo "Pulling latest changes..."
  cd "$FRONTEND_DIR"
  git fetch 
  git pull origin master
  cd ..
else
  echo "Cloning frontend repository..."
  git clone "$FRONTEND_REPO_URL" "$FRONTEND_DIR"
fi

# BE - clone or pull
if [ -d "$BACKEND_DIR" ]; then
  echo "Pulling latest changes..."
  cd "$BACKEND_DIR"
  git pull origin master
  cd ..
else
  echo "Cloning backend repository..."
  git clone "$BACKEND_REPO_URL" "$BACKEND_DIR"
fi