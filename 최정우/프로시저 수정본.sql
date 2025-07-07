DELIMITER $$

CREATE PROCEDURE ReportSymptomAndRecommendAll (
    IN p_user_id INT,
    IN p_animal_id INT,
    IN p_symptom_id INT,
    IN p_custom_description TEXT
)
BEGIN
    DECLARE v_species_id INT;

    -- 1. 반려동물 종 정보 조회
    SELECT species_id INTO v_species_id
    FROM Animal
    WHERE animal_id = p_animal_id;

    -- 2. 증상 보고 저장
    INSERT INTO UserSymptomReport (
        user_id, animal_id, symptom_id, custom_description, reported_at
    ) VALUES (
        p_user_id, p_animal_id, p_symptom_id, p_custom_description, NOW()
    );

    -- 3. 약물 추천 + 경고 + 상호작용 약물 표시
    SELECT
        d.drug_id,
        d.drug_name,
        dsm.recommended_dose,
        dsm.min_dose,
        dsm.max_dose,
        dsm.contraindicated,

        dw.warning_type,
        dw.description AS warning_description,
        dw.severity,

        GROUP_CONCAT(DISTINCT di2.drug_name SEPARATOR ', ') AS interaction_risks

    FROM Symptom_Drug_Map sdm
    JOIN Drug d ON sdm.drug_id = d.drug_id

    JOIN DrugSpeciesMapping dsm 
        ON d.drug_id = dsm.drug_id 
        AND dsm.species_id = v_species_id

    LEFT JOIN DrugWarning dw 
        ON dw.drug_id = d.drug_id
        AND (dw.species_id = v_species_id OR dw.species_id IS NULL)
        AND (dw.symptom_id = p_symptom_id OR dw.symptom_id IS NULL)

    LEFT JOIN DrugInteraction di 
        ON di.drug_id_low = d.drug_id OR di.drug_id_high = d.drug_id

    LEFT JOIN Drug di2 
        ON di2.drug_id = IF(di.drug_id_low = d.drug_id, di.drug_id_high, di.drug_id_low)

    WHERE sdm.symptom_id = p_symptom_id

    GROUP BY d.drug_id, d.drug_name, dsm.recommended_dose, dsm.min_dose, dsm.max_dose,
             dsm.contraindicated, dw.warning_type, dw.description, dw.severity;

    -- 4. 증상에 따른 상품 추천
    SELECT
        p.name AS product_name,
        p.price,
        p.product_link,
        p.image_url
    FROM Symptom_Product_Map spm
    JOIN Product p ON spm.product_id = p.product_id
    WHERE spm.symptom_id = p_symptom_id
      AND spm.species_id = v_species_id;

    -- 5. 병원 광고 추천
    SELECT
        c.name AS clinic_name,
        c.address,
        c.contact,
        va.priority,
        va.start_date,
        va.end_date
    FROM VetAd va
    JOIN Clinic c ON va.clinic_id = c.clinic_id
    WHERE va.target_species_id = v_species_id
      AND va.target_symptom_id = p_symptom_id
      AND CURDATE() BETWEEN va.start_date AND va.end_date
    ORDER BY va.priority ASC;  -- 숫자 작을수록 우선
END $$

DELIMITER ;

CALL ReportSymptomAndRecommendAll(1, 1, 1, '기침을 하루 종일 해요');



