# Ghost Board Repository

이 리포지토리는 Linux 환경을 기반으로 하여 개발 환경 구축, 배포 환경 구축을 위해 개발 되었습니다. 아래의 안내에 따라 개발 환경을 설정하세요.

## 개발 환경 설정
아래 설치 스크립트 중 필요 항목을 알맞게 실행
### docker install
```
$ chmod +x ./tools/install-docker.sh
$ ./tools/install-docker.sh
```

### docker-compose install
```
$ chmod +x ./tools/install-docker-compose.sh
$ ./tools/install-docker-compose.sh
```

### FE/BE setting
```
chmod +x ./set-develop-repo.sh
$ ./set-develop-repo.sh
```
- git 설정 (username, email)을 하기 위해서는 파일의 아래 내용을 수정 해주세요.
  ```
  set_git_config=true
  GIT_USERNAME="사용자 입력"
  GIT_EMAIL="사용자 입력"
  ```

### DB setting
`PostgreSQL`과 `Redis` 서버를 로컬에 설치하지 않고 Docker를 통해 실행하려면, 아래 명령어를 사용하세요.
```
docker-compose -f docker-db-compose.yml up -d
```




## 배포 환경 구조
TODO
### DB server
- Postgresql
- Redis

### Application server
- Frontend
- Backend 
