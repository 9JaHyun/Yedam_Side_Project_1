# [식당 예약 시스템](https://www.notion.so/bc864b34a3794c02b8d66be166315d62)

### 📕Introduce.
코로나로 인해 아무리 배달 음식이 성행이라지만, 여전히 수요가 높은 오프라인 매장에서는 긴 대기열로 추운 밖에서 시간을 보내는 분들이 많습니다. 이를 위해 음식점 예약 서비스를 개발하게 되었습니다.

## 👨‍💻Tech Stack

- BackEnd
    - JDK 11
    - Tomcat 9.0
    - JSP

- DataBase
    - Oracle DB 11g Express Edition
    - Ojdbc 8
    - MyBatis 3.5.9

- Communication
    - Git
    - Jira
    - Discord

## 📔 Work Flow

1. 회의 때 부여 받은 업무에 대한 `Issue` 등록
    - 기능 구현, 버그 픽스 등 프로젝트 관련 모든 이슈는 저장소`Issue`에 등록
    - 본인 업무는 본인이 이슈 등록
    - 등록 방식은 추후에 template로 등록할 예정이고 제목은 **`[브랜치명] 상세 기능 구현 내용`**

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/54ac9b6a-e615-4dab-9f48-e96cc6b852d0/Untitled.png)
![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1d90d0d5-c0c9-4d8a-8645-7ac782221e5e/Untitled.png)

1. `Project kanban Board`에 해당 업무에 대한 진행 상황에 맞게 위치시킴
    - 모든 팀원이 진행상황을 공유하기 위함

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/eee1e0e1-2a99-4387-9a1a-6e14cd3b8aa0/Untitled.png)

1. 해당 이슈에 맞는`feature branch` 생성

   **Git Flow**

    - `main` 메인 브랜치, 최종 배포 브랜치
    - `develop` 메인 개발 브랜치 각 브랜치들이 하나로 병합되는 지점
    - `release` 출시/배포 전 테스트 진행(QA)
    - `feature` 각 기능 개발 브랜치. 실제 브랜치명은 구현 기능명 ex) login, register 등
    - `hotfix` 에러 수정용 브랜치
    - `help` 구현이나 에러 해결에 도움이 필요한 상황

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/06768f57-33f9-4164-99e1-184cf19a36e0/Untitled.png)

1. 각자 브랜치에서 작업 후 기능 구현 후 develop 브랜치에 `Pull Request` 보냄

   ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/70da0a69-0268-433b-91eb-d2653e28fb2b/Untitled.png)


1. 팀장이 코드 확인 후 develop 브랜치와 `Merge`

1. 최종 배포 전에 develop → master 브랜치 Merge

## 📔 Commit Message Rule

- 작업 별로 최대한 많이 세부적으로 나눠서 commit 메시지 작성
- 커밋 메시지 마지막에 작업에대한 관련 issue 번호를 붙여줌
- ex) Feat: 메인 페이지 Banner Layout #10

## 📔 Commit Message Convention

1. Feat: 새로운 기능의 추가
2. Fix: 버그수정
3. Docs: 문서 수정
4. Style: 스타일 관련 기능
5. Refactor: 코드 리팩토링
6. Test: 테스트 관련
7. chore: 빌드 부분 혹은 패키지 매니저 수정사항

### 📊Data Flow

1. 로그인 & 회원가입 Flow

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5ca5d0b2-6650-4276-a5ea-d15fed76035d/Untitled.png)

1. Index UI Flow

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e718aa60-24d1-472c-9d57-9e3564480fb0/Untitled.png)

1. 예약 Flow

![10D80AAA-F57B-48DD-AA2A-C52577AE2C98.jpeg](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/bcbab4ce-b865-498c-903a-d21e6812dc1c/10D80AAA-F57B-48DD-AA2A-C52577AE2C98.jpeg)

![332F19EA-792B-4906-8FD9-D6EACCFC99F0.jpeg](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f31d0b01-128b-43cc-b22d-86f2db9288b8/332F19EA-792B-4906-8FD9-D6EACCFC99F0.jpeg)

### ERD 설계도

![TripService (1).png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/22b943cd-6081-478b-9ec6-52dc6ddfe801/TripService_(1).png)

### 사용하는 OS

Windows 10 (WEB Application)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c6b7de3c-ef21-4d4f-846d-472e58e06468/Untitled.png)

### 오픈 API 목록

- Naver map(지도 정보 제공)

### [Notion](https://www.notion.so/bc864b34a3794c02b8d66be166315d62)
