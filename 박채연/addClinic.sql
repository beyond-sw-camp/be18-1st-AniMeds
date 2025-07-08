USE employees_db;
DROP PROCEDURE IF EXISTS AddClinic;
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
