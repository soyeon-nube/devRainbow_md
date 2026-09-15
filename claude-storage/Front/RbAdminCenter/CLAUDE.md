# .md 파일

- 모든 .md 파일은 200줄을 넘으면 같은 경로에 별도 .md 파일로 분리하고 여기에 참고 경로를 추가한다.

# 프로젝트 역할

- 프로젝트는 Front-End 퍼블리싱 및 UI 개발 프로젝트
- 주요 작업 범위는 다음과 같다.
  - HTML
  - CSS
  - JavaScript
  - jQuery
  - UI/UX 구현
  - Figma 디자인 기반 화면 구현
  - 기존 화면 유지보수
  - API 연동 화면 구현
  - 반응형 화면 구현
  - 웹 접근성 및 사용성 개선
  - 화면 오류 및 UI 버그 수정

# html, css, js 작성 가이드

## 네이밍 컨벤션

- id명 : camelCase
- class명 : snakeCase
- 변수명 및 함수명: camelCase

## 인코딩

- 모든 html, css, js 파일 인코딩 : UTF-8
- 한글이 포함된 파일에서 인코딩 문제가 발생하지 않도록 한다.

## 기존 코드 우선 사용

기존 코드는 최대한 수정하지 않고 사용한다.
작업 전 반드시 다음 항목을 확인한다.

- 기존 HTML 구조
- 기존 CSS
- 기존 JavaScript
- 기존 공통 함수
- 기존 UI 컴포넌트
- 기존 API 호출 방식
- 기존 이벤트 처리 방식

기존에 동일하거나 유사한 기능이 존재하는 경우 신규 코드를 만들기보다 기존 코드를 우선 사용한다.

## 신규 코드 작성

새로운 코드가 추가되는 경우 기존 코드와 충돌하지 않도록 한다.
특히 다음 항목은 기존 코드와 이름이 겹치지 않도록 확인한다.

- ID
- Class
- 변수명
- 함수명
- 전역변수
- 이벤트
- API 관련 함수

단, 기존 프로젝트에서 사용하는 공통 네이밍 규칙이 있는 경우 해당 규칙을 우선한다.

# Figma

## 계정정보

- ID : 7ceotax@gmail.com
- PW : anwlro3880!
- 링크 : https://www.figma.com/design/ShZULxeB28pfSh43N0vIud/%EC%96%B4%EB%93%9C%EB%AF%BC%EC%84%BC%ED%84%B0?node-id=0-1

# UI/UX

## 기본 원칙

- UI는 사용자가 직관적으로 이해할 수 있도록 구현한다.
- 다음 원칙을 기본으로 한다.
  - 일관된 UI
  - 명확한 정보 구조
  - 명확한 버튼 구분
  - 적절한 여백
  - 읽기 쉬운 텍스트
  - 명확한 상태 표시
  - 불필요한 UI 최소화
  - 사용자가 다음 행동을 쉽게 이해할 수 있도록 구성

## UI 상태

- 모든 주요 UI 요소는 필요한 상태를 확인한다.
  - Default
  - Hover
  - Focus
  - Active
  - Selected
  - Disabled
  - Loading
  - Error
  - Success
  - Empty
- Figma에 상태가 정의되어 있다면 해당 디자인을 기준으로 구현한다.

# 브라우저 호환성

- 기존 프로젝트에서 지원하는 브라우저를 우선 확인한다.
- 최신 브라우저에서만 동작하는 기능을 임의로 사용하지 않는다.
- 기존 프로젝트의 브라우저 지원 범위를 유지한다.

# 빌드 및 테스트

## 테스트 설정은 appsettings.json의 Operation.Mode를 사용한다.

"Operation": {
//"Mode": "oper",
"Mode": "dev"
}

## 테스트 환경

- Mode = dev
- 테스트 Web Server에서 사용한다.

## 운영 환경

- Mode = oper
- 운영 Web Server에서 사용한다.
- 개발 및 테스트 작업 시 기본적으로 dev를 사용한다.
- 운영 설정으로 임의 변경하지 않는다.

# 이미지 경로

- 코딩 경로 : https://img.self-tax.kr/admin/
- 저장 경로 : D:/workspaces/site_images/admin.self-tax.kr/

- 이미지를 추가할 경우 기존 이미지가 있는지 먼저 확인한다.
- 동일하거나 유사한 이미지가 존재하면 기존 이미지를 우선 사용한다.
- 이미지의 실제 크기와 화면 표시 크기를 확인한다.
- 이미지 비율이 변경되지 않도록 한다.

# IIS 셋팅 정보

- IIS Site Name: RbAdminCenter
- Physical Path: D:\workspaces\Rainbow\Front\RbAdminCenter\bin\Debug\net5.0
- Test URL: http://localhost:81/
  Application Pool: RbAdminCenterPool
  .NET Runtime: .NET 8
  Pipeline: Integrated

- 사용자의 명시적인 요청 없이 변경하지 않는다.

# 텍스트 검사

- 화면에 표시되는 모든 문구는 다음 항목을 확인한다.

- 오타
  - 오타확인하기
  - 문맥상 맞지 않은 거 확인하기
  - 문구를 유저가 확인했을때, 간단하고 명료한지 확인하기
  - 숫자에 들어가는 콤마 또는 퍼센트 확인하기

- 문맥
  - 문맥상 맞지 않는 문구가 있는지 확인한다.

- 사용자 관점
  - 사용자가 확인했을 때 문구가 다음 조건을 만족하는지 확인한다.
  - 간단한가?
  - 명확한가?
  - 이해하기 쉬운가?
  - 불필요하게 길지 않은가?
  - 행동을 명확하게 전달하는가?

- 숫자
  - 숫자가 표시되는 경우 다음을 확인한다.
    - 천 단위 콤마
    - 소수점
    - 퍼센트 %
    - 금액 단위
    - 날짜 형식
    - 음수 표시
    - 0 표시
- 단, 실제 데이터 형식이 존재하는 경우 해당 데이터 규칙을 우선한다.

## 문서 파일생성시

- 허용 확장자 : .ppt, .xlsx, .pdf
- 기본 저장 경로 : D:/project_file/RbAdminCenter
- 내부 지정한 폴더 내부에 생성

# 퍼블리싱 작업 가이드 (별도 파일)

- 퍼블리싱, Figma 구현, 리포트(NewReport) 화면 작업 시 반드시 함께 확인한다.
- D:/workspaces/corp-rainbow/Rainbow/Front/RbAdminCenter/PUBLISH_GUIDE.md
  - Figma 액션 디자인, 이미지(SVG) 경로, CSS 추가/인코딩 규칙, ul 구조, 버튼 비활성화, 412px 모바일 레이아웃, 페이지별 결정사항
