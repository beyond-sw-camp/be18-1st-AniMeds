USE employees_db;
DROP PROCEDURE IF EXISTS GetAnimalInfoByUser;
DELIMITER $$
CREATE PROCEDURE GetAnimalInfoByUser(
   IN in_user_id INT 
)
BEGIN
    -- 사용자 존재 여부 확인
    IF NOT EXISTS (
        SELECT 1 FROM user WHERE user_id = in_user_id
    ) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = '등록된 사용자가 없습니다';
    END IF;

    -- 반려동물 + 증상 조회
    SELECT 
        u.name AS user_name, 
        a.name AS animal_name, 
        s.species_name,
        r.custom_description
    FROM 
        User u
        JOIN Animal a ON u.user_id = a.user_id
        JOIN AnimalSpecies s ON a.species_id = s.species_id
        JOIN usersymptomreport r ON r.animal_id = a.animal_id
    WHERE u.user_id = in_user_id;
    -- 증상 미기록 알림
    IF EXISTS (
        SELECT 1 
        FROM animal a
        JOIN usersymptomreport r ON r.animal_id = a.animal_id
        WHERE a.user_id = in_user_id
        AND r.custom_description IS NULL
    ) THEN
        SELECT '애완동물의 증상 정보를 등록해주세요' AS 알림;
    END IF;
END $$
DELIMITER ;
call GetAnimalInfoByUser(1);

