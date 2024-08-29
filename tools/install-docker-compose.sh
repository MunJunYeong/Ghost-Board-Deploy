#!/bin/bash

# 이 스크립트는 Docker Compose를 설치합니다.

# 업데이트 및 wget 설치
echo "Updating apt and installing wget..."
sudo apt update
sudo apt install -y wget

# Docker Compose v2.6.0 다운로드
echo "Downloading Docker Compose v2.6.0..."
wget https://github.com/docker/compose/releases/download/v2.6.0/docker-compose-linux-x86_64

# Docker Compose를 /usr/local/bin/으로 이동 및 실행 권한 부여
echo "Moving Docker Compose to /usr/local/bin/ and setting permissions..."
sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# 설치 확인
echo "Verifying Docker Compose installation..."
docker-compose --version

echo "Docker Compose installation complete."
