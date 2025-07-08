-- 증상 리스트업--
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


-- 증상 등록 -------------------------
DELIMITER $$

DROP PROCEDURE IF EXISTS save_user_symptom_report $$

CREATE PROCEDURE save_user_symptom_report (
    IN p_user_id INT,
    IN p_animal_id INT,
    IN p_symptom_id INT,
    IN p_custom_description TEXT
)
BEGIN
    DECLARE v_exists INT;

    -- 1. 사용자 확인
    SELECT COUNT(*) INTO v_exists
    FROM User
    WHERE user_id = p_user_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 사용자입니다.';
    END IF;

    -- 2. 동물 소유 확인
    SELECT COUNT(*) INTO v_exists
    FROM Animal
    WHERE animal_id = p_animal_id AND user_id = p_user_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '해당 동물은 사용자 소유가 아닙니다.';
    END IF;

    -- 3. 증상 존재 확인
    SELECT COUNT(*) INTO v_exists
    FROM Symptom
    WHERE symptom_id = p_symptom_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 증상입니다.';
    END IF;

    -- 4. 증상 보고 저장
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

CALL save_user_symptom_report(
    6,         -- user_id
    10,         -- animal_id
    1,         -- symptom_id (예: 기침)
    '기침을 자주 해요'
);

-- 증상 히스토리 --
DELIMITER $$

DROP PROCEDURE IF EXISTS get_symptom_report_history $$

CREATE PROCEDURE get_symptom_report_history (
    IN p_user_id INT,
    IN p_animal_id INT
)
BEGIN
    DECLARE v_exists INT;

    -- 1. 사용자 확인
    SELECT COUNT(*) INTO v_exists
    FROM User
    WHERE user_id = p_user_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 사용자입니다.';
    END IF;

    -- 2. 동물 소유 확인
    SELECT COUNT(*) INTO v_exists
    FROM Animal
    WHERE animal_id = p_animal_id AND user_id = p_user_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '해당 동물은 사용자 소유가 아닙니다.';
    END IF;

    -- 3. 보고 이력 확인
    SELECT COUNT(*) INTO v_exists
    FROM UserSymptomReport
    WHERE animal_id = p_animal_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '증상 보고 이력이 없습니다.';
    END IF;

    -- 4. 이력 조회
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

CALL get_symptom_report_history(1, 2);

-- 약물 추천 ---------------
DELIMITER $$

DROP PROCEDURE IF EXISTS sp_get_symptom_drug_warnings $$

CREATE PROCEDURE sp_get_symptom_drug_warnings (
    IN p_species_id INT,
    IN p_symptom_id INT
)
BEGIN
    DECLARE v_exists INT;

    -- 1. 종 존재 확인
    SELECT COUNT(*) INTO v_exists
    FROM AnimalSpecies
    WHERE species_id = p_species_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 동물 종입니다.';
    END IF;

    -- 2. 증상 존재 확인
    SELECT COUNT(*) INTO v_exists
    FROM Symptom
    WHERE symptom_id = p_symptom_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 증상입니다.';
    END IF;

    -- 3. 경고 존재 확인
    SELECT COUNT(*) INTO v_exists
    FROM DrugWarning
    WHERE (species_id = p_species_id OR species_id IS NULL)
      AND (symptom_id = p_symptom_id OR symptom_id IS NULL);
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '관련 약물 경고가 없습니다.';
    END IF;

    -- 4. 경고 정보 반환
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

CALL sp_get_symptom_drug_warnings(1, 1);  -- 예: 고양이의 기침


-- 동일한 반려동물에 대해 같은 증상을 하루에 여러 번 보고하지 못하도록 차단합니다.
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

    -- 1. 사용자 존재 확인
    SELECT COUNT(*) INTO v_exists
    FROM User
    WHERE user_id = p_user_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 사용자입니다.';
    END IF;

    -- 2. 동물 소유 확인
    SELECT COUNT(*) INTO v_exists
    FROM Animal
    WHERE animal_id = p_animal_id AND user_id = p_user_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '해당 동물은 사용자 소유가 아닙니다.';
    END IF;

    -- 3. 증상 존재 확인
    SELECT COUNT(*) INTO v_exists
    FROM Symptom
    WHERE symptom_id = p_symptom_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 증상입니다.';
    END IF;

    -- 4. 중복 보고 확인 (오늘 날짜 기준)
    SELECT COUNT(*) INTO v_exists
    FROM UserSymptomReport
    WHERE user_id = p_user_id
      AND animal_id = p_animal_id
      AND symptom_id = p_symptom_id
      AND DATE(reported_at) = CURDATE();

    IF v_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '오늘은 이 증상에 대해 이미 보고했습니다.';
    END IF;

    -- 5. 보고 저장
    INSERT INTO UserSymptomReport (
        user_id, animal_id, symptom_id, custom_description, reported_at
    ) VALUES (
        p_user_id, p_animal_id, p_symptom_id, p_custom_description, NOW()
    );
END $$

DELIMITER ;

CALL sp_save_symptom_report_once_per_day(1, 1, 1, '기침 계속함');

-- 복용량 경고 --------------------------------------------------------------
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

    -- 1. 동물 존재 여부 및 체중/종 정보
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

    -- 2. 증상 존재 여부 확인
    SELECT COUNT(*) INTO v_exists FROM Symptom WHERE symptom_id = p_symptom_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 증상입니다.';
    END IF;

    -- 3. 복용량 정보 + 과복용 여부 반환
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



-- 동시에 처방하면 안되는 약물 조합 ----
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
      AND d_other.drug_id IS NOT NULL  -- 상대 약물이 있어야만 의미 있음
    ORDER BY d.drug_id, interacts_with;
END $$

DELIMITER ;


CALL sp_check_interaction_risk(1, 1); -- 기침, 고양이

-- 수의사가 처방전을 작성 --------------

DELIMITER $$

DROP PROCEDURE IF EXISTS sp_add_prescription $$

CREATE PROCEDURE sp_add_prescription (
    IN p_user_id INT,
    IN p_animal_id INT,
    IN p_symptom_id INT,
    IN p_drug_id INT,
    IN p_dose_given FLOAT,
    IN p_date_given DATE,
    IN p_notes TEXT
)
BEGIN
    DECLARE v_role ENUM('보호자', '수의사', '관리자');
    DECLARE v_species_id INT;
    DECLARE v_contraindicated BOOLEAN DEFAULT FALSE;
    DECLARE v_min_dose FLOAT;
    DECLARE v_max_dose FLOAT;
    DECLARE v_exists INT;

    -- 1. 사용자 존재 여부 + 역할 확인
    SELECT COUNT(*) INTO v_exists FROM User WHERE user_id = p_user_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 사용자입니다.';
    END IF;

    SELECT role INTO v_role FROM User WHERE user_id = p_user_id;
    IF v_role != '수의사' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '수의사만 처방 등록이 가능합니다.';
    END IF;

    -- 2. 반려동물 존재 여부 및 종 ID
    SELECT COUNT(*) INTO v_exists FROM Animal WHERE animal_id = p_animal_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 반려동물입니다.';
    END IF;

    SELECT species_id INTO v_species_id FROM Animal WHERE animal_id = p_animal_id;

    -- 3. 증상 존재 여부
    SELECT COUNT(*) INTO v_exists FROM Symptom WHERE symptom_id = p_symptom_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 증상입니다.';
    END IF;

    -- 4. 약물 존재 여부
    SELECT COUNT(*) INTO v_exists FROM Drug WHERE drug_id = p_drug_id;
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 약물입니다.';
    END IF;

    -- 5. 금기 여부 + 용량 확인
    SELECT contraindicated, min_dose, max_dose
    INTO v_contraindicated, v_min_dose, v_max_dose
    FROM DrugSpeciesMapping
    WHERE drug_id = p_drug_id AND species_id = v_species_id;

    IF v_contraindicated THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '이 종에 금기된 약물로 처방할 수 없습니다.';
    END IF;

    --  복용량 체크
    IF p_dose_given < v_min_dose OR p_dose_given > v_max_dose THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '복용량이 허용 범위를 벗어났습니다.';
    END IF;

    -- 6. 처방 기록 삽입
    INSERT INTO PrescriptionRecord (
        user_id, animal_id, drug_id, symptom_id,
        dose_given, date_given, notes
    ) VALUES (
        p_user_id, p_animal_id, p_drug_id, p_symptom_id,
        p_dose_given, p_date_given, p_notes
    );
END $$

DELIMITER ;

CALL sp_add_prescription(
    3,           -- user_id (김수의, 수의사)
    1,           -- animal_id (나비)
    1,           -- symptom_id (기침)
    1,           -- drug_id (페토민)
    5.0,         -- dose_given
    CURDATE(),   -- date_given
    '기침 완화 목적' -- notes
);



