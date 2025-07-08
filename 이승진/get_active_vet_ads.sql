-- 현재 날짜(CURDATE)를 기준으로 진행 중인 광고만 조회
-- 각 광고의 병원 이름, 동물 종, 증상 정보를 포함
-- 광고 시작일, 종료일, 그리고 종료까지 며칠 남았는지 계산하여 출력
DELIMITER $$

CREATE PROCEDURE GetActiveVetAdsWithRemainingDays()
BEGIN
    SELECT 
        va.ad_id AS ad_id,
        c.name AS clinic_name,
        s.species_name,
        sy.description AS symptom,
        DATE_FORMAT(va.start_date, '%Y-%m-%d') AS start_date,
        DATE_FORMAT(va.end_date, '%Y-%m-%d') AS end_date,
        DATEDIFF(va.end_date, CURDATE()) AS days_remaining
    FROM VetAd va
    INNER JOIN Clinic c ON va.clinic_id = c.clinic_id
    INNER JOIN AnimalSpecies s ON va.target_species_id = s.species_id
    INNER JOIN Symptom sy ON va.target_symptom_id = sy.symptom_id
    WHERE CURDATE() BETWEEN va.start_date AND va.end_date
    ORDER BY days_remaining ASC;
END$$

DELIMITER ;

CALL GetActiveVetAdsWithRemainingDays();

