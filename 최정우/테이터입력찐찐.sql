INSERT INTO User (email, phone, password, name, role, created_at) VALUES
('owner1@example.com', '010-1111-2222', 'hashed_pw_1', '홍길동', '보호자', NOW()),
('owner2@example.com', '010-2222-3333', 'hashed_pw_2', '이순신', '보호자', NOW()),
('vet1@example.com',   '010-3333-4444', 'hashed_pw_3', '김수의', '수의사', NOW()),
('vet2@example.com',   '010-4444-5555', 'hashed_pw_4', '박치료', '수의사', NOW()),
('admin@example.com',  '010-5555-6666', 'hashed_pw_5', '관리자', '관리자', NOW());

INSERT INTO UserSession (user_id, token, created_at, expired_at) VALUES
(1, 'token_user1_session1', NOW(), DATE_ADD(NOW(), INTERVAL 1 DAY)),
(2, 'token_user2_session1', NOW(), DATE_ADD(NOW(), INTERVAL 1 DAY)),
(3, 'token_vet1_session1', NOW(), DATE_ADD(NOW(), INTERVAL 1 DAY)),
(4, 'token_vet2_session1', NOW(), DATE_ADD(NOW(), INTERVAL 1 DAY)),
(5, 'token_admin_session1', NOW(), DATE_ADD(NOW(), INTERVAL 1 DAY));

INSERT INTO AnimalSpecies (species_name) VALUES
('고양이'), ('개'), ('토끼'), ('햄스터'), ('페럿');

INSERT INTO Animal (user_id, name, species_id, weight, birth_date) VALUES
(1, '나비', 1, 4.2, '2020-03-01'),
(1, '뽀삐', 2, 9.5, '2019-07-15'),
(2, '초코', 3, 1.3, '2021-01-20'),
(2, '콩이', 4, 0.2, '2022-09-10'),
(1, '후추', 5, 0.9, '2018-05-30');

INSERT INTO Symptom (description) VALUES
('기침'), ('설사'), ('구토'), ('식욕부진'), ('피부 가려움');

INSERT INTO UserSymptomReport (user_id, animal_id, symptom_id, custom_description, reported_at) VALUES
(1, 1, 1, '기침을 자주 하고 숨이 차보임', NOW()),
(1, 2, 2, '설사를 하루에 3번 이상 함', NOW()),
(2, 3, 3, '구토와 식욕 저하가 동반됨', NOW()),
(2, 4, 4, '밥을 거의 안 먹고 축 처짐', NOW()),
(1, 5, 5, '긁는 행동이 잦고 피부에 붉은 자국 있음', NOW());

INSERT INTO Drug (drug_name, description) VALUES
('페토민', '기침 완화용 시럽'),
('베타콜린', '소화 기능 개선제'),
('지노탈', '구토 억제제'),
('슬립펫', '진정 및 수면 보조제'),
('스킨케어겔', '피부 가려움 완화 젤');

INSERT INTO DrugSpeciesMapping (drug_id, species_id, recommended_dose, max_dose, min_dose, contraindicated) VALUES
(1, 1, 5.0, 8.0, 2.0, FALSE),
(2, 2, 3.0, 6.0, 1.0, FALSE),
(3, 3, 1.5, 2.5, 1.0, FALSE),
(4, 4, 0.5, 1.0, 0.2, FALSE),
(5, 5, 2.0, 4.0, 1.0, FALSE);

INSERT INTO PrescriptionRecord (user_id, animal_id, drug_id, symptom_id, dose_given, date_given, notes) VALUES
(3, 1, 1, 1, 5.0, CURDATE(), '기침 완화용으로 페토민 처방'),
(3, 2, 2, 2, 3.0, CURDATE(), '설사 증상에 베타콜린 처방'),
(4, 3, 3, 3, 1.5, CURDATE(), '구토 증상에 지노탈 사용'),
(4, 4, 4, 4, 0.5, CURDATE(), '식욕부진에 슬립펫 복용'),
(3, 5, 5, 5, 2.0, CURDATE(), '피부 가려움에 스킨케어겔 처방');

INSERT INTO DrugWarning (drug_id, warning_type, species_id, symptom_id, description, severity, source) VALUES
(1, '과다복용 주의', 1, 1, '고양이의 경우 8mg 이상 투여 시 호흡 곤란 가능성 있음', '높음', '임상 가이드라인'),
(2, '장기 복용 금지', 2, 2, '개가 장기 복용 시 간 기능 저하 우려', '중간', '내부 연구 자료'),
(3, '체중 1kg 미만 금기', 3, 3, '1kg 이하 토끼는 구토약 복용 시 쇼크 위험 있음', '높음', '논문 사례'),
(4, '졸림 유발', 4, NULL, '햄스터는 슬립펫 복용 시 졸림과 무기력 증가 가능성 있음', '낮음', '수의사 보고'),
(5, '상처 부위 사용 금지', 5, 5, '상처 부위에 바르면 자극 유발 가능', '중간', '제조사 문서');

INSERT INTO DrugInteraction (drug_id_low, drug_id_high, interaction_risk, interaction_detail) VALUES
(1, 2, '중간', '페토민과 베타콜린 병용 시 위장 장애 유발 가능'),
(2, 3, '낮음', '베타콜린과 지노탈은 큰 상호작용 없음'),
(3, 4, '높음', '지노탈과 슬립펫 병용 시 과도한 진정 효과'),
(1, 5, '중간', '페토민과 스킨케어겔 병용 시 약효 감소 가능성'),
(4, 5, '낮음', '슬립펫과 스킨케어겔은 병용 시 큰 문제 없음');

INSERT INTO Clinic (name, address, contact, specialties) VALUES
('서울펫동물병원', '서울시 마포구', '02-111-1111', '내과, 피부과'),
('부산동물메디컬', '부산시 해운대구', '051-222-2222', '외과, 종양'),
('대구24시동물병원', '대구시 수성구', '053-333-3333', '응급, 영상의학'),
('광주펫케어', '광주시 북구', '062-444-4444', '안과, 치과'),
('제주반려동물병원', '제주시 애월읍', '064-555-5555', '일반진료');

INSERT INTO VetAd (clinic_id, target_species_id, target_symptom_id, priority, start_date, end_date) VALUES
(1, 1, 1, 10, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 30 DAY)),
(2, 2, 2, 8, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 15 DAY)),
(3, 3, 3, 7, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 20 DAY)),
(4, 4, 4, 9, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 10 DAY)),
(5, 5, 5, 6, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 25 DAY));

INSERT INTO VetAdLog (ad_id, user_id, animal_id, event_type) VALUES
(1, 1, 1, 'view'),
(2, 1, 2, 'click'),
(3, 2, 3, 'view'),
(4, 2, 4, 'click'),
(5, 1, 5, 'view');

INSERT INTO VetAdBudget (clinic_id, total_budget, remaining_budget) VALUES
(1, 100000, 85000),
(2, 120000, 95000),
(3, 80000, 60000),
(4, 50000, 40000),
(5, 70000, 70000);

INSERT INTO Partner (name, commission_rate, api_url) VALUES
('펫스토어코리아', 0.10, 'https://api.petstorekorea.com'),
('헬씨펫몰', 0.15, 'https://api.healthypetmall.com'),
('올펫샵', 0.12, 'https://api.allpetshop.com'),
('동물사랑몰', 0.08, 'https://api.animalove.com'),
('펫마켓플러스', 0.11, 'https://api.petmarketplus.com');

INSERT INTO Product (partner_id, name, description, image_url, price, product_link) VALUES
(1, '기침완화 영양제', '반려동물용 기침 개선 영양제', 'https://image.pet/1.jpg', 18000, 'https://shop.pet/1'),
(2, '강아지 설사약', '민감한 장을 위한 처방용 설사약', 'https://image.pet/2.jpg', 22000, 'https://shop.pet/2'),
(3, '구토 억제제', '구토 예방 및 위장 안정제', 'https://image.pet/3.jpg', 19500, 'https://shop.pet/3'),
(4, '식욕촉진제', '소형동물 전용 식욕 자극제', 'https://image.pet/4.jpg', 15000, 'https://shop.pet/4'),
(5, '피부진정 크림', '가려움 완화 피부전용 크림', 'https://image.pet/5.jpg', 16500, 'https://shop.pet/5');

INSERT INTO Symptom_Product_Map (symptom_id, species_id, product_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

INSERT INTO ProductClickLog (product_id, user_id, event_type) VALUES
(1, 1, 'click'),
(2, 1, 'click'),
(3, 2, 'view'),
(4, 2, 'click'),
(5, 1, 'view');

INSERT INTO UserSavedProduct (user_id, product_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(1, 5);

INSERT INTO ProductTag (product_id, tag_name) VALUES
(1, '기침'),
(2, '설사'),
(3, '구토'),
(4, '식욕부진'),
(5, '피부케어');

INSERT INTO Symptom_Drug_Map (symptom_id, drug_id) VALUES
(1, 1),  -- 기침 → 페토민
(2, 2),  -- 설사 → 베타콜린
(3, 3),  -- 구토 → 지노탈
(4, 4),  -- 식욕부진 → 슬립펫
(5, 5);  -- 피부 가려움 → 스킨케어겔

