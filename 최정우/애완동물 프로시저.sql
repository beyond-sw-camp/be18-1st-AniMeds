-- 동물 등록 ------------------------------------------------------------
DELIMITER $$

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

    -- 1. 사용자 존재 여부
    SELECT COUNT(*) INTO v_exists
    FROM User
    WHERE user_id = p_user_id;

    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 사용자입니다.';
    END IF;

    -- 2. 역할 확인
    SELECT role INTO v_role
    FROM User
    WHERE user_id = p_user_id;

    IF v_role != '보호자' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '반려동물은 보호자만 등록할 수 있습니다.';
    END IF;

    -- 3. 종 존재 여부
    SELECT COUNT(*) INTO v_exists
    FROM AnimalSpecies
    WHERE species_id = p_species_id;

    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 동물 종입니다.';
    END IF;

    -- 4. 등록
    INSERT INTO Animal (user_id, name, species_id, weight, birth_date)
    VALUES (p_user_id, p_name, p_species_id, p_weight, p_birth_date);

    -- 5. 반환
    SET out_animal_id = LAST_INSERT_ID();
END $$

DELIMITER ;


-- 결과 받을 변수 선언
SET @animal_id = NULL;

-- 동물 등록
CALL sp_add_animal(
    1,              -- user_id
    '쫑이',         -- name
    2,              -- species_id (예: 개)
    4.5,            -- weight
    '2022-11-01',   -- birth_date
    @animal_id
);

SELECT @animal_id;

-- 내 반려동물 목록 조회
DELIMITER $$

DROP PROCEDURE IF EXISTS sp_get_user_animals $$

CREATE PROCEDURE sp_get_user_animals (
    IN p_user_id INT
)
BEGIN
    DECLARE v_exists INT;

    -- 1. 사용자 존재 여부 확인
    SELECT COUNT(*) INTO v_exists
    FROM User
    WHERE user_id = p_user_id;

    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 사용자입니다.';
    END IF;

    -- 2. 반려동물 존재 여부 확인
    SELECT COUNT(*) INTO v_exists
    FROM Animal
    WHERE user_id = p_user_id;

    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '등록된 반려동물이 없습니다.';
    END IF;

    -- 3. 반려동물 목록 조회
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


CALL sp_get_user_animals(1);


-- 처방 이력 확인 -----------------------------------------------------------------------

DELIMITER $$

DROP PROCEDURE IF EXISTS sp_get_animal_prescription_history $$

CREATE PROCEDURE sp_get_animal_prescription_history (
    IN p_user_id INT,
    IN p_animal_id INT
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

    -- 2. 반려동물 소유 여부 확인
    SELECT COUNT(*) INTO v_exists
    FROM Animal
    WHERE animal_id = p_animal_id AND user_id = p_user_id;

    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '해당 반려동물은 이 사용자에게 속하지 않습니다.';
    END IF;

    -- 3. 처방 이력 존재 여부
    SELECT COUNT(*) INTO v_exists
    FROM PrescriptionRecord
    WHERE animal_id = p_animal_id;

    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '처방 이력이 없습니다.';
    END IF;

    -- 4. 처방 이력 조회
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
-- 유저아이디랑 동물 아이디
CALL sp_get_animal_prescription_history(1, 2); 
