# Ghost Board Repository

이 리포지토리는 Linux 환경을 기반으로 하여 개발되었습니다. 아래의 안내에 따라 개발 환경을 설정하세요.

## 개발 환경 설정 스크립트: `develop.sh`

`develop.sh` 스크립트는 개발 환경을 빠르고 쉽게 설정하기 위한 도구입니다. 이 스크립트는 프로젝트의 FE/BE Repository를 자동으로 클론하고, 최신 변경 사항을 가져오며, 필요한 종속성을 설치합니다.

### 주요 기능

- git clone
- npm/yarn dependency install
- git config

### 사용 방법

1. 스크립트를 실행하여 개발 환경을 설정합니다:

    ```bash
    chmod -x develop.sh
    ./develop.sh
    ```

2. `set_git_config` flag를 통해 각 리포지토리의 Git 설정을 로컬로 관리할 수 있습니다. Global 설정을 원하지 않거나, 각 리포지토리마다 다른 Git 설정을 사용하고자 할 경우, `develop.sh` 스크립트에서 `set_git_config` 값을 `true`로 설정하세요.

    ```bash
    set_git_config=true
    GIT_USERNAME="사용자 입력"
    GIT_EMAIL="사용자 입력"
    ```