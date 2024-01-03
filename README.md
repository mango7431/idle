# 5조 IDLE 최종 프로젝트

## 프로젝트명
중고링 <br>
"중고거래의 판매자와 구매자를 연결해주는 링크"

## 🖥️프로젝트 소개

- 기존 중고거래 사이트의 물건 구하기 기능의 접근성이 불편하여 '구해요'를 전면에 노출시켜 접근성을 높힌 프로젝트입니다.


## 🕰️개발 기간
- 23.06.13. - 23.07.22.

### **🧑‍🤝‍🧑구성원**
👑 **팀장** :  [윤영웅님](https://github.com/mango7431) <br>
🙂 **팀원** :  [김애리님](https://github.com/zjadofl) <br>
🙂 **팀원** :  [김희강님](https://github.com/kile449) <br>
🙂 **팀원** :  [임수정님](https://github.com/ImSoojeong) <br>
🙂 **팀원** :  [진가영님](https://github.com/JINGAJINGA) <br>

## 팀역할
| 이름 | 기능 |
| --- | --- | 
| 윤영웅님 | 메인페이지 <br> 채팅 <br> 관리자 - 게시글 관리 <br> 중고거래 CRUD <br> 구매자 판매자 1:1 채팅|
| 김애리님 | 알림 (채팅, Q&A) <br> 관리자 - 회원 관리  <br> Q&A CRUD | 
| 김희강님 | 내 상점 - 내 거래 목록 <br> 공지사항 CRUD (회원, 관리자) |
| 임수정님 | 신고 <br> 내 상점-내가 쓴 글, 내 찜 목록 <br> 목록 정렬 및 검색 |  
| 진가영님 | 로그인 및 회원가입 (회원) <br> 마이페이지 - 내 정보 수정 (회원) <br> 관리자 Q&A 답글 CRUD (관리자) |

## ⚙️개발 환경
- `Java 11`
- `JDK 11.0.2`
- **IDE** : STS 3.9
- **Framework** : SpringFramework(5.x)
- **Database** : Oracle DB(11xe)
- **ORM** : Mybatis

---

#### 🤝 Collaboration Tools 🤝
- Notion <br>
- Slack <br>
- Figma <br>
- Github <br>
- Google Drive <br>
- Draw.io <br>


#### 🛠 Project Tools 🛠 
![Static Badge](https://img.shields.io/badge/Eclipse-2C2255?style=flat&logo=Eclipse&logoColor=white) ![Static Badge](https://img.shields.io/badge/GitHub-181717?style=flat&logo=GitHub&logoColor=white) ![Static Badge](https://img.shields.io/badge/SQLDeveloper-000000?style=flat&logo=SQLDeveloper&logoColor=white)

#### 📚 Tech Stack 📚 
**프론트엔드** <br>
![Static Badge](https://img.shields.io/badge/HTML-E34F26?style=flat&logo=HTML5&logoColor=white) ![Static Badge](https://img.shields.io/badge/CSS-1572B6?style=flat&logo=CSS3&logoColor=white) ![Static Badge](https://img.shields.io/badge/Javascript-F7DF1E?style=flat&logo=Javascript&logoColor=white) ![Static Badge](https://img.shields.io/badge/JQuery-0769AD?style=flat&logo=JQuery&logoColor=white) ![Static Badge](https://img.shields.io/badge/Bootstrap-7952B3?style=flat&logo=Bootstrap&logoColor=white) 

**백엔드** <br>
![Static Badge](https://img.shields.io/badge/Java-007396?style=flat-square&logo=Java&logoColor=white) ![Static Badge](https://img.shields.io/badge/SpringFramework-6DB33F?style=flat&logo=CSS3&logoColor=white) ![Static Badge](https://img.shields.io/badge/oracle-F80000?style=flat&logo=CSS3&logoColor=white) ![Static Badge](https://img.shields.io/badge/ApacheTomcat-F8DC75?style=flat&logo=Bootstrap&logoColor=white) 


## 📌주요 기능
### 사용자
**회원**
- 회원가입
- 로그인
- 내상점 : 내 거래 목록, 내가 쓴 글, 내 찜 목록
- 마이페이지 : 회원 정보 수정 & 회원 탈퇴, 내 Q&A 목록 등록/수정/삭제

<br>

**중고거래**
- 판매글, 구매글 등록/수정/삭제/검색/정렬
- 찜(등록, 삭제), 채팅, 신고하기


<br>

**채팅**
- 채팅목록 확인, 안 읽은 메세지
- 1:1 실시간 채팅, 구매확정

<br>

**알림**
- 채팅, Q&A 알림

<br>

**공지사항**
- 공지사항 확인/검색

<br>



### 관리자
**회원관리**
- 전체 가입된 회원 확인
- 회원 상세페이지에서 회원 탈퇴 처리

<br>

**게시글 관리**
- 게시글 상세페이지에서 경고 증가/감소, 글 삭제 가능
- 작성자의 누적된 신고 건수 확인 가능

<br>

**신고 관리**
- 회원신고 / 게시글 신고 구분
- 미처리 신고 수 확인 가능
- 경고 증가/감소, 글 삭제

<br>

**공지사항 관리**
- 공지사항 등록/수정/삭제/검색

<br>

**Q&A목록**
- Q&A 목록, Q&A 답글 등록/수정/삭제
