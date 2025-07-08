USE employees_db;
DROP PROCEDURE IF EXISTS AddVetAd;
DELIMITER $$
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
      SET MESSAGE_TEXT = '이미 등록된 병원입니다.';
   ELSE
      -- 병원 정보 삽입
      INSERT INTO vetad (clinic_id, target_species_id, target_symptom_id, start_date, end_date)
      VALUES (   in_clinic_id,
			in_target_species_id,
   		in_target_symptom_id,
   		in_priority,
   		in_start_date,
   		in_end_date 
   	);
      SELECT * FROM vetad;
   END IF;
END $$

DELIMITER ;

CALL AddClinic('연세병원', '서울시 강남구 역삼동 123', '02-123-4567', '내과');
