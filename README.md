# be18-1st-5team
# 🐾 AniMeds – 반려동물 맞춤형 약물 추천 & 복약 관리 플랫폼

> 반려동물의 건강을 한눈에, **AniMeds**와 함께

---

## 👥 팀원 소개

| 이름     | 역할             | 담당 업무 |
|----------|------------------|-----------|
|    |       |  |
|    |   |  |
|    |      |  |
|    |  |  |

---

## 🌟 프로젝트 개요

**AniMeds**는 반려동물의 증상에 따른 약물 추천, 금기 정보 제공, 처방 이력 관리 및 커뮤니티를 통합한 플랫폼입니다.  
사용자에게 안전하고 정확한 반려동물 복약 환경을 제공하는 것을 목표로 합니다.

---

## 💡 개발 배경 및 필요성

- ❌ 기존 정보는 흩어져 있고, 종에 따라 금기 약물 정보가 명확하지 않음  
- 🐶 사용자 맞춤형 복약 정보 필요 (나이/종/체중에 따라)
- 💬 보호자 간 소통 채널 부족 → 커뮤니티 필요  
- 📢 병원과 제품 광고도 관리 가능한 통합 플랫폼 필요

---

## 🔧 주요 기능

- **사용자/동물 등록 및 관리**
- **증상 기반 약물 추천** (종, 금기 여부 필터링)
- **복약 기록 저장 및 이력 확인**
- **약물 간 상호작용 정보 제공**
- **병원 광고 노출 및 클릭 로그 기록**
- **커뮤니티 포스팅 및 열람**
- **제품 추천 및 제휴 상품 저장/클릭 로그 추적**

---

## 📅 프로젝트 진행 일정 (WBS)
![image](https://github.com/user-attachments/assets/7eacde82-e6d0-4a26-b532-478210d91d48)

---

## 🧾 요구사항 정의서

### ✅ 기능 요구사항
- 사용자 CRUD
- 동물 등록 및 정보 조회
- 증상 → 약물 추천 (금기, 권장용량 고려)
- 처방기록, 부작용 로그 기록
- 커뮤니티 글 작성 및 열람
- 병원 광고 노출 및 클릭 이벤트 추적

### 🚫 비기능 요구사항
- 인증 토큰 기반 세션
- 인덱스 활용한 검색 최적화
- 반응형 UI 지원
- 데이터 무결성 보장 (FK, 제약조건)

---

## 🗂️ 데이터베이스 설계

### ERD
![6Dvmdnc3LHzMYqKPy_1](https://github.com/user-attachments/assets/a257cfd4-031f-4e51-aedf-4929bdcda264)


### Schema DDL


## 🧪 샘플 데이터 삽입 (DML)

- [data/sample_data.sql](data/sample_data.sql)  
- 총 100건의 더미 데이터 삽입: `User`, `Animal`, `Symptom`, `Drug` 등
- 삽입 순서: User → Species → Animal → Symptom → Drug → Mapping

---

## 🧠 저장 프로시저 예시

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
🎓 회고록
팀원	회고 내용

🚀 기술 스택
DB: MariaDB

Backend: Node.js / Express.js (or Python Flask)

Frontend: React.js / Tailwind

DevOps: Docker, GitHub Actions (선택사항)

📌 프로젝트 구조

🐾 About AniMeds
반려동물의 건강과 행복을 위하여
AniMeds는 약물 추천을 넘어 예방, 치료, 정보 공유까지 지원하는 반려동물 통합 관리 플랫폼입니다.
