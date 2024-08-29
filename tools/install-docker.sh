#!/bin/bash

# 이 스크립트는 Ubuntu 시스템에 최신 Docker를 설치하고 설정합니다.

# 업데이트 및 필수 패키지 설치
echo "Updating apt and installing prerequisites..."
sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release 

# Docker의 공식 GPG 키 추가
echo "Adding Docker's official GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Docker 레포지토리 설정
echo "Setting up Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Docker 엔진 설치
echo "Installing Docker Engine..."
sudo apt update 
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Docker 서비스 시작 및 자동화
echo "Starting and enabling Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

# 현재 사용자를 Docker 그룹에 추가하여 권한 문제 해결
echo "Adding current user to Docker group..."
sudo usermod -aG docker $USER 

# Docker 서비스 재시작
echo "Restarting Docker service..."
sudo systemctl restart docker 

# 설치 확인
echo "Verifying Docker installation..."
docker --version
docker ps 

# Hello World 이미지 다운로드 및 실행
echo "Running hello-world Docker image..."
docker run hello-world

echo "Docker installation and setup complete."
