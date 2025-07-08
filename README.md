<details>
<p align="center">
  <img src="https://github.com/user-attachments/assets/33172a31-5efb-4c38-bd91-208887c8c167" width="200" alt="AniMeds Logo" />
</p>

<h1 align="center">🐾 <strong>AniMeds</strong></h1>
<p align="center"><em>Smart Medication for Pets</em></p>

<p align="center">
  반려동물 맞춤형 약물 추천 및 복약 관리 플랫폼  
  <br />
  <strong>동물의 건강을 위한 똑똑한 약물관리, AniMeds와 함께 하세요.</strong>
</p>

---

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=soft&color=0:FAF3E0,100:5DA8D2&height=80&section=footer&text=AniMeds&fontSize=40&fontColor=ffffff&animation=fadeIn" />
</p>

## 📚 Table of Contents

- [👥 팀원 소개](#-팀원-소개)
- [🌟 프로젝트 개요](#-프로젝트-개요)
- [💡 개발 배경 및 필요성](#-개발-배경-및-필요성)
- [🔧 주요 기능](#-주요-기능)
- [📅 프로젝트 진행 일정 (WBS)](#-프로젝트-진행-일정-wbs)
- [📋 요구사항 명세](#-요구사항-명세)
  - [✅ 기능 요구사항](#-기능-요구사항)
  - [🚫 비기능 요구사항](#-비기능-요구사항)
- [🗂️ 데이터베이스 설계](#-데이터베이스-설계)
- [🧪 샘플 데이터 삽입 (DML)](#-샘플-데이터-삽입-dml)
- [🧠 저장 프로시저 예시](#-저장-프로시저-예시)
- [💬 시나리오](#-시나리오)
- [🚀 기술 스택](#-기술-스택)
- [📁 프로젝트 구조](#-프로젝트-구조)
- [⬆️ 향후 아이디어](#-향후-아이디어)
- [🐾 About AniMeds](#-about-animeds)
- [🎓 회고록](#-회고록)
---

## 👥 팀원 소개

| <img src="https://cdn.discordapp.com/attachments/1387787445688602627/1390216556306235402/raw.png?ex=6867738f&is=6866220f&hm=a1389d7031f81e2b9d4e6f900c6b00f94729bd67f0966739c9ab76f3bc01ca7c&" width="200"><br>안진기     | <img src="https://cdn.discordapp.com/attachments/1387787445688602627/1390221621083504732/360_F_932850177_raUQAsyZufzMKXJtOWG38g9mo8IGJfAO.png?ex=68677847&is=686626c7&hm=102868583d91041d9519490bd279b1cc7bbc5307799744a7f655ce811759a848&" width = "200"><br>김민수              | <img src="https://github.com/user-attachments/assets/9a10061c-7c47-440c-ab35-3836f292e39a" width = "200"><br>이승진 |  <img src="https://cdn.discordapp.com/attachments/1387787445688602627/1390224317664591944/image.png?ex=68677aca&is=6866294a&hm=e5d09dd97cfd810a09058bb7f17fdea91f569347ff452688ae0673c7d1d3a2ee&" width = "200"> 이원진 | <img src="https://cdn.discordapp.com/attachments/1387787445688602627/1390218383307444295/i15052477984.jpg?ex=68677543&is=686623c3&hm=629e4d5a94d662705d11e8cfb2fb46b47cd7dfe68b9ee5db5c69c3eb88075f03&" width = "200"> <br>최정우 | <img src="https://www.urbanbrush.net/web/wp-content/uploads/edd/2023/03/urban-20230313100151814187.jpg" width = "200"> <br>박채연 |
|----------|------------------|-----------|----|---|------|
| <p align="center">팀장</p> |<p align="center">팀원</p>| <p align="center">팀원</p>|<p align="center">팀원</p>|<p align="center">팀원</p>|<p align="center">팀원</p>|
| <p align="center"> <a href="https://github.com/Jinki-Ahn"> <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white" /> </a> |<p align="center"> <a href="https://github.com/minsu47722"> <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white" /> </a> </p> | <p align="center"> <a href="https://github.com/jintory"> <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white" />  </a> </p> | <p align="center"> <a href="https://github.com/sumgo-ssri"> <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white" /> </a> </p> | <p align="center">  <a href="https://github.com/JJJJungw"> <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white" /> </a> </p> | <p align="center">  <a href="https://github.com/pcochoco"> <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white" />  </a> </p> |

---

## 🌟 프로젝트 개요

**AniMeds**는 반려동물의 증상에 따른 약물 추천, 금기 정보 제공, 처방 이력 관리 및 커뮤니티를 통합한 플랫폼입니다.  
사용자에게 안전하고 정확한 반려동물 복약 환경을 제공하는 것을 목표로 합니다.

---

## 💡 개발 배경 및 필요성

## 📊 2017–2024년 대한민국 반려동물 양육 인구 비율 추이

2024년 농림축산식품부가 동물복지 국민의식조사를 실행한 바탕으로 약 28.6%에 달하는 국내 반려동물 양육인구 비율을 발표했습니다.
이는 그래프에서 확인할 수 있듯 매년 증가하는 추세입니다.
<p align="center">
  <a href="https://www.dailyvet.co.kr/news/policy/234742">
    <img src="https://github.com/user-attachments/assets/23825b24-6c1b-495b-a066-1b2fd5d01efd" alt="반려동물비율_국내" width="600">
  </a>
</p>
또한 농림축산식품부는 국내 반려동물 시장을 2022년 기준 약 8.5조원으로 추산하고 2032년 약 21조원으로 예측했습니다.
<p align="center">
  <a href="https://www.dailyvet.co.kr/news/industry/214784">
    <img src="https://github.com/user-attachments/assets/d5a7ecce-f093-4a6c-a39f-ed239bb69c51" alt="반려동물비율_국내" width="300">
  </a>
</p>



그러나 동일한 해 서울디지털재단이 해당 부 동물보호관리시스템에 등록된 데이터로 동물병원 현황을 분석한 결과를 바탕으로 서울시 기준 병원 1개소당 662마리의 반려견을 담당하고 있음을 확인할 수 있습니다.

이러한 점을 바탕으로 매년 증가하는 반려동물의 비율에 반해 부족한 의료시설과 그로 이어지는 적절한 치료와 처치의 공백이라는 문제를 발견했습니다. 

반려동물 양육자들이 증가함에 따라 반려동물 건강에 대한 관심 또한 상승했습니다. 그러나 값비싼 병원비로 인해 자가치료에 대한 의존도가 높습니다.
실제로 KB경영연구소가 작성한 ‘2025 한국 반려동물 보고서’에서는 2023년-2025년 반려동물 가구 평균 지출 치료비가 146.3만원이며 2년간 평균 37만원은 동물병원 밖에서 이루어지는 치료 금액으로 추정하고 있습니다. 

<p align="center">
  <a href="https://www.dailyvet.co.kr/news/practice/companion-animal/250748">
    <img src="https://github.com/user-attachments/assets/b9a70b46-4727-484c-a6af-16e2a7390c42"  width="600">
  </a>
</p>

[한정적인 동물 병원 진료 기록 공개](https://www.joongdo.co.kr/web/view.php?key=20250327010008570)와 병원비 상승 등으로 인해 반려동물의 치료에 대한 가격을 감당하기 힘든 양육자들의 차선책입니다. 그럼에도 불구하고 동물의 의료 기록 유지 기간이 짧고 병원별 비용이 격차가 있는 등 의료 체계가 사람에 비해 불명확함에 따라 양육자의 반려동물이 어떤 질환을 가지고 있는지와 그에 관한 처치의 범위에 대한 이해가 부족합니다.

질병과 관련한 지식이 없는 처치 행위는 특히나 약물 오남용 등 부작용으로 질병을 악화시키는 문제로 번질 수 있는 점에서 반려동물에 대한 적절한 치료 용도의 정보의 투명화와 통합적 제공이 필요합니다.


- ❌ 기존 정보는 흩어져 있고, 종에 따라 금기 약물 정보가 명확하지 않음  
- 🐶 사용자 맞춤형 복약 정보 필요 (나이/종/체중에 따라)
- 💬 보호자 간 소통 채널 부족 → 커뮤니티 필요  
- 📢 병원과 제품 광고도 관리 가능한 통합 플랫폼 필요

---

## 🔧 주요 기능

<!-- 상단 3개 -->
<table align="center">
  <tr align="center">
    <td>
      <img src="https://github.com/user-attachments/assets/34efc7d2-85ec-45c2-aa0d-fa95e06c0e3b" width="100" /><br/>
      <strong>사용자/동물 등록</strong>
    </td>
    <td style="width: 80px;"></td> <!-- 간격 -->
    <td>
      <img src="https://github.com/user-attachments/assets/cd820192-bdbc-481c-bd3f-ad4befc2388e" width="100" /><br/>
      <strong>증상 기반 약 추천</strong>
    </td>
    <td style="width: 80px;"></td>
    <td>
      <img src="https://github.com/user-attachments/assets/8ab0c591-45ae-4a76-b855-22e35d20682b" width="100" /><br/>
      <strong>복약 이력 관리</strong>
    </td>
  </tr>
</table>

<br/>

<!-- 하단 4개 -->
<table align="center">
  <tr align="center">
    <td>
      <img src="https://github.com/user-attachments/assets/6eb7592c-173b-4adb-a53a-2e6a5108dd15" width="100" /><br/>
      <strong>약물 상호작용</strong>
    </td>
    <td style="width: 60px;"></td>
    <td>
      <img src="https://github.com/user-attachments/assets/31a9bb98-2355-4556-9754-fcac35bec4f3" width="100" /><br/>
      <strong>병원 광고 노출</strong>
    </td>
    <td style="width: 60px;"></td>
    <td>
      <img src="https://github.com/user-attachments/assets/0e180be8-5cd7-4919-95fc-3ee16e1dcab1" width="100" /><br/>
      <strong>커뮤니티</strong>
    </td>
    <td style="width: 60px;"></td>
    <td>
      <img src="https://github.com/user-attachments/assets/ab7b35f9-8fed-4d67-89a3-080f621c449f" width="100" /><br/>
      <strong>제휴 상품 추적</strong>
    </td>
  </tr>
</table>

## 1. 사용자/동물 등록
- 회원가입 및 로그인/로그아웃
- 회원 정보 수정 및 탈퇴
- 반려 동물 등록 및 삭제
- 반려 동물 정보 수정

## 2. 증상 기반 약 추천
- 반려 동물의 증상 입력
- 증상에 해당하는 약물 추천 및 상세 정보 제공

## 3. 복약 이력 관리
- 등록된 반려 동물의 증상 및 추천 의약 제품 정보 저장
- 자주 찾는 약물에 대한 자동 추천

## 4. 약물 상호 작용
- 추천 받은 약물과 같이 복용 시 위험한 약물에 대한 정보 제공

## 5. 커뮤니티
- 커뮤니티를 통한 반려 동물 양육자들 간 커뮤니케이션 공간 제공
- 글쓰기, 댓글 쓰기, 좋아요를 기반으로 한 정보 공유

## 6. 병원 광고 노출과 제휴 상품 추적
- 동물 병원의 광고와 제휴 업체를 통한 폭넓은 정보 제공
- 약물 추천을 제외한 추가적인 동물 병원 제품 추천
- 동물 병원과 약국 위치 정보 제공

---

## 📅 프로젝트 진행 일정 (WBS)
![image](https://github.com/user-attachments/assets/7112814b-3aa7-48ec-8944-a977059e8d3e)


[프로젝트 진행 일정(wbs)](https://docs.google.com/spreadsheets/d/1220bBuBJ12cd4qBncc2iErHQUT1RVwtTA3J0CJ5_gtg/edit?gid=0#gid=0)

---

## 📋 요구사항 명세

## 🧾 요구사항 정의서
![image](https://github.com/user-attachments/assets/3bfd4f75-52e3-48b6-b837-25336a56bae1)

 [요구사항 정의서](https://docs.google.com/spreadsheets/d/1ezIGvaFNwkBmDPlIIaDlnmjDzN0-As8Hf1kQjH_DhoM/edit?gid=0#gid=0)

## ✅ 기능 요구사항
- 사용자 계정 CRUD
- 동물 등록 및 정보 조회
- 증상 기반 약물 추천 (금기, 권장용량 고려)
- 사용자 처방 기록 저장
- 커뮤니티 글 작성 및 열람
- 병원 광고 노출 및 클릭 이벤트 추적
--
## 🚫 비기능 요구사항
- 인증 토큰 기반 세션 관리 (JWT 등)
- 인덱스를 활용한 검색 성능 최적화
- 반응형 UI 지원 (모바일/PC)
- 데이터 무결성 보장 (외래키, 제약조건 등)

---

## 🗂️ 데이터베이스 설계

### ERD
![image](https://github.com/user-attachments/assets/df9b3a9f-e95b-4437-a15b-a3210e2903a6)


### 아키텍처
![Image](https://github.com/user-attachments/assets/d39fcda0-7dba-4f9d-86a3-4240078a4a49)

### Schema DDL
### 1. 약물 간 상호작용 정보

```sql
-- 약물 간 상호작용 정보
-- 두 약물 간의 위험 수준과 상세 설명을 저장
CREATE TABLE DrugInteraction (
    interaction_id INT PRIMARY KEY AUTO_INCREMENT,  -- 상호작용 ID
    drug_id_1 INT,                                  -- 첫 번째 약물 ID
    drug_id_2 INT,                                  -- 두 번째 약물 ID
    interaction_risk VARCHAR(50),                   -- 위험 수준 (예: 높음, 중간, 낮음)
    interaction_detail TEXT,                        -- 상호작용 상세 설명
    FOREIGN KEY (drug_id_1) REFERENCES Drug(drug_id),
    FOREIGN KEY (drug_id_2) REFERENCES Drug(drug_id)
);
```

### 2. 커뮤니티 게시글

```sql
-- 커뮤니티에 작성된 게시글 정보를 저장
CREATE TABLE Community (
    post_id INT PRIMARY KEY AUTO_INCREMENT,     -- 게시글 ID
    user_id INT,                                -- 작성자 사용자 ID
    title VARCHAR(255),                         -- 제목
    content TEXT,                               -- 내용
    created_at DATETIME,                        -- 작성일
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);
```

### 3. 병원 마스터

```sql
-- 병원 기본 정보
CREATE TABLE Clinic (
    clinic_id INT PRIMARY KEY AUTO_INCREMENT,   -- 병원 ID
    name VARCHAR(100),                          -- 병원 이름
    address VARCHAR(255),                       -- 주소
    contact VARCHAR(50),                        -- 연락처
    specialties TEXT                             -- 전문 진료 과목
);
```

### 4. 병원 광고 정보

```sql
-- 병원 광고 정보를 종과 증상에 따라 저장
CREATE TABLE VetAd (
    ad_id INT PRIMARY KEY AUTO_INCREMENT,       -- 광고 ID
    clinic_id INT,                              -- 병원 ID
    target_species_id INT,                      -- 타겟 종 ID
    target_symptom_id INT,                      -- 타겟 증상 ID
    priority INT,                               -- 광고 우선순위
    start_date DATE,                            -- 광고 시작일
    end_date DATE,                              -- 광고 종료일
    FOREIGN KEY (clinic_id) REFERENCES Clinic(clinic_id),
    FOREIGN KEY (target_species_id) REFERENCES AnimalSpecies(species_id),
    FOREIGN KEY (target_symptom_id) REFERENCES Symptom(symptom_id)
);
```

### 5. 광고 로그 기록

```sql
-- 광고 노출 및 클릭 등 이벤트 로그 저장
CREATE TABLE VetAdLog (
    log_id INT PRIMARY KEY AUTO_INCREMENT,      -- 로그 ID
    ad_id INT,                                  -- 광고 ID
    user_id INT,                                -- 사용자 ID
    animal_id INT,                              -- 동물 ID
    event_type VARCHAR(50),                     -- 이벤트 유형 (노출, 클릭 등)
    event_time DATETIME,                        -- 이벤트 발생 시각
    FOREIGN KEY (ad_id) REFERENCES VetAd(ad_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (animal_id) REFERENCES Animal(animal_id)
);
```

### 6. 병원 광고 예산 관리

```sql
-- 병원별 광고 예산 및 잔여 예산 관리
CREATE TABLE VetAdBudget (
    budget_id INT PRIMARY KEY AUTO_INCREMENT,   -- 예산 ID
    clinic_id INT,                              -- 병원 ID
    total_budget FLOAT,                         -- 전체 예산
    remaining_budget FLOAT,                     -- 남은 예산
    updated_at DATETIME,                        -- 마지막 수정일
    FOREIGN KEY (clinic_id) REFERENCES Clinic(clinic_id)
);
```

### 7. 제휴사 정보

```sql
-- 제휴사 정보 및 API 연동 URL 저장
CREATE TABLE Partner (
    partner_id INT PRIMARY KEY AUTO_INCREMENT,  -- 제휴사 ID
    name VARCHAR(100),                          -- 제휴사 이름
    commission_rate FLOAT,                      -- 수수료율
    api_url VARCHAR(255)                        -- API 연동 URL
);
```

### 8. 상품 정보

```sql
-- 제휴사 연동을 통해 등록된 상품 정보
CREATE TABLE Product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,  -- 상품 ID
    partner_id INT,                             -- 제휴사 ID
    name VARCHAR(100),                          -- 상품명
    description TEXT,                           -- 상품 설명
    image_url VARCHAR(255),                     -- 이미지 URL
    price FLOAT,                                -- 가격
    product_link VARCHAR(255),                  -- 상품 링크
    FOREIGN KEY (partner_id) REFERENCES Partner(partner_id)
);
```

### 9. 증상-상품 매핑

```sql
-- 증상과 종을 기준으로 상품을 연결
CREATE TABLE Symptom_Product_Map (
    map_id INT PRIMARY KEY AUTO_INCREMENT,      -- 매핑 ID
    symptom_id INT,                             -- 증상 ID
    species_id INT,                             -- 종 ID
    product_id INT,                             -- 상품 ID
    FOREIGN KEY (symptom_id) REFERENCES Symptom(symptom_id),
    FOREIGN KEY (species_id) REFERENCES AnimalSpecies(species_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
```

### 10. 상품 클릭 로그

```sql
-- 사용자 상품 클릭 이벤트 기록
CREATE TABLE ProductClickLog (
    click_id INT PRIMARY KEY AUTO_INCREMENT,    -- 클릭 로그 ID
    product_id INT,                             -- 상품 ID
    user_id INT,                                -- 사용자 ID
    click_time DATETIME,                        -- 클릭 시간
    event_type VARCHAR(50),                     -- 이벤트 유형
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);
```

### 11. 관심 상품 저장 내역

```sql
-- 사용자가 저장한 관심 상품 기록
CREATE TABLE UserSavedProduct (
    id INT PRIMARY KEY AUTO_INCREMENT,          -- 저장 ID
    user_id INT,                                -- 사용자 ID
    product_id INT,                             -- 상품 ID
    saved_at DATETIME,                          -- 저장 시각
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
```

### 12. 상품 태그 정보

```sql
-- 상품 카테고리/필터 태그
CREATE TABLE ProductTag (
    tag_id INT PRIMARY KEY AUTO_INCREMENT,      -- 태그 ID
    product_id INT,                             -- 상품 ID
    tag_name VARCHAR(50),                       -- 태그명 (예: 관절, 알러지)
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
```
### 13. 전체 인덱스 목록
<details>
  
```sql
  -- 증상 기반 약물 추천 시 빠른 매칭을 위한 복합 인덱스
CREATE INDEX idx_symptom_species ON Symptom_Drug_Map(symptom_id, drug_id);

-- 종(species)에 따른 약물 권장 여부 판단을 위한 인덱스
CREATE INDEX idx_drug_species ON DrugSpeciesMapping(drug_id, species_id);

-- 사용자 + 동물 기준 광고 로그 조회 성능 향상
CREATE INDEX idx_adlog_user_animal ON VetAdLog(user_id, animal_id);

-- 사용자별 클릭 로그 조회 성능 향상
CREATE INDEX idx_product_click_user ON ProductClickLog(user_id);

-- 상품별 클릭 로그 통계 집계에 활용
CREATE INDEX idx_product_click_product ON ProductClickLog(product_id);

-- 사용자의 관심 상품 리스트 빠른 조회를 위한 인덱스
CREATE INDEX idx_saved_product_user ON UserSavedProduct(user_id);

-- 증상 + 종 기준으로 상품 추천 시 빠른 필터링
CREATE INDEX idx_symptom_product ON Symptom_Product_Map(symptom_id, species_id);

-- 커뮤니티에서 특정 사용자의 글을 빠르게 불러오기 위한 인덱스
CREATE INDEX idx_community_user ON Community(user_id);

-- 사용자 ID + 등록일 기준 커뮤니티 글 정렬 최적화
CREATE INDEX idx_community_user_created ON Community(user_id, created_at);

-- 광고 로그 이벤트 시간 기준 정렬용 인덱스
CREATE INDEX idx_adlog_event_time ON VetAdLog(event_time);

--  상품 태그 검색 최적화를 위한 인덱스
CREATE INDEX idx_product_tag_name ON ProductTag(tag_name);

-- 병원 광고 유효 기간 내 필터링 성능 향상
CREATE INDEX idx_vetad_date_range ON VetAd(start_date, end_date);

-- 약물 상호작용 검색을 위해 양방향 조합 최적화
CREATE INDEX idx_drug_interaction_pair ON DrugInteraction(drug_id_1, drug_id_2);
```
</details>

---

## 🧪 샘플 데이터 삽입 (DML)

- [data/sample_data.sql](data/sample_data.sql)  
- 총 100건의 더미 데이터 삽입: `User`, `Animal`, `Symptom`, `Drug` 등
- 삽입 순서: User → Species → Animal → Symptom → Drug → Mapping
</details>
---

## 🧠 프로시저 실행 결과
### 👤 1. 사용자 및 반려동물 관리
<details>
<summary>1-1. 회원가입</summary>

  ```sql
DELIMITER $$

CREATE PROCEDURE sp_register_user (
    IN in_email VARCHAR(255),
    IN in_phone VARCHAR(20),
    IN in_password VARCHAR(100),
    IN in_name VARCHAR(100),
    IN in_role ENUM('보호자', '수의사', '관리자'),
    OUT out_user_id INT
)
BEGIN
    DECLARE v_exists INT DEFAULT 0;

    -- 1. 이메일 중복 검사
    SELECT COUNT(*) INTO v_exists 
	 FROM User 
	 WHERE email = in_email COLLATE UTF8MB4_UNICODE_CI ;
    IF v_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '이미 사용 중인 이메일입니다.';
    END IF;

    -- 2. 전화번호 중복 검사
    SELECT COUNT(*) INTO v_exists 
	 FROM User 
	 WHERE phone = in_phone COLLATE utf8mb4_unicode_ci;
    IF v_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '이미 사용 중인 전화번호입니다.';
    END IF;

    -- 3. 역할 유효성 검사 (ENUM이라 사실상 자동 됨 → 생략 가능)

    -- 4. 회원 등록
    INSERT INTO User (email, phone, password, name, role, created_at)
    VALUES (in_email, in_phone, in_password, in_name, in_role, NOW());

    -- 5. 새 user_id 반환
    SET out_user_id = LAST_INSERT_ID();
END$$

DELIMITER ;
```

![image](https://github.com/user-attachments/assets/52e81b9c-1b90-476a-8cc7-80646a1d90a7)

![image](https://github.com/user-attachments/assets/6cdbac9e-3874-4734-bd78-97c28114ce1a)


</details>

<details>
<summary>1-2. 로그인</summary>
	
```sql
	
DELIMITER $$

CREATE PROCEDURE sp_login_user (
    IN in_email VARCHAR(255) COLLATE utf8mb4_unicode_ci,
    IN in_password VARCHAR(100),
    OUT out_token VARCHAR(255)
)
BEGIN
    DECLARE v_user_id INT;
    DECLARE v_stored_password VARCHAR(100);
    DECLARE v_now DATETIME;

    SELECT user_id, password INTO v_user_id, v_stored_password
    FROM User
    WHERE email = in_email;

    IF v_user_id IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 사용자입니다.';
    END IF;

    IF v_stored_password != in_password THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '비밀번호가 올바르지 않습니다.';
    END IF;

    SET v_now = NOW();
    SET out_token = CONCAT('token_user_', v_user_id, '_', UNIX_TIMESTAMP(v_now));

    DELETE FROM UserSession WHERE user_id = v_user_id;

    INSERT INTO UserSession (user_id, token, created_at, expired_at)
    VALUES (v_user_id, out_token, v_now, DATE_ADD(v_now, INTERVAL 1 DAY));
END$$

DELIMITER ;
```
![image](https://github.com/user-attachments/assets/c11b7a60-a321-47eb-9419-d2163f10c03c)
![image](https://github.com/user-attachments/assets/09fe096e-dc91-4a97-acdf-f46682d6d5df)

</details>

<details>
<summary>1-3. 로그아웃</summary>
	
```sql

DELIMITER $$

CREATE PROCEDURE sp_logout_user (
    IN in_token VARCHAR(255)
)
BEGIN
    DECLARE v_exists INT;

    SELECT COUNT(*) INTO v_exists
    FROM UserSession
    WHERE token = in_token COLLATE utf8mb4_unicode_ci;

    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '유효하지 않은 세션 토큰입니다.';
    END IF;

    DELETE FROM UserSession
    WHERE token = in_token COLLATE utf8mb4_unicode_ci;
END$$

DELIMITER ;
```
![image](https://github.com/user-attachments/assets/a4910d3c-b0b1-4f89-9b90-371ce1e0b31f)
![image](https://github.com/user-attachments/assets/d08ad692-b7f0-49f8-ad2b-84cfaa734626)

</details>

<details>
<summary>1-4. 반려동물 등록</summary>

```sql
DELIITER $$
DROP PROCEDURE IF EXISTS sp_add_animal $$

CREATE PROCEDURE sp_add_animal (
    IN p_user_id INT,
    IN p_name VARCHAR(255),
    IN p_species_id INT,
    IN p_weight FLOAT,
    IN p_birth_date DATE,
    OUT out_animal_id INT
)
BEGIN
    DECLARE v_role ENUM('보호자', '수의사', '관리자');
    DECLARE v_exists INT;

    SELECT COUNT(*) INTO v_exists
    FROM User
    WHERE user_id = p_user_id;

    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 사용자입니다.';
    END IF;

    SELECT role INTO v_role
    FROM User
    WHERE user_id = p_user_id;

    IF v_role != '보호자' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '반려동물은 보호자만 등록할 수 있습니다.';
    END IF;

    SELECT COUNT(*) INTO v_exists
    FROM AnimalSpecies
    WHERE species_id = p_species_id;

    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 동물 종입니다.';
    END IF;

    INSERT INTO Animal (user_id, name, species_id, weight, birth_date)
    VALUES (p_user_id, p_name, p_species_id, p_weight, p_birth_date);

    SET out_animal_id = LAST_INSERT_ID();
END $$

DELIMITER ;
```
![image](https://github.com/user-attachments/assets/4cc0b336-ad3a-444f-89b1-63cbaf753e9f)
![image](https://github.com/user-attachments/assets/c8db92f4-ee53-47b4-8090-3c863b939d24)

</details>

<details>
<summary>1-5. 반려동물 목록</summary>

```sql
DELIMITER $$

DROP PROCEDURE IF EXISTS sp_get_user_animals $$

CREATE PROCEDURE sp_get_user_animals (
    IN p_user_id INT
)
BEGIN
    DECLARE v_exists INT;

    SELECT COUNT(*) INTO v_exists
    FROM User
    WHERE user_id = p_user_id;

    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 사용자입니다.';
    END IF;

    SELECT COUNT(*) INTO v_exists
    FROM Animal
    WHERE user_id = p_user_id;

    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '등록된 반려동물이 없습니다.';
    END IF;

    SELECT 
        a.animal_id,
        a.name,
        s.species_name,
        a.weight,
        a.birth_date
    FROM Animal a
    JOIN AnimalSpecies s ON a.species_id = s.species_id
    WHERE a.user_id = p_user_id;
END $$

DELIMITER ;
```
![image](https://github.com/user-attachments/assets/52d3e7ae-b6c8-42b0-bf91-a3be75d62360)
![image](https://github.com/user-attachments/assets/acd43f31-b0aa-4ea8-a6cb-3e881bb4c8df)

</details>

<details>
<summary>1-6. 처방 이력 조회</summary>

```sql
DELIMITER $$

DROP PROCEDURE IF EXISTS sp_get_animal_prescription_history $$

CREATE PROCEDURE sp_get_animal_prescription_history (
    IN p_user_id INT,
    IN p_animal_id INT
)
BEGIN
    DECLARE v_exists INT;

    SELECT COUNT(*) INTO v_exists
    FROM User
    WHERE user_id = p_user_id;

    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 사용자입니다.';
    END IF;

    SELECT COUNT(*) INTO v_exists
    FROM Animal
    WHERE animal_id = p_animal_id AND user_id = p_user_id;

    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '해당 반려동물은 이 사용자에게 속하지 않습니다.';
    END IF;

    SELECT COUNT(*) INTO v_exists
    FROM PrescriptionRecord
    WHERE animal_id = p_animal_id;

    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '처방 이력이 없습니다.';
    END IF;

    SELECT 
        pr.record_id,
        d.drug_name,
        s.description AS symptom,
        pr.dose_given,
        pr.date_given,
        pr.notes
    FROM PrescriptionRecord pr
    JOIN Drug d ON pr.drug_id = d.drug_id
    JOIN Symptom s ON pr.symptom_id = s.symptom_id
    WHERE pr.animal_id = p_animal_id
    ORDER BY pr.date_given DESC;
END $$

DELIMITER ;
```
![image](https://github.com/user-attachments/assets/1a1b6ecf-1b14-46ad-8e1e-c4bc7b59f34c)
![image](https://github.com/user-attachments/assets/afd4f182-6976-4d96-aabd-953f03c6707f)

</details>

### 💊 2. 증상 기반 진단 및 약물 추천

<details>
<summary>2-1. 증상 목록 조회</summary>
	
```sql
DELIMITER $$

DROP PROCEDURE IF EXISTS get_symptom_list $$

CREATE PROCEDURE get_symptom_list()
BEGIN
    SELECT 
        symptom_id,
        description
    FROM Symptom
    ORDER BY symptom_id ASC;
END $$

DELIMITER ;

CALL get_symptom_list();
```
![image](https://github.com/user-attachments/assets/c9212a53-a376-4ca7-8b11-fde0cfce89e1)

</details>

<details>
<summary>2-2. 사용자 증상 보고 등록</summary>

```DELIMITER $$

DROP PROCEDURE IF EXISTS save_user_symptom_report $$

CREATE PROCEDURE save_user_symptom_report (
    IN p_user_id INT,
    IN p_animal_id INT,
    IN p_symptom_id INT,
    IN p_custom_description TEXT
)
BEGIN
    DECLARE v_exists INT;

    SELECT COUNT(*) INTO v_exists
    FROM User
    WHERE user_id = p_user_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 사용자입니다.';
    END IF;

    SELECT COUNT(*) INTO v_exists
    FROM Animal
    WHERE animal_id = p_animal_id AND user_id = p_user_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '해당 동물은 사용자 소유가 아닙니다.';
    END IF;

    SELECT COUNT(*) INTO v_exists
    FROM Symptom
    WHERE symptom_id = p_symptom_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 증상입니다.';
    END IF;

    INSERT INTO UserSymptomReport (
        user_id,
        animal_id,
        symptom_id,
        custom_description,
        reported_at
    ) VALUES (
        p_user_id,
        p_animal_id,
        p_symptom_id,
        p_custom_description,
        NOW()
    );
END $$

DELIMITER ;

```
![image](https://github.com/user-attachments/assets/79d83563-7454-433b-8a8b-862b28820180)


</details>

<details>
<summary>2-3. 사용자 증상 보고 이력 조회</summary>
	
```
DELIMITER $$

DROP PROCEDURE IF EXISTS get_symptom_report_history $$

CREATE PROCEDURE get_symptom_report_history (
    IN p_user_id INT,
    IN p_animal_id INT
)
BEGIN
    DECLARE v_exists INT;

    SELECT COUNT(*) INTO v_exists
    FROM User
    WHERE user_id = p_user_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 사용자입니다.';
    END IF;

    SELECT COUNT(*) INTO v_exists
    FROM Animal
    WHERE animal_id = p_animal_id AND user_id = p_user_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '해당 동물은 사용자 소유가 아닙니다.';
    END IF;

    SELECT COUNT(*) INTO v_exists
    FROM UserSymptomReport
    WHERE animal_id = p_animal_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '증상 보고 이력이 없습니다.';
    END IF;

    SELECT 
        sr.report_id,
        s.description AS symptom,
        sr.custom_description,
        sr.reported_at
    FROM UserSymptomReport sr
    JOIN Symptom s ON sr.symptom_id = s.symptom_id
    WHERE sr.animal_id = p_animal_id
    ORDER BY sr.reported_at DESC;
END $$

DELIMITER ;
```
![image](https://github.com/user-attachments/assets/828e7226-c2eb-49e2-a0e3-6cd7bb856704)
![image](https://github.com/user-attachments/assets/eddda707-400f-4b4b-8bb6-3c1ce5362fbb)
![image](https://github.com/user-attachments/assets/f7c8fe4e-7e84-41ee-b48e-29782918132a)
![image](https://github.com/user-attachments/assets/40804ce6-10d5-4fd6-b9eb-b2c8a4d3cf04)

</details>

<details>
<summary>2-4. 증상에 따른 약물 경고 조회</summary>

```
DELIMITER $$

DROP PROCEDURE IF EXISTS sp_get_symptom_drug_warnings $$

CREATE PROCEDURE sp_get_symptom_drug_warnings (
    IN p_species_id INT,
    IN p_symptom_id INT
)
BEGIN
    DECLARE v_exists INT;

    SELECT COUNT(*) INTO v_exists
    FROM AnimalSpecies
    WHERE species_id = p_species_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 동물 종입니다.';
    END IF;

    SELECT COUNT(*) INTO v_exists
    FROM Symptom
    WHERE symptom_id = p_symptom_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 증상입니다.';
    END IF;

    SELECT COUNT(*) INTO v_exists
    FROM DrugWarning
    WHERE (species_id = p_species_id OR species_id IS NULL)
      AND (symptom_id = p_symptom_id OR symptom_id IS NULL);
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '관련 약물 경고가 없습니다.';
    END IF;

    SELECT 
        dw.drug_id,
        d.drug_name,
        dw.warning_type,
        dw.description,
        dw.severity,
        dw.source
    FROM DrugWarning dw
    JOIN Drug d ON dw.drug_id = d.drug_id
    WHERE (dw.species_id = p_species_id OR dw.species_id IS NULL)
      AND (dw.symptom_id = p_symptom_id OR dw.symptom_id IS NULL)
    ORDER BY dw.severity DESC;
END $$

DELIMITER ;

CALL sp_get_symptom_drug_warnings(1, 1);
```
![image](https://github.com/user-attachments/assets/f747c772-9957-4b6a-b9b7-342ce0b4407f)

</details>

<details>
<summary>2-5. 동일 증상 중복 보고 방지</summary>
	
```
DELIMITER $$

DROP PROCEDURE IF EXISTS sp_save_symptom_report_once_per_day $$

CREATE PROCEDURE sp_save_symptom_report_once_per_day (
    IN p_user_id INT,
    IN p_animal_id INT,
    IN p_symptom_id INT,
    IN p_custom_description TEXT
)
BEGIN
    DECLARE v_exists INT;

    SELECT COUNT(*) INTO v_exists FROM User WHERE user_id = p_user_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 사용자입니다.';
    END IF;

    SELECT COUNT(*) INTO v_exists
    FROM Animal WHERE animal_id = p_animal_id AND user_id = p_user_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '해당 동물은 사용자 소유가 아닙니다.';
    END IF;

    SELECT COUNT(*) INTO v_exists FROM Symptom WHERE symptom_id = p_symptom_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 증상입니다.';
    END IF;

    SELECT COUNT(*) INTO v_exists
    FROM UserSymptomReport
    WHERE user_id = p_user_id
      AND animal_id = p_animal_id
      AND symptom_id = p_symptom_id
      AND DATE(reported_at) = CURDATE();

    IF v_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '오늘은 이 증상에 대해 이미 보고했습니다.';
    END IF;

    INSERT INTO UserSymptomReport (
        user_id, animal_id, symptom_id, custom_description, reported_at
    ) VALUES (
        p_user_id, p_animal_id, p_symptom_id, p_custom_description, NOW()
    );
END $$

DELIMITER ;

CALL sp_save_symptom_report_once_per_day(1, 1, 1, '기침 계속함');
```
![image](https://github.com/user-attachments/assets/5b7847c6-be8c-4c3d-8869-f8fa0db4efc9)

</details>

<details>
<summary>2-6. 종별 약물 복용량 초과 위험 확인</summary>
	
```
DELIMITER $$

DROP PROCEDURE IF EXISTS sp_check_overdose_risk $$

CREATE PROCEDURE sp_check_overdose_risk (
    IN p_animal_id INT,
    IN p_symptom_id INT
)
BEGIN
    DECLARE v_species_id INT;
    DECLARE v_weight FLOAT;
    DECLARE v_exists INT;

    SELECT COUNT(*) INTO v_exists FROM Animal WHERE animal_id = p_animal_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 반려동물입니다.';
    END IF;

    SELECT species_id, weight INTO v_species_id, v_weight
    FROM Animal
    WHERE animal_id = p_animal_id;

    IF v_weight IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '반려동물의 체중 정보가 필요합니다.';
    END IF;

    SELECT COUNT(*) INTO v_exists FROM Symptom WHERE symptom_id = p_symptom_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 증상입니다.';
    END IF;

    SELECT
        d.drug_id,
        d.drug_name,
        dsm.recommended_dose,
        dsm.max_dose,
        ROUND(v_weight * dsm.recommended_dose, 2) AS calculated_dose,
        CASE
            WHEN (v_weight * dsm.recommended_dose > dsm.max_dose) THEN 'Y'
            ELSE 'N'
        END AS over_limit,
        dw.description AS warning
    FROM Symptom_Drug_Map sdm
    JOIN Drug d ON sdm.drug_id = d.drug_id
    JOIN DrugSpeciesMapping dsm 
        ON d.drug_id = dsm.drug_id AND dsm.species_id = v_species_id
    LEFT JOIN DrugWarning dw 
        ON dw.drug_id = d.drug_id
        AND (dw.species_id = v_species_id OR dw.species_id IS NULL)
        AND (dw.symptom_id = p_symptom_id OR dw.symptom_id IS NULL)
    WHERE sdm.symptom_id = p_symptom_id;
END $$

DELIMITER ;

CALL sp_check_overdose_risk(1, 1);
```
![image](https://github.com/user-attachments/assets/5de21e73-48f2-4917-93f0-48a8f789a3e4)

</details>

<details>
<summary>2-7. 증상에 따른 약물 간 상호작용 위험 확인</summary>
	
```
DELIMITER $$

DROP PROCEDURE IF EXISTS sp_check_interaction_risk $$

CREATE PROCEDURE sp_check_interaction_risk (
    IN p_symptom_id INT,
    IN p_species_id INT
)
BEGIN
    SELECT
        d.drug_id,
        d.drug_name,
        di.interaction_risk,
        di.interaction_detail,
        d_other.drug_name AS interacts_with
    FROM Symptom_Drug_Map sdm
    JOIN Drug d ON sdm.drug_id = d.drug_id

    JOIN DrugSpeciesMapping dsm ON d.drug_id = dsm.drug_id
        AND dsm.species_id = p_species_id

    LEFT JOIN DrugInteraction di 
        ON di.drug_id_low = d.drug_id OR di.drug_id_high = d.drug_id

    LEFT JOIN Drug d_other 
        ON d_other.drug_id = 
           IF(di.drug_id_low = d.drug_id, di.drug_id_high, 
              IF(di.drug_id_high = d.drug_id, di.drug_id_low, NULL))

    WHERE sdm.symptom_id = p_symptom_id
      AND d_other.drug_id IS NOT NULL
    ORDER BY d.drug_id, interacts_with;
END $$

DELIMITER ;

CALL sp_check_interaction_risk(1, 1);
```
![image](https://github.com/user-attachments/assets/fa2bddf2-3373-414a-be5e-7cc13fb0160c)


</details>

### 🛒 3. 커뮤니티 및 상품 관리

<details>
<summary>3-1. 커뮤니티 게시글 목록 조회</summary>
	
```sql
DELIMITER $$

CREATE PROCEDURE GetCommunityPostList()
BEGIN
    SELECT 
        c.post_id AS 게시글ID,
        c.title AS 제목,
        c.content AS 내용,
        u.name AS 작성자,
        c.post_like AS 좋아요수,
        c.post_report AS 신고수,
        c.created_at AS 작성일,
        c.updated_at AS 수정일,
        COUNT(cm.comment_id) AS 댓글수
    FROM community c
    JOIN User u ON c.user_id = u.user_id
    LEFT JOIN comment cm ON c.post_id = cm.post_id
    GROUP BY c.post_id, c.title, c.content, u.name, c.post_like, c.post_report, c.created_at, c.updated_at
    ORDER BY 게시글ID;
END $$

DELIMITER ;
```
</details>

<details>
<summary>3-2. 커뮤니티 게시글 등록</summary>
	
```sql
DELIMITER $$

CREATE PROCEDURE AddCommunityPost (
    IN 제목 VARCHAR(255),
    IN 내용 TEXT,
    IN 작성자ID INT
)
BEGIN
    INSERT INTO community (title, content, user_id)
    VALUES (제목, 내용, 작성자ID);
    
    SELECT LAST_INSERT_ID() AS 게시글ID;
END $$

DELIMITER ;
```
</details>



<details>
<summary>3-3. 커뮤니티 게시글 신고</summary>
	
```sql
DELIMITER $$

CREATE PROCEDURE ReportCommunityPost (
    IN 게시글ID BIGINT
)
BEGIN
    -- 신고 수 1 증가
    UPDATE community
    SET post_report = post_report + 1
    WHERE post_id = 게시글ID;
    
    -- 갱신된 신고 수 반환
    SELECT 
        post_id AS 게시글ID,
        post_report AS 현재신고수
    FROM community
    WHERE post_id = 게시글ID;
END $$

DELIMITER ;

```
</details>

<details>
<summary>3-4. 커뮤니티 게시글 수정</summary>
	
```sql

```
</details>

<details>
<summary>3-5. 커뮤니티 게시글 삭제</summary>
	
```sql

```
</details>

<details>
<summary>3-6. 커뮤니티 댓글 등록</summary>
	
```sql
DELIMITER $$

CREATE PROCEDURE AddComment (
    IN 게시글ID BIGINT,
    IN 작성자ID INT,
    IN 댓글내용 TEXT
)
BEGIN
    INSERT INTO comment (post_id, user_id, content)
    VALUES (게시글ID, 작성자ID, 댓글내용);
    
    -- 방금 생성된 댓글 ID 반환
    SELECT LAST_INSERT_ID() AS 댓글ID;
END $$

DELIMITER ;
```
</details>
<details>
<summary>3-7. 커뮤니티 댓글 수정</summary>
	
```sql

```
</details>

<details>
<summary>3-8. 커뮤니티 댓글 삭제</summary>
	
```sql

```
</details>

### 🏥 4. 병원 및 광고 관리

<details> 
<summary>4-1. 종에 따른 병원 추천 및 병원 광고 타겟 정보 조회</summary> 
	
```
DELIMITER $$

CREATE PROCEDURE getVetAdInfo (
    IN p_clinic_name VARCHAR(100)
)
BEGIN
    DECLARE v_clinic_name VARCHAR(100);
    DECLARE v_exist_count INT DEFAULT 0;

    SET v_clinic_name = NULLIF(TRIM(p_clinic_name), '');

    -- 병원 존재 여부 체크
    SELECT COUNT(*) INTO v_exist_count
    FROM Clinic
    WHERE v_clinic_name IS NULL
       OR name LIKE CONCAT('%', v_clinic_name, '%') COLLATE utf8mb4_general_ci;

    IF v_exist_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '조건에 맞는 병원이 존재하지 않습니다.';
    END IF;

    -- 결과 조회
    SELECT 
        c.name AS clinic_name,
        s.species_name,
        sy.symptom_id,
        v.priority
    FROM VetAd v
    JOIN Clinic c ON v.clinic_id = c.clinic_id
    JOIN AnimalSpecies s ON v.target_species_id = s.species_id
    JOIN Symptom sy ON v.target_symptom_id = sy.symptom_id
    WHERE v_clinic_name IS NULL
       OR c.name LIKE CONCAT('%', v_clinic_name, '%') COLLATE utf8mb4_general_ci;
END$$

DELIMITER ;

CALL getVetAdInfo('');
```

<img width="479" height="283" alt="Image" src="https://github.com/user-attachments/assets/65470974-9e4c-4be0-b4e0-3e2d31b51a8c" />

<img width="479" height="254" alt="Image" src="https://github.com/user-attachments/assets/1f91732a-0396-45c9-9fc9-5e9687bec376" />

<img width="488" height="311" alt="Image" src="https://github.com/user-attachments/assets/f00e6099-bf9f-444b-811b-b4ea24b362b4" />=

</details>

<details> 
<summary>4-2. 병원 광고 예산 조회</summary> 
	
```
DELIMITER $$

CREATE PROCEDURE getClinicAdBudget (
    IN p_clinic_name VARCHAR(100)
)
BEGIN
    DECLARE v_clinic_name VARCHAR(100);
    DECLARE v_exist_count INT DEFAULT 0;

    SET v_clinic_name = NULLIF(TRIM(p_clinic_name), '');

    -- 병원 존재 여부 체크 (조건에 맞는 병원)
    SELECT COUNT(*) INTO v_exist_count
    FROM Clinic
    WHERE v_clinic_name IS NULL OR name LIKE CONCAT('%', v_clinic_name, '%') COLLATE utf8mb4_general_ci;

    IF v_exist_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '조건에 맞는 병원이 존재하지 않습니다.';
    END IF;

    -- 결과 조회
    SELECT 
        c.name AS clinic_name, 
        b.total_budget, 
        b.remaining_budget
    FROM VetAdBudget b
    JOIN Clinic c ON b.clinic_id = c.clinic_id
    WHERE v_clinic_name IS NULL 
       OR c.name LIKE CONCAT('%', v_clinic_name, '%') COLLATE utf8mb4_general_ci;
END$$

DELIMITER ;
```
CALL getClinicAdBudget('');

<img width="418" height="286" alt="Image" src="https://github.com/user-attachments/assets/882f6fb0-6830-4a7d-b405-28bedaa5cc13" />

<img width="412" height="161" alt="Image" src="https://github.com/user-attachments/assets/de9421e2-9918-423a-9ec4-f2d498210cff" />

<img width="437" height="236" alt="Image" src="https://github.com/user-attachments/assets/fd925c45-54f6-42b5-8ce0-8afaf1b38390" />

</details>

<details> 
<summary>4-3. 만료 광고 병원 자동 삭제</summary> 
	
```
```
</details>

<details> 
<summary>4-4. 병원 상세 정보 조회</summary> 
	
```
```
</details>

<details> 
<summary>4-5. 병원 등록 / 광고 등록 요청</summary>
병원 등록 

```sql
USE employees_db;
DROP PROCEDURE IF EXISTS AddVetAd;
DELIMITER $$
-- clinic 추가 
CREATE PROCEDURE AddClinic (
   IN in_name VARCHAR(100) COLLATE utf8mb4_unicode_ci,
    IN in_address VARCHAR(255) COLLATE utf8mb4_unicode_ci,
   IN in_phone VARCHAR(20) COLLATE utf8mb4_unicode_ci,
   IN in_specialties TEXT COLLATE utf8mb4_unicode_ci
)
BEGIN
   -- 병원 중복 체크 (이름 + 주소 조합으로 판단)
   IF EXISTS (
      SELECT 1 FROM clinic
      WHERE `name` = in_name AND address = in_address
   ) THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = '이미 등록된 병원입니다.';
   ELSE
      -- 병원 정보 삽입
      INSERT INTO clinic (`name`, address, contact, specialties)
      VALUES (in_name COLLATE utf8mb4_unicode_ci,
			in_address  COLLATE utf8mb4_unicode_ci, 
			in_phone  COLLATE utf8mb4_unicode_ci, 
			in_specialties);
      SELECT * FROM clinic;
   END IF;
END $$

DELIMITER ;

CALL AddClinic('연세병원', '서울시 강남구 역삼동 123', '02-123-4567', '내과');

```
![병원 코드 결과](/박채연/addClinic_procedure.png)
![병원 등록 결과](/박채연/addClinic_result.png)


광고 등록 

```sql
USE employees_db;
DROP PROCEDURE IF EXISTS AddVetAd;

-- clinic 추가 
CREATE PROCEDURE AddVetAd(
   IN in_clinic_id INT,
	IN in_target_species_id INT,
   IN in_target_symptom_id INT,
   IN in_priority INT,
   IN in_start_date DATE,
   IN in_end_date DATE
)
BEGIN
   -- 병원 중복 체크 (이름 + 주소 조합으로 판단)
   IF EXISTS (
      SELECT 1 FROM vetad 
      WHERE `clinic_id` = in_clinic_id 
			AND target_species_id = in_target_species_id
			AND target_symptom_id = in_target_symptom_id
			AND start_date = in_start_date
			AND end_date = in_end_date 
   ) THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = '이미 등록된 광고입니다';
   ELSE
      -- 병원 정보 삽입
      INSERT INTO vetad (clinic_id, target_species_id, target_symptom_id, priority, start_date, end_date)
      VALUES (   in_clinic_id, in_target_species_id, in_target_symptom_id, in_priority, in_start_date, in_end_date 
   	);
      SELECT * FROM vetad;
   END IF;
END $$

DELIMITER ;

CALL AddVetAd(1, 1, 7, 11, CURDATE(), CURDATE());


```

![광고 코드 결과](/박채연/addVetAd_procedure.png)
![광고 등록 결과](/박채연/addVetAd_result.png)



</details>
<details>
<summary>4-6. 광고 로그 조회 (병원명/이벤트별 필터)</summary>

```sql
DELIMITER $$

CREATE PROCEDURE getAdLog (
    IN p_clinic_name VARCHAR(100),
    IN p_event_type VARCHAR(20)
)
BEGIN
    DECLARE v_log_count INT DEFAULT 0;
    DECLARE v_clinic_name VARCHAR(100);
    DECLARE v_event_type VARCHAR(20);

    SET v_clinic_name = NULLIF(TRIM(p_clinic_name), '');
    SET v_event_type = NULLIF(TRIM(p_event_type), '');

    SELECT COUNT(*) INTO v_log_count
    FROM vetad v
    JOIN vetadlog vl ON vl.ad_id = v.ad_id
    JOIN clinic c ON c.clinic_id = v.clinic_id
    WHERE (v_event_type IS NULL OR vl.event_type COLLATE utf8mb4_general_ci = v_event_type COLLATE utf8mb4_general_ci)
      AND (v_clinic_name IS NULL OR c.`name` COLLATE utf8mb4_general_ci LIKE CONCAT('%', v_clinic_name, '%'));

    IF v_log_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '해당 조건의 광고 로그가 존재하지 않습니다.';
    END IF;

    SELECT 
        v.ad_id,
        c.`name` AS clinic_name,
        vl.event_type,
        vl.event_time
    FROM vetad v
    JOIN vetadlog vl ON vl.ad_id = v.ad_id
    JOIN clinic c ON c.clinic_id = v.clinic_id
    WHERE (v_event_type IS NULL OR vl.event_type COLLATE utf8mb4_general_ci = v_event_type COLLATE utf8mb4_general_ci)
      AND (v_clinic_name IS NULL OR c.`name` COLLATE utf8mb4_general_ci LIKE CONCAT('%', v_clinic_name, '%'))
    ORDER BY vl.event_time DESC;
END$$

DELIMITER ;

CALL getAdLog('', '');
```

<img width="666" height="286" alt="Image" src="https://github.com/user-attachments/assets/8c44402c-dfbb-41e2-947f-64da824e8549" />

<img width="516" height="164" alt="Image" src="https://github.com/user-attachments/assets/d85af09a-9781-4f24-ac95-8d907aac6f6c" />

<img width="501" height="140" alt="Image" src="https://github.com/user-attachments/assets/c475f03f-cebe-473c-a53b-82aba2332486" />

<img width="438" height="229" alt="Image" src="https://github.com/user-attachments/assets/2d7e15a1-d85e-4fe0-baa7-78cb90768f3b" />

<img width="438" height="232" alt="Image" src="https://github.com/user-attachments/assets/abdca541-91ee-40ba-a80f-2b1a96a401e7" />

</details>

### 🛒 5. 상품 및 파트너 관리

<details> 
<summary>5-1. 상품 목록 조회</summary> 
	
```
```
</details>
<details> 
<summary>5-2. 상품 상세 조회</summary> 
	
```
```
</details>
<details> 
<summary>5-3. 종별 금기/주의 약물 포함 상품 필터링</summary> 
	
```
DELIMITER $$

CREATE PROCEDURE recommendedProducts (
	IN p_species_keyword VARCHAR(100),
   IN p_symptom_keyword VARCHAR(100)
)
BEGIN
   DECLARE v_exists INT DEFAULT 0;

   -- 1. 증상+종 조합이 유효한지 확인
   SELECT COUNT(*) INTO v_exists
   FROM symptom_product_map m
   JOIN Symptom s ON m.symptom_id = s.symptom_id
   JOIN AnimalSpecies sp ON m.species_id = sp.species_id
   WHERE s.`description` LIKE CONCAT('%', p_symptom_keyword, '%') COLLATE utf8mb4_general_ci
   AND sp.`species_name` LIKE CONCAT('%', p_species_keyword, '%') COLLATE utf8mb4_general_ci;

   IF v_exists = 0 THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = '입력한 증상과 종에 대한 추천 제품이 존재하지 않습니다.';
   END IF;

   -- 2. 추천 제품 조회
   SELECT 
      s.symptom_id, 
      s.description AS symptom_description,
      sp.species_name,
      pd.name AS product_name,
      pd.price
   FROM symptom_product_map m
   JOIN Symptom s ON m.symptom_id = s.symptom_id
   JOIN AnimalSpecies sp ON m.species_id = sp.species_id
   JOIN Product pd ON m.product_id = pd.product_id
   WHERE s.description LIKE CONCAT('%', p_symptom_keyword, '%') COLLATE utf8mb4_general_ci
   AND sp.species_name LIKE CONCAT('%', p_species_keyword, '%') COLLATE utf8mb4_general_ci;
END$$

DELIMITER ;


CALL recommendedProducts('고양이', '기침');

DROP PROCEDURE recommendedProducts;
```

<img width="626" height="261" alt="Image" src="https://github.com/user-attachments/assets/cf3536e4-1d54-4f5c-aeac-fbdc2302b6b7" />

<img width="629" height="110" alt="Image" src="https://github.com/user-attachments/assets/15af841e-6a32-492c-a2fc-080b5d5ab7db" />

<img width="620" height="108" alt="Image" src="https://github.com/user-attachments/assets/83d3de6c-26b7-4204-8e9e-ae347e5f8318" />

<img width="439" height="232" alt="Image" src="https://github.com/user-attachments/assets/27c67816-14b1-455d-a855-a8ed05e58504" />

<img width="437" height="233" alt="Image" src="https://github.com/user-attachments/assets/716ffba7-90c7-4de6-baec-7d4bed962402" />
</details>

<details> 
<summary>5-4. 파트너사 상품 검색 조회</summary> 
	
```
DELIMITER $$

CREATE PROCEDURE partnerProduct (
    IN p_partner_name_keyword VARCHAR(100),
    IN p_product_name_keyword VARCHAR(100)
)
BEGIN
    -- 입력된 키워드가 모두 비어있으면 에러 발생
    IF (p_partner_name_keyword IS NULL OR p_partner_name_keyword = '') 
       AND (p_product_name_keyword IS NULL OR p_product_name_keyword = '') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '파트너 이름 또는 상품 이름 중 최소 하나는 입력해야 합니다.';
    END IF;

    -- 파트너 존재 여부 확인 (파트너 이름 키워드가 있을 때만)
    IF p_partner_name_keyword IS NOT NULL AND p_partner_name_keyword <> '' THEN
        IF NOT EXISTS (
            SELECT 1 FROM Partner 
            WHERE `name` LIKE CONCAT('%', p_partner_name_keyword, '%') COLLATE utf8mb4_general_ci
        ) THEN
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = '해당 이름을 포함하는 파트너가 존재하지 않습니다.';
        END IF;
    END IF;

    -- 상품 존재 여부 확인 (상품 이름 키워드가 있을 때만)
    IF p_product_name_keyword IS NOT NULL AND p_product_name_keyword <> '' THEN
        IF NOT EXISTS (
            SELECT 1 FROM Product 
            WHERE `name` LIKE CONCAT('%', p_product_name_keyword, '%') COLLATE utf8mb4_general_ci
        ) THEN
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = '해당 이름을 포함하는 상품이 존재하지 않습니다.';
        END IF;
    END IF;

    -- 결과 조회
    SELECT 
        p.`name` AS product_name,
        pt.`name` AS partner_name,
        p.price
    FROM Product p
    JOIN Partner pt ON p.partner_id = pt.partner_id
    WHERE (p_partner_name_keyword IS NULL OR p_partner_name_keyword = '' 
           OR pt.`name` LIKE CONCAT('%', p_partner_name_keyword, '%') COLLATE utf8mb4_general_ci)
      AND (p_product_name_keyword IS NULL OR p_product_name_keyword = '' 
           OR p.`name` LIKE CONCAT('%', p_product_name_keyword, '%') COLLATE utf8mb4_general_ci);
END$$

DELIMITER ;

CALL partnerProduct('', '구토');

DROP PROCEDURE partnerProduct;
```

<img width="526" height="263" alt="Image" src="https://github.com/user-attachments/assets/eed3cc5c-4182-4bb7-8a83-78c429c73459" />

<img width="364" height="113" alt="Image" src="https://github.com/user-attachments/assets/ee65233e-137d-43ed-a189-c299d6ec3603" />

<img width="500" height="238" alt="Image" src="https://github.com/user-attachments/assets/718f3cb5-c8c6-4770-a07a-c594f291bd15" />

<img width="441" height="232" alt="Image" src="https://github.com/user-attachments/assets/c9a0438c-bf98-4886-9c7a-fe1f4cfca934" />

<img width="443" height="235" alt="Image" src="https://github.com/user-attachments/assets/00ea4016-c799-43a3-957c-fb4be003af3c" />
</details>
<details> 
<summary>5-5. 제휴 파트너 등록 요청 / 관리</summary> 
	
```
```
</details>

### 🛠️ 6. 추후 개선사항

<details> 
<summary>6-1. 세션 유효성 확인 및 저장</summary> 
	
```
```
</details>

<details> 
<summary>6-2. 종 목록 조회</summary> 
	
```
```
</details>

<details> 
<summary>6-3. 사용자 역할 검증</summary>
	
```
```
</details>

<details> 
<summary>6-4. 증상/약물/종 관리 (관리자 전용)</summary>
	
```
```
</details>

<details> 
<summary>6-5. 로그 저장 또는 에러 로깅 (후속 고려)</summary> 
	
```
```
</details>

<details> 
<summary>6-6. 통계/분석 리포트 제공</summary>
	
```
```
</details>

<details> 
<summary>6-7. 데이터 백업 또는 자동 삭제 정책</summary>
	
```
```
</details>

-- 여기서 묶음
---
<details>

</details>
## 💬 시나리오
<img width="600" height="600" alt="Image" src="https://github.com/user-attachments/assets/cf0d7496-98c9-443d-8701-577c46fe999c" />

---
## 🚀 기술 스택
DB: Maria db

## 📌 프로젝트 구조

---

## ⬆️ 향후 아이디어

- 수의사 등록을 통한 온라인 상담과 처방전 및 진단서 발급
- AI 활용과 동물 정보, 복약 기록을 바탕으로 반려 동물 환경 변경 추천

---
## 🐾 About AniMeds
---
> 반려동물의 건강과 행복을 위하여  
> **AniMeds**는 약물 추천을 넘어 예방, 치료, 정보 공유까지 지원하는  
> 반려동물 통합 관리 플랫폼입니다.

## 🎓 회고록
# 회고록
| 이름 | 내용 |
| --- | --- |
| 안진기 | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ |
|  |  |
|  |  |
|  |  |
|  |  |

<div align="center">
  
[📚목차](#-목차)

</div>
