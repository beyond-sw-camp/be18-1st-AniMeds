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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

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


CREATE TABLE AnimalSpecies (
    species_id INT NOT NULL AUTO_INCREMENT COMMENT '동물 종 고유 ID (예: 고양이, 개)',
    species_name VARCHAR(100) NOT NULL COMMENT '동물 종 이름',
    PRIMARY KEY (species_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
    custom_description TEXT DEFAULT NULL COMMENT '사용자 자유 입력 설명 (예: 감기 같아요, 기침해요)',
    reported_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '증상 보고 시각',
    PRIMARY KEY (report_id),
    
    -- 외래 키 제약
    CONSTRAINT fk_usr_user FOREIGN KEY (user_id)
        REFERENCES User(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
        
    CONSTRAINT fk_usr_animal FOREIGN KEY (animal_id)
        REFERENCES Animal(animal_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_usr_symptom FOREIGN KEY (symptom_id)
        REFERENCES Symptom(symptom_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE Drug (
    drug_id INT NOT NULL AUTO_INCREMENT COMMENT '약물 고유 ID',
    drug_name VARCHAR(255) NOT NULL COMMENT '약물 이름',
    description TEXT DEFAULT NULL COMMENT '약물 설명',
    PRIMARY KEY (drug_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE Symptom_Drug_Map (
    map_id INT NOT NULL AUTO_INCREMENT COMMENT '증상-약물 매핑 고유 ID',
    symptom_id INT NOT NULL COMMENT '증상 ID',
    drug_id INT NOT NULL COMMENT '약물 ID',
    
    PRIMARY KEY (map_id),

    -- 중복 방지를 위한 유니크 제약
    UNIQUE KEY unique_symptom_drug (symptom_id, drug_id),

    -- 외래 키 제약
    FOREIGN KEY (symptom_id) REFERENCES Symptom(symptom_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (drug_id) REFERENCES Drug(drug_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE PrescriptionRecord (
    record_id INT NOT NULL AUTO_INCREMENT COMMENT '처방 기록 고유 ID',
    user_id INT NOT NULL COMMENT '누가 복약 처방했는지 추적',
    animal_id INT NOT NULL COMMENT '어떤 동물에게 복약 처방했는지 추적',
    drug_id INT NOT NULL COMMENT '처방된 약물 추적',
    symptom_id INT NOT NULL COMMENT '증상 기반 처방 추적',
    dose_given FLOAT DEFAULT NULL COMMENT '처방된 약의 용량',
    date_given DATE DEFAULT NULL COMMENT '약이 처방된 날짜',
    notes TEXT DEFAULT NULL COMMENT '기타 참고사항 또는 비고',
    
    PRIMARY KEY (record_id),

    FOREIGN KEY (user_id) REFERENCES User(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (animal_id) REFERENCES Animal(animal_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (drug_id) REFERENCES Drug(drug_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (symptom_id) REFERENCES Symptom(symptom_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE DrugSpeciesMapping (
    mapping_id INT NOT NULL AUTO_INCREMENT COMMENT '약물-동물종 매핑 고유 ID',
    drug_id INT NOT NULL COMMENT '약물별 사용 가능 종과 용량 설정',
    species_id INT NOT NULL COMMENT '약물 사용 가능 종 정보 연결',
    recommended_dose FLOAT DEFAULT NULL COMMENT '권장 복용량',
    max_dose FLOAT DEFAULT NULL COMMENT '최대 복용 가능량',
    min_dose FLOAT DEFAULT NULL COMMENT '최소 복용 가능량',
    contraindicated BOOLEAN NOT NULL COMMENT '금기 여부 (사용 금지 시 TRUE)',

    PRIMARY KEY (mapping_id),

    FOREIGN KEY (drug_id) REFERENCES Drug(drug_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (species_id) REFERENCES AnimalSpecies(species_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    UNIQUE KEY unique_drug_species (drug_id, species_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE DrugWarning (
    warning_id INT NOT NULL AUTO_INCREMENT COMMENT '약물 경고 고유 ID',
    drug_id INT NOT NULL COMMENT '경고 대상 약물',
    warning_type VARCHAR(100) NOT NULL COMMENT '경고 유형 (부작용, 금기, 과복용 등)',
    species_id INT DEFAULT NULL COMMENT '경고 대상 종 (선택사항)',
    symptom_id INT DEFAULT NULL COMMENT '관련 증상 (선택사항)',
    description TEXT DEFAULT NULL COMMENT '경고에 대한 상세 설명',
    severity VARCHAR(50) NOT NULL COMMENT '주의 수준 (주의, 경고, 위험 등)',
    source TEXT DEFAULT NULL COMMENT '경고 정보 출처',

    PRIMARY KEY (warning_id),

    FOREIGN KEY (drug_id) REFERENCES Drug(drug_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (species_id) REFERENCES AnimalSpecies(species_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (symptom_id) REFERENCES Symptom(symptom_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

CREATE TABLE DrugInteraction (
    interaction_id INT NOT NULL AUTO_INCREMENT COMMENT '약물 상호작용 고유 ID',
    drug_id_low INT NOT NULL COMMENT 'drug_id 중 작은 값',
    drug_id_high INT NOT NULL COMMENT 'drug_id 중 큰 값',
    interaction_risk VARCHAR(50) NOT NULL COMMENT '상호작용 시 위험 정도',
    interaction_detail TEXT DEFAULT NULL COMMENT '상호작용 상세 설명',
    
    PRIMARY KEY (interaction_id),

    UNIQUE KEY unique_pair (drug_id_low, drug_id_high),

    FOREIGN KEY (drug_id_low) REFERENCES Drug(drug_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (drug_id_high) REFERENCES Drug(drug_id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE Community (
    post_id INT NOT NULL AUTO_INCREMENT COMMENT '커뮤니티 게시글 고유 ID',
    user_id INT NOT NULL COMMENT '게시글 작성자 ID',
    title VARCHAR(255) NOT NULL COMMENT '게시글 제목',
    content TEXT DEFAULT NULL COMMENT '게시글 내용',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '게시글 작성 시각',

    PRIMARY KEY (post_id),

    FOREIGN KEY (user_id) REFERENCES User(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

CREATE TABLE Clinic (
    clinic_id INT NOT NULL AUTO_INCREMENT COMMENT '병원 고유 ID',
    name VARCHAR(255) NOT NULL COMMENT '병원 이름',
    address VARCHAR(255) DEFAULT NULL COMMENT '병원 주소 (선택)',
    contact VARCHAR(50) DEFAULT NULL COMMENT '연락처 (선택)',
    specialties TEXT DEFAULT NULL COMMENT '전문 진료 과목 (예: 내과, 정형외과)',
    
    PRIMARY KEY (clinic_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

CREATE TABLE VetAd (
    ad_id INT NOT NULL AUTO_INCREMENT COMMENT '광고 고유 ID',
    clinic_id INT NOT NULL COMMENT '광고를 낸 병원',
    target_species_id INT NOT NULL COMMENT '광고 타겟 동물 종',
    target_symptom_id INT NOT NULL COMMENT '광고 타겟 증상',
    priority INT NOT NULL COMMENT '광고 우선순위 (숫자 작을수록 높음)',
    start_date DATE NOT NULL COMMENT '광고 시작 날짜',
    end_date DATE NOT NULL COMMENT '광고 종료 날짜',

    PRIMARY KEY (ad_id),

    FOREIGN KEY (clinic_id) REFERENCES Clinic(clinic_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (target_species_id) REFERENCES AnimalSpecies(species_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (target_symptom_id) REFERENCES Symptom(symptom_id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE VetAdLog (
    log_id INT NOT NULL AUTO_INCREMENT COMMENT '광고 이벤트 로그 고유 ID',
    ad_id INT NOT NULL COMMENT '이벤트 대상 광고 ID',
    user_id INT NOT NULL COMMENT '이벤트 발생한 사용자 ID',
    animal_id INT NOT NULL COMMENT '이벤트 대상 동물',
    event_type VARCHAR(50) NOT NULL COMMENT '노출, 클릭 등 이벤트 유형',
    event_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '이벤트 발생 시각',

    PRIMARY KEY (log_id),

    FOREIGN KEY (ad_id) REFERENCES VetAd(ad_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (animal_id) REFERENCES Animal(animal_id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE VetAdBudget (
    budget_id INT NOT NULL AUTO_INCREMENT COMMENT '예산 고유 ID',
    clinic_id INT NOT NULL COMMENT '예산이 속한 병원',
    total_budget FLOAT NOT NULL COMMENT '총 광고 예산',
    remaining_budget FLOAT NOT NULL COMMENT '남아 있는 광고 예산',
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '예산 정보 마지막 업데이트 시각',

    PRIMARY KEY (budget_id),

    FOREIGN KEY (clinic_id) REFERENCES Clinic(clinic_id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

CREATE TABLE Partner (
    partner_id INT NOT NULL AUTO_INCREMENT COMMENT '제휴사 고유 ID',
    name VARCHAR(255) NOT NULL COMMENT '제휴사 이름',
    commission_rate FLOAT NOT NULL COMMENT '제휴 수수료율 (%)',
    api_url VARCHAR(500) DEFAULT NULL COMMENT '상품 연동용 API URL (선택)',

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
    map_id INT NOT NULL AUTO_INCREMENT COMMENT '증상-상품 매핑 고유 ID',
    symptom_id INT NOT NULL COMMENT '추천 기준 증상',
    species_id INT NOT NULL COMMENT '추천 대상 동물 종',
    product_id INT NOT NULL COMMENT '추천 상품 ID',

    PRIMARY KEY (map_id),

    FOREIGN KEY (symptom_id) REFERENCES Symptom(symptom_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (species_id) REFERENCES AnimalSpecies(species_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
        ON DELETE CASCADE ON UPDATE CASCADE,

    UNIQUE KEY unique_symptom_species_product (symptom_id, species_id, product_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

CREATE TABLE ProductClickLog (
    click_id INT NOT NULL AUTO_INCREMENT COMMENT '상품 클릭 로그 고유 ID',
    product_id INT NOT NULL COMMENT '대상 상품 ID',
    user_id INT NOT NULL COMMENT '이벤트 발생 사용자 ID',
    click_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '이벤트 발생 시각',
    event_type VARCHAR(50) NOT NULL COMMENT '클릭, 노출 등 이벤트 유형',

    PRIMARY KEY (click_id),

    FOREIGN KEY (product_id) REFERENCES Product(product_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;


CREATE TABLE UserSavedProduct (
    id INT NOT NULL AUTO_INCREMENT COMMENT '관심 상품 저장 고유 ID',
    user_id INT NOT NULL COMMENT '상품을 저장한 사용자 ID',
    product_id INT NOT NULL COMMENT '저장한 상품 ID',
    saved_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '저장한 시각',

    PRIMARY KEY (id),

    FOREIGN KEY (user_id) REFERENCES User(user_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
        ON DELETE CASCADE ON UPDATE CASCADE,

    UNIQUE KEY unique_user_product (user_id, product_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE ProductTag (
    tag_id INT NOT NULL AUTO_INCREMENT COMMENT '태그 고유 ID',
    product_id INT NOT NULL COMMENT '태그가 적용된 상품',
    tag_name VARCHAR(100) NOT NULL COMMENT '예: 관절, 알러지, 소형견용 등',

    PRIMARY KEY (tag_id),

    FOREIGN KEY (product_id) REFERENCES Product(product_id)
        ON DELETE CASCADE ON UPDATE CASCADE,

    UNIQUE KEY unique_product_tag (product_id, tag_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




