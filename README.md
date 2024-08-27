# <img src="image.png" alt="Alt text" width="2.5%"/> EasyRP Project

-  ERP 시스템은 회사 및 가게 운영의 모든 부분을 한 곳에서 관리할 수 있게 해주는 비서 시스템이라고 생각하면 됩니다.
-  이 비서 시스템은 인사 관리, 각 물품(완제품, 원자재)의 재고, 자금, 생산 과정을 효율적으로 운영하게 도와줍니다.
-  저희 EasyRP는 어려운 ERP를 일반인들도 쉽게 사용할 수 있도록, 소규모 회사 및 소규모 가게 운영에 적용할 수 있게 만든 ERP 프로젝트입니다.

   <img src="https://github.com/PARKKANGCHAN/project-teamsecond-easyrp/assets/152882330/21671aa4-8071-4a1f-956b-608c25760ca3" alt="mainpage" width="90%">

## 🧑‍🤝‍🧑 팀원 구성 <총 인원 5명>

-  이OO (팀장/자재 관리)
-  손OO (팀원/구매 관리)
-  하OO (팀원/기초 정보 관리 및 구매 관리)
-  류OO (팀원/영업 관리)
-  박현우 (본인/팀원/기초 정보 관리 및 영업 관리)

## 📅 개발기간

-  2024년 4월 26일 ~ 2024년 5월 24일

## 💻 개발 환경

-  Back-end : Java11, Spring Legacy Project
-  Fornt-end : HTML, CSS(BootStrap5), jQuery(JavaScript)
-  형상관리 : Git, Github, Sourcetree
-  협업툴 : Google Sheets, Discord
-  Database : MySQL (AWS RDS 서버 이용)
-  IDE : Eclipse, VSC

## 📚 이번 프로젝트로 학습한 점

-  이번 프로젝트는 생소한 ERP 시스템을 구현하는 과정에서 목표 시스템 구현을 위한 `업무 파악의 중요성`을 깊이 학습하였습니다.
-  이전 프로젝트보다 규모가 크고 참여 인원이 증가함에 따라, `프로젝트 규칙 설정 및 회의의 중요성`을 더 깊이 이해하고 이를 실천하였습니다.
   -  <details> <summary style="font-size: 1rem;">프로젝트 규칙</summary><div markdown="1"><img src="https://github.com/user-attachments/assets/1d6486e7-8bb7-4c2b-90c8-4a52f8525985" alt="프로젝트 규칙"></div></details>
   -  <details> <summary style="font-size: 1rem;">회의 내용</summary><div markdown="1"><img src="https://github.com/user-attachments/assets/e403bef0-eacc-4305-98dc-de11d74ded8f" alt="회의 내용"></div></details>
-  복잡한 프로젝트 특성상, 팀원 간의 원활한 소통을 위해 `직관적인 주석 사용의 중요성`을 인식하고 이를 실천하였습니다.
   -  <details> <summary style="font-size: 1rem;">주석 사용 예시</summary><div markdown="1"><img src="https://github.com/user-attachments/assets/a7046ed6-39d4-40a8-91eb-5a0c673b8661" alt="프로젝트 주석"></div></details>
-  작업 페이지의 컨텍스트를 유지하면서 추가 작업을 진행할 수 있도록 `Bootstrap 5의 modal`을 효과적으로 활용하였습니다.
-  ERP 시스템의 핵심인 전사적 관리 시스템을 주의 깊게 고려하여, `기초 정보 등록 -> 판매 계획 및 수주 등록 -> 판매 및 자재 관리 프로세스`를 염두에 두고 진행하였습니다.

## ⭐ 프로젝트 초기 문서 및 준비 자료

<details>
<summary style="font-size: 1.5rem;">ERD</summary>
<div markdown="1">
<img src="https://github.com/user-attachments/assets/d27f3c07-594f-4339-88a6-ea2790755f8d" alt="ERD">
</div>
</details>

<details>
<summary style="font-size: 1.5rem;">화면정의서</summary>
<div markdown="1">
<img src="https://github.com/user-attachments/assets/51339153-b08d-4162-b43c-579b299fe273" alt="화면정의서">
</div>
</details>

<details>
<summary style="font-size: 1.5rem;">기능정의서 및 프로젝트 일정관리</summary>
<div markdown="1">
<img src="https://github.com/user-attachments/assets/c0df604a-4aa8-42e0-9ff5-0b05bfa40162" alt="기능정의서">
</div>
</details>

## ⭐ 제가 맡은 부분 및 시연 사진

-  화면정의서
   -  화면정의서를 정리 함에 따라, 팀원들이 어떤 목표를 향해 프로젝트 구현을 할 지 방향성 제시
   -  <details> <summary style="font-size: 1rem;">화면정의서 구체적 예시 사진</summary><div markdown="1"><img src="https://github.com/user-attachments/assets/51339153-b08d-4162-b43c-579b299fe273" alt="화면정의서"></div></details>
-  전반적인 Front-end 관리 및 공통 CRUD 화면 및 모달 생성
   -  테마 및 레이아웃 설정 및 전반적인 Front-End 역할 수행
   -  UI/UX 편의성을 위하여, 팀 공통으로 사용할 테이블(게시판,등록화면 등) 및 모달 디자인 생성
   -  <details> <summary style="font-size: 1rem;">공통 사용 CRUD 및 모달 시연 사진</summary><div markdown="1"><h4>등록</h4><img src="https://github.com/user-attachments/assets/8abe4bd6-0f5c-4112-9766-a6a3d9f8fa5e" alt="BOM등록"> <h4>상세페이지 및 수정(수정버튼 누를 시 해당 페이지에서 바로 수정가능하도록, disalbe 부분 삭제 및 각종 버튼 활성화)</h4><img src="https://github.com/user-attachments/assets/5720230b-b3b3-490c-bd3e-e749a94b5ddc" alt="BOM상세페이지"><h4>수정 버튼 활성화 예시</h4><img src="https://github.com/user-attachments/assets/fca24bb3-a359-4611-b205-4f944427ab5b" alt="수정버튼활성화"><h4>공통 모달 예시(이 모달안에서 CRUD 전체 가능하도록 구현)</h4><img src="https://github.com/user-attachments/assets/dbc3cf4e-8f0d-4475-96d9-08930818662e" alt="공통모달"></div></details>
-  이번 프로젝트는 `기초 정보 등록 -> 영업 관리 -> 구매 관리 -> 자재 관리` 의 순으로 진행되고, 저는 기초 정보 등록 및 영업 관리 일부분을 담당하였습니다.
   -  로그인 기능 (사원 등록을 관리자가 진행하면, 지정된 사원 코드 및 비밀번호로 로그인 가능)
   -  기초 정보 등록 (부서, 창고, 거래처, 제품, 자재, BOM) CRUD 기능 (공통 CRUD쪽을 구현하며 함께 구현, 예시는 `공통 사용 CRUD 및 모달` 토글 참고부탁드립니다.)
   -  수주 관리 부분에서 수주 전표 생성 및 출력 기능 구현
      -  <details> <summary style="font-size: 1rem;">수주 전표 기능 시연 사진</summary><div markdown="1"><h4>해당 수주건의 제품이 전체 출고가 되었으면, 게시판 내 거래명세서 발급 버튼 활성화</h4><img src="https://github.com/user-attachments/assets/53d40d53-29c1-4aef-a853-58482fec5f38" alt="수주전표 게시판 예시"> <h4>수주번호 ord095 제품의 거래명세서 발급</h4><img src="https://github.com/user-attachments/assets/cda5fd69-1172-4c79-943e-177332b74dd8" alt="거래명세서"><h4>해당 게시판을 새로 고침 거래명세서를 한번 이상 발급하였으면, 거래명세서 재발급 버튼으로 변경(이를 통해 해당 거래명세서가 고객에게 한번이라도 전달이 되었는지를 확인 가능)</h4><img src="https://github.com/user-attachments/assets/25f09e97-f761-4a5d-9af8-7d5288cf0155" alt="거래명세서 버튼 변경"></div></details>
   -  출고 완료가 된 수주건에 대해 매출 마감 기능
      -  <details> <summary style="font-size: 1rem;">매출마감 기능 시연 사진</summary><div markdown="1"><h4>출고가 완료된 수주건을 알아서 게시하며, 체크박스를 통해 매출 마감 등록 가능( 해당 사진은 이미 매출 마감이 된 수주건을 체크 했을 시  사용자에게 alert을 주는 모습도 함께 보여줍니다.)</h4><img src="https://github.com/user-attachments/assets/acb5c0b3-9b7f-42e2-97b3-b041605e67ff" alt="매출 마감 시연 사진"></div></details>
   -  개별 수주건에 대하여 수금 등록 및 완료 처리 기능
      -  <details> <summary style="font-size: 1rem;">수금 관리 기능 시연 사진</summary><div markdown="1"><h4>수금 등록부분에서 수주는 되었지만, 수금 등록이 되지 않은 건에 대해서 등록 가능(모달 활용) </h4><img src="https://github.com/user-attachments/assets/7c6dd5fc-6260-487e-964e-3d2d73516bcd" alt="수금 등록 예시"> <h4>등록된 수금 현황을 볼수있는 게시판</h4><img src="https://github.com/user-attachments/assets/a33cf747-9a5c-4246-a52b-fc1edae055d0" alt="수금게시판"></div></details>

## 🎯 트러블 슈팅

### 1. 생소한 프로젝트, 팀원들간의 의사소통 어려움

### 문제점

-  이번 ERP 프로젝트는 쇼핑몰 같은 일반적인 웹사이트와는 다르게, 일반 사용자들이 접해보기 힘든 복잡한 시스템이었습니다.
-  팀원들 간의 ERP 시스템에 대한 이해도 차이로 인해, 초기 요구사항 정의 및 기능 설계에서 혼란이 발생하였습니다.
-  결과적인 문제로, 프로젝트 진행 속도를 아주 크게 저하시키는 요인이 되었습니다.

### 해결 과정

-  대표적인 ERP 프로그램(더존 ERP, Ecount ERP, 우리장부 등)을 설치하고, 팀원들과 함께 사용해보며 핵심 기능과 흐름을 직접 체험했습니다.
-  프로젝트 진행 중 이해가 되지 않는 부분이 있을 때마다, 짧은 스프린트 회의를 자주 열어 각자의 이해도를 맞추고, 역할 분담을 명확히 하였습니다.
-  특히, 복잡한 기능을 시각적으로 이해할 수 있도록 화이트보드와 온라인 협업 도구를 활용하여 흐름도를 그리며 토론했습니다.
   <img src="https://github.com/user-attachments/assets/1a3f8a52-f570-4842-88e5-564513d9ab5a" alt="화이트보드 흐름도"  width="50%">

### 결과 및 교훈

-  팀원 간의 소통을 강화한 결과, ERP 시스템의 핵심 개념을 모두가 명확히 이해하게 되었고, 프로젝트의 진행 속도와 품질이 크게 향상되었습니다.
-  이 경험을 통해, 특히 복잡한 프로젝트에서는 지속적이고 명확한 의사소통이 성공적인 협업의 핵심이라는 중요한 교훈을 얻었습니다.
