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

---

## 🧠 저장 프로시저 예시
### 💊 증상 기반 약물 추천 - RecommendDrugBySymptom
<details>
<summary>📌 기능 설명 및 예시 보기</summary>

**설명:** 증상 ID와 종 ID를 기준으로 금기 약물이 아닌 약물만 추천

**🧪 사용 예시:**
```sql
CALL RecommendDrugBySymptom(3, 2);
```

**💾 저장 프로시저:**
```sql
DELIMITER $$
CREATE PROCEDURE RecommendDrugBySymptom (
    IN in_symptom_id INT,
    IN in_species_id INT
)
BEGIN
    SELECT d.drug_id, d.drug_name, m.recommended_dose
    FROM Drug d
    JOIN DrugSpeciesMapping m ON d.drug_id = m.drug_id
    JOIN Symptom_Drug_Map sdm ON d.drug_id = sdm.drug_id
    WHERE sdm.symptom_id = in_symptom_id
      AND m.species_id = in_species_id
      AND m.contraindicated = FALSE;
END$$
DELIMITER ;
```
</details>

### ⚠️ 약물 간 상호작용 조회 - GetDrugInteraction
<details>
<summary>📌 기능 설명 및 예시 보기</summary>

**설명:** 두 약물 간 상호작용 위험도 및 상세 설명을 조회

**🧪 사용 예시:**
```sql
CALL GetDrugInteraction(1, 2);
```

**💾 저장 프로시저:**
```sql
DELIMITER $$
CREATE PROCEDURE GetDrugInteraction (
    IN in_drug_id_1 INT,
    IN in_drug_id_2 INT
)
BEGIN
    SELECT interaction_risk, interaction_detail
    FROM DrugInteraction
    WHERE (drug_id_1 = in_drug_id_1 AND drug_id_2 = in_drug_id_2)
       OR (drug_id_1 = in_drug_id_2 AND drug_id_2 = in_drug_id_1);
END$$
DELIMITER ;
```
</details>

### 📊 병원 광고 로그 기록 - LogVetAdClick
<details>
<summary>📌 기능 설명 및 예시 보기</summary>

**설명:** 특정 사용자가 특정 동물로 본 광고 클릭/노출 로그 기록

**🧪 사용 예시:**
```sql
CALL LogVetAdClick(1, 2, 3, '클릭');
```

**💾 저장 프로시저:**
```sql
DELIMITER $$
CREATE PROCEDURE LogVetAdClick (
    IN in_ad_id INT,
    IN in_user_id INT,
    IN in_animal_id INT,
    IN in_event_type VARCHAR(20)
)
BEGIN
    INSERT INTO VetAdLog (ad_id, user_id, animal_id, event_type, event_time)
    VALUES (in_ad_id, in_user_id, in_animal_id, in_event_type, NOW());
END$$
DELIMITER ;
```
</details>

### 👤 사용자 계정 생성 - CreateUser
<details>
<summary>📌 기능 설명 및 예시 보기</summary>

**설명:** 새로운 사용자를 생성하고 초기 정보를 저장합니다.

**🧪 사용 예시:**
```sql
CALL CreateUser('test@example.com', 'securePass123', '홍길동');
```

**💾 저장 프로시저:**
```sql
DELIMITER $$
CREATE PROCEDURE CreateUser (
    IN in_email VARCHAR(100),
    IN in_password VARCHAR(100),
    IN in_name VARCHAR(50)
)
BEGIN
    INSERT INTO User (email, password, name, created_at)
    VALUES (in_email, in_password, in_name, NOW());
END$$
DELIMITER ;
```
</details>

### 🐶 반려동물 등록 - AddAnimal
<details>
<summary>📌 기능 설명 및 예시 보기</summary>

**설명:** 사용자의 반려동물을 등록합니다.

**🧪 사용 예시:**
```sql
CALL AddAnimal(1, '코코', 2, '2020-03-01');
```

**💾 저장 프로시저:**
```sql
DELIMITER $$
CREATE PROCEDURE AddAnimal (
    IN in_user_id INT,
    IN in_name VARCHAR(50),
    IN in_species_id INT,
    IN in_birthdate DATE
)
BEGIN
    INSERT INTO Animal (user_id, name, species_id, birthdate)
    VALUES (in_user_id, in_name, in_species_id, in_birthdate);
END$$
DELIMITER ;
```
</details>

### 🧾 복약 이력 저장 - LogPrescription
<details>
<summary>📌 기능 설명 및 예시 보기</summary>

**설명:** 추천된 약물 정보를 반려동물의 복약 이력으로 저장합니다.

**🧪 사용 예시:**
```sql
CALL LogPrescription(2, 5, 1, '5ml 1일 2회');
```

**💾 저장 프로시저:**
```sql
DELIMITER $$
CREATE PROCEDURE LogPrescription (
    IN in_animal_id INT,
    IN in_drug_id INT,
    IN in_symptom_id INT,
    IN in_dose VARCHAR(50)
)
BEGIN
    INSERT INTO PrescriptionHistory (animal_id, drug_id, symptom_id, dose, prescribed_at)
    VALUES (in_animal_id, in_drug_id, in_symptom_id, in_dose, NOW());
END$$
DELIMITER ;
```
</details>

### 🛒 관심 상품 등록 - SaveProduct
<details>
<summary>📌 기능 설명 및 예시 보기</summary>

**설명:** 특정 사용자의 관심 상품을 저장합니다.

**🧪 사용 예시:**
```sql
CALL SaveProduct(1, 101);
```

**💾 저장 프로시저:**
```sql
DELIMITER $$
CREATE PROCEDURE SaveProduct (
    IN in_user_id INT,
    IN in_product_id INT
)
BEGIN
    INSERT INTO UserSavedProduct (user_id, product_id, saved_at)
    VALUES (in_user_id, in_product_id, NOW());
END$$
DELIMITER ;
```
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
