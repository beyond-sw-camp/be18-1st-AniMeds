-- 사용자 테이블
CREATE TABLE User (
    user_id INT NOT NULL AUTO_INCREMENT COMMENT '시스템 고유 사용자 ID',
    email VARCHAR(255) NOT NULL COMMENT '이메일 (로그인 및 커뮤니케이션용)',
    phone VARCHAR(20) NOT NULL COMMENT '전화번호',
    password VARCHAR(100) NOT NULL COMMENT '해시된 비밀번호',
    name VARCHAR(100) NOT NULL COMMENT '이름 또는 닉네임',
    role VARCHAR(20) NOT NULL COMMENT '사용자 유형: 보호자, 수의사, 관리자 등',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '계정 생성일시',
    PRIMARY KEY (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE UserSession (
    session_id INT NOT NULL AUTO_INCREMENT COMMENT '사용자 세션 고유 ID',
    user_id INT NOT NULL COMMENT 'User 테이블의 user_id 참조',
    token VARCHAR(255) NOT NULL COMMENT 'JWT 인증 토큰',
    created_at DATETIME NOT NULL COMMENT '세션 생성 시각',
    expired_at DATETIME NOT NULL COMMENT '세션 만료 시각',
    PRIMARY KEY (session_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 동물 및 종
CREATE TABLE AnimalSpecies (
    species_id INT NOT NULL AUTO_INCREMENT COMMENT '동물 종 고유 ID (예: 고양이, 개)',
    species_name VARCHAR(100) NOT NULL COMMENT '동물 종 이름',
    PRIMARY KEY (species_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Animal (
    animal_id INT NOT NULL AUTO_INCREMENT COMMENT '반려동물 고유 ID',
    user_id INT NOT NULL COMMENT '반려동물의 보호자 사용자 식별',
    name VARCHAR(255) NOT NULL COMMENT '반려동물 이름',
    species_id INT NOT NULL COMMENT '동물의 종 정보 연결 (예: 고양이, 개)',
    weight FLOAT DEFAULT NULL COMMENT '반려동물 체중 (kg)',
    birth_date DATE DEFAULT NULL COMMENT '동물 생일 / 나이',
    PRIMARY KEY (animal_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (species_id) REFERENCES AnimalSpecies(species_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 증상 및 보고
CREATE TABLE Symptom (
    symptom_id INT NOT NULL AUTO_INCREMENT COMMENT '증상 고유 ID',
    description TEXT NOT NULL COMMENT '증상 설명 (예: 기침, 설사 등)',
    PRIMARY KEY (symptom_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE UserSymptomReport (
    report_id INT NOT NULL AUTO_INCREMENT COMMENT '사용자 증상 보고 고유 ID',
    user_id INT NOT NULL COMMENT '보고한 사용자',
    animal_id INT NOT NULL COMMENT '대상 반려동물',
    symptom_id INT NOT NULL COMMENT '사용자가 선택한 증상',
    custom_description TEXT DEFAULT NULL COMMENT '사용자 자유 입력 설명',
    reported_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '증상 보고 시각',
    PRIMARY KEY (report_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (animal_id) REFERENCES Animal(animal_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (symptom_id) REFERENCES Symptom(symptom_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 약물 및 통합 매핑
CREATE TABLE Drug (
    drug_id INT NOT NULL AUTO_INCREMENT COMMENT '약물 고유 ID',
    drug_name VARCHAR(255) NOT NULL COMMENT '약물 이름',
    description TEXT DEFAULT NULL COMMENT '약물 설명',
    PRIMARY KEY (drug_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ✅ 통합 테이블
CREATE TABLE SymptomDrugSpeciesMap (
    map_id INT NOT NULL AUTO_INCREMENT COMMENT '증상-약물-동물종 매핑 고유 ID',
    symptom_id INT NOT NULL COMMENT '증상 ID',
    drug_id INT NOT NULL COMMENT '약물 ID',
    species_id INT NOT NULL COMMENT '동물 종 ID',
    recommended_dose FLOAT DEFAULT NULL COMMENT '권장 복용량',
    max_dose FLOAT DEFAULT NULL COMMENT '최대 복용 가능량',
    min_dose FLOAT DEFAULT NULL COMMENT '최소 복용 가능량',
    contraindicated BOOLEAN NOT NULL DEFAULT FALSE COMMENT '금기 여부',
    PRIMARY KEY (map_id),
    UNIQUE KEY unique_symptom_drug_species (symptom_id, drug_id, species_id),
    FOREIGN KEY (symptom_id) REFERENCES Symptom(symptom_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (drug_id) REFERENCES Drug(drug_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (species_id) REFERENCES AnimalSpecies(species_id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 처방
CREATE TABLE PrescriptionRecord (
    record_id INT NOT NULL AUTO_INCREMENT COMMENT '처방 기록 고유 ID',
    user_id INT NOT NULL COMMENT '누가 처방했는지',
    animal_id INT NOT NULL COMMENT '처방 대상 동물',
    drug_id INT NOT NULL COMMENT '처방된 약물',
    symptom_id INT NOT NULL COMMENT '처방 근거 증상',
    dose_given FLOAT DEFAULT NULL COMMENT '처방 용량',
    date_given DATE DEFAULT NULL COMMENT '처방 날짜',
    notes TEXT DEFAULT NULL COMMENT '기타 참고사항',
    PRIMARY KEY (record_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (animal_id) REFERENCES Animal(animal_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (drug_id) REFERENCES Drug(drug_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (symptom_id) REFERENCES Symptom(symptom_id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 경고 및 상호작용
CREATE TABLE DrugWarning (
    warning_id INT NOT NULL AUTO_INCREMENT COMMENT '약물 경고 고유 ID',
    drug_id INT NOT NULL,
    warning_type VARCHAR(100) NOT NULL,
    species_id INT DEFAULT NULL,
    symptom_id INT DEFAULT NULL,
    description TEXT DEFAULT NULL,
    severity VARCHAR(50) NOT NULL,
    source TEXT DEFAULT NULL,
    PRIMARY KEY (warning_id),
    FOREIGN KEY (drug_id) REFERENCES Drug(drug_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (species_id) REFERENCES AnimalSpecies(species_id)
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (symptom_id) REFERENCES Symptom(symptom_id)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE DrugInteraction (
    interaction_id INT NOT NULL AUTO_INCREMENT COMMENT '약물 상호작용 고유 ID',
    drug_id_low INT NOT NULL,
    drug_id_high INT NOT NULL,
    interaction_risk VARCHAR(50) NOT NULL,
    interaction_detail TEXT DEFAULT NULL,
    PRIMARY KEY (interaction_id),
    UNIQUE KEY unique_pair (drug_id_low, drug_id_high),
    FOREIGN KEY (drug_id_low) REFERENCES Drug(drug_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (drug_id_high) REFERENCES Drug(drug_id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 커뮤니티
CREATE TABLE Community (
    post_id INT NOT NULL AUTO_INCREMENT COMMENT '커뮤니티 게시글 고유 ID',
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT DEFAULT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (post_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 병원 및 광고
CREATE TABLE Clinic (
    clinic_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) DEFAULT NULL,
    contact VARCHAR(50) DEFAULT NULL,
    specialties TEXT DEFAULT NULL,
    PRIMARY KEY (clinic_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE VetAd (
    ad_id INT NOT NULL AUTO_INCREMENT,
    clinic_id INT NOT NULL,
    target_species_id INT NOT NULL,
    target_symptom_id INT NOT NULL,
    priority INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    PRIMARY KEY (ad_id),
    FOREIGN KEY (clinic_id) REFERENCES Clinic(clinic_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (target_species_id) REFERENCES AnimalSpecies(species_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (target_symptom_id) REFERENCES Symptom(symptom_id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE VetAdLog (
    log_id INT NOT NULL AUTO_INCREMENT,
    ad_id INT NOT NULL,
    user_id INT NOT NULL,
    animal_id INT NOT NULL,
    event_type VARCHAR(50) NOT NULL,
    event_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (log_id),
    FOREIGN KEY (ad_id) REFERENCES VetAd(ad_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (animal_id) REFERENCES Animal(animal_id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE VetAdBudget (
    budget_id INT NOT NULL AUTO_INCREMENT,
    clinic_id INT NOT NULL,
    total_budget FLOAT NOT NULL,
    remaining_budget FLOAT NOT NULL,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (budget_id),
    FOREIGN KEY (clinic_id) REFERENCES Clinic(clinic_id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 커머스
CREATE TABLE Partner (
    partner_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    commission_rate FLOAT NOT NULL,
    api_url VARCHAR(500) DEFAULT NULL,
    PRIMARY KEY (partner_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Product (
    product_id INT NOT NULL AUTO_INCREMENT,
    partner_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT DEFAULT NULL,
    image_url VARCHAR(500) DEFAULT NULL,
    price FLOAT NOT NULL CHECK (price >= 0),
    product_link VARCHAR(500) DEFAULT NULL,
    PRIMARY KEY (product_id),
    FOREIGN KEY (partner_id) REFERENCES Partner(partner_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Symptom_Product_Map (
    map_id INT NOT NULL AUTO_INCREMENT,
    symptom_id INT NOT NULL,
    species_id INT NOT NULL,
    product_id INT NOT NULL,
    PRIMARY KEY (map_id),
    UNIQUE KEY unique_symptom_species_product (symptom_id, species_id, product_id),
    FOREIGN KEY (symptom_id) REFERENCES Symptom(symptom_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (species_id) REFERENCES AnimalSpecies(species_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE ProductClickLog (
    click_id INT NOT NULL AUTO_INCREMENT,
    product_id INT NOT NULL,
    user_id INT NOT NULL,
    click_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    event_type VARCHAR(50) NOT NULL,
    PRIMARY KEY (click_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE UserSavedProduct (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    saved_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY unique_user_product (user_id, product_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE ProductTag (
    tag_id INT NOT NULL AUTO_INCREMENT,
    product_id INT NOT NULL,
    tag_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (tag_id),
    UNIQUE KEY unique_product_tag (product_id, tag_name),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
