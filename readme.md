# 학생 청원 게시판 시스템 웹 프로젝트

## 프로젝트 개요

### 프로젝트명
학생 청원 게시판 시스템 웹 프로젝트

### 목적
본 프로젝트는 사소하지만 중요한 불편사항이나 의견을 효과적으로 공유하고, 학생들 간의 참여를 유도할 수 있는 소통의 공간을 마련하기 위해 개발되었습니다. 학생들이 학교 내 문제나 개선점을 자유롭게 청원할 수 있으며, 다른 학생들이 공감하거나 댓글을 통해 의견에 참여할 수 있도록 돕는 웹 플랫폼입니다.

### 주요 기능
- 청원 게시판
- 청원 관리
- 회원 관리
- 문의하기
- 오늘 올라온 청원 보기 (관리자 기능 추가)

### 대상 사용자
주요 사용자는 학교 또는 대학의 학생들입니다. 문제를 제기하고 해결하고 싶은 학생과 다른 학생들의 의견에 참여하고 공감하는 학생들이 주요 대상입니다.

### 기대 효과
학교 내 사소한 불편 사항이나 개선이 필요한 의견이 더 쉽게 전달될 수 있습니다.

---

## 개발 환경 및 기술 스택

### 개발 환경
- **IDE**: Eclipse
- **DB 관리**: SQL Developer
- **데이터베이스**: Oracle Database
- **테스트 환경**: 로컬

### 기술 스택
- **프론트엔드**: HTML, CSS, JavaScript, AJAX, jQuery
- **백엔드**: Java, JSP
- **아키텍처 패턴**: MVC 모델

---

## 요구사항 분석 및 프로젝트 설계

### 아키텍처
- **MVC 모델 패턴**
    1. **DispatcherServlet**: 클라이언트 요청을 받아 처리하는 프론트 컨트롤러
    2. **HandlerMapper**: 요청 URL에 따라 적절한 Controller를 찾아주는 역할
    3. **Controller**: 비즈니스 로직을 처리하고 MyBatis와 연동
    4. **MyBatis**: SQL 실행 및 결과 반환
    5. **View**: 최종 결과를 사용자에게 보여주는 화면 (JSP 등)

---

## 구현 기능

1. **메인페이지**
2. **로그인**
   - 카카오톡 간편 로그인
3. **회원가입**
   - 아이디, 이메일 중복 체크
4. **마이페이지**
   - 작성한 청원, 참여한 청원, 댓글 조회
   - 개인 정보 수정
5. **청원 목록**
6. **청원 검색**
   - 키워드, 카테고리, 상태로 검색
   - 참여수 기반 정렬
7. **청원 작성**
8. **청원 상세**
   - 일반 사용자는 청원 참여, 댓글(대댓글 가능), 신고
   - 관리자는 수정, 삭제, 답변
9. **신고 관리**
   - 신고 접수된 청원, 댓글 확인
10. **회원 관리**
    - 아이디로 유저 검색
    - 상태 변경으로 활동 제한 가능
    - **오늘 올라온 청원 보기** 기능 추가
11. **문의하기**
    - 사용자가 문제를 신고하거나 문의할 수 있는 기능
    - 사용자 질문이나 불편 사항을 관리자가 확인할 수 있도록 쿼리 기반 처리

---

## 설치 및 실행

1. **소스 코드 클론**
    ```bash
    git clone https://github.com/yourusername/petition-board.git
    ```

2. **프로젝트 빌드 및 실행**
   - Eclipse에서 프로젝트를 열고 실행합니다.

3. **데이터베이스 설정**
   - Oracle Database에 데이터베이스를 설정합니다.
   - SQL Developer에서 테이블 생성 및 초기 데이터를 추가합니다.

4. **테스트**
   - 로컬 서버에서 테스트를 진행하며, 웹 기능들이 정상적으로 작동하는지 확인합니다.

---

