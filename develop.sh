#!/bin/bash

# Git config 설정 (Local 설정)
# config 설정을 사용할 경우 아래 값을 `true`로 설정 후 사용
set_git_config=false
GIT_USERNAME=""
GIT_EMAIL=""

# Github repo URL 설정
FRONTEND_REPO_URL="https://github.com/MunJunYeong/Ghost-Board-Frontend.git"
BACKEND_REPO_URL="https://github.com/MunJunYeong/Ghost-Board-Backend.git"

# dir name
#       - `.gitignore`, `docker-compose` 파일 naming과 일치해야 함.
FRONTEND_DIR="frontend"
BACKEND_DIR="backend"

########################################################################################################################
# 필요 tool 설치 확인
check_tool() {
  if ! command -v "$1" &> /dev/null; then
    echo "Error: $1 is not installed. Please install $1 and try again."
    exit 1
  fi
}

# Yarn과 NPM 설치 여부 확인
check_tool "yarn"
check_tool "npm"

echo "Successfully checked tools. All required tools are installed."
echo "----------------------------------------------------------------"
########################################################################################################################
# FE
echo "Starting frontend setup..."

# git clone
if [ ! -d "$FRONTEND_DIR" ]; then
  echo "Cloning frontend repository..."
  git clone "$FRONTEND_REPO_URL" "$FRONTEND_DIR"
else
  echo "Frontend directory already exists. Skipping clone."
fi

echo "Pulling latest changes..."
cd "$FRONTEND_DIR"

# git pull
git fetch
git pull origin master
echo "Installing frontend dependencies..."
yarn install

cd ..
echo "Frontend setup completed."
echo "----------------------------------------------------------------"

########################################################################################################################
# BE
echo "Starting backend setup..."

# git clone
if [ ! -d "$BACKEND_DIR" ]; then
  echo "Cloning backend repository..."
  git clone "$BACKEND_REPO_URL" "$BACKEND_DIR"
else
  echo "Backend directory already exists. Skipping clone."
fi

echo "Pulling latest changes..."
cd "$BACKEND_DIR"

git fetch
git pull origin master
echo "Installing backend dependencies..."
npm install

cd ..
echo "Backend setup completed."
echo "----------------------------------------------------------------"

########################################################################################################################
# set git config
if [ "$set_git_config" = true ]; then
  echo "Applying Git configuration settings..."
  
  for DIR in "$FRONTEND_DIR" "$BACKEND_DIR"; do
    echo "Setting Git config in $DIR..."
    cd "$DIR"
    git config user.name "$GIT_USERNAME"
    git config user.email "$GIT_EMAIL"
    cd ..
  done

  echo "Git configuration has been applied."
else
  echo "Git configuration skipped."
fi

echo "----------------------------------------------------------------"
echo "All tasks completed successfully."