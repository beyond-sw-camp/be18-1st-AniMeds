
DELIMITER $$

CREATE PROCEDURE FullPetCareRecommendation (
    IN in_user_id INT,
    IN in_animal_id INT,
    IN in_symptom_id INT,
    IN in_description TEXT
)
BEGIN
    DECLARE v_species_id INT;

    -- 1. 증상 보고 기록
    INSERT INTO UserSymptomReport (user_id, animal_id, symptom_id, custom_description, reported_at)
    VALUES (in_user_id, in_animal_id, in_symptom_id, in_description, NOW());

    -- 2. 동물 종 확인
    SELECT species_id INTO v_species_id
    FROM Animal
    WHERE animal_id = in_animal_id;

    -- 3. 약물 추천 + 권장 용량 + 금기 여부
    SELECT
        d.drug_id,
        d.drug_name,
        d.description AS drug_description,
        dm.recommended_dose,
        dm.min_dose,
        dm.max_dose,
        dm.contraindicated
    FROM Symptom_Drug_Map sdm
    JOIN Drug d ON sdm.drug_id = d.drug_id
    LEFT JOIN DrugSpeciesMapping dm ON dm.drug_id = d.drug_id AND dm.species_id = v_species_id
    WHERE sdm.symptom_id = in_symptom_id;

    -- 4. 약물 경고 정보
    SELECT
        dw.drug_id,
        d.drug_name,
        dw.warning_type,
        dw.severity,
        dw.description,
        dw.source
    FROM DrugWarning dw
    JOIN Drug d ON d.drug_id = dw.drug_id
    WHERE dw.symptom_id = in_symptom_id
       OR dw.species_id = v_species_id;

    -- 5. 약물 상호작용 정보
    SELECT
        di.drug_id_low,
        d1.drug_name AS drug_name_low,
        di.drug_id_high,
        d2.drug_name AS drug_name_high,
        di.interaction_risk,
        di.interaction_detail
    FROM DrugInteraction di
    JOIN Drug d1 ON d1.drug_id = di.drug_id_low
    JOIN Drug d2 ON d2.drug_id = di.drug_id_high
    WHERE di.drug_id_low IN (
        SELECT drug_id FROM Symptom_Drug_Map WHERE symptom_id = in_symptom_id
    ) OR di.drug_id_high IN (
        SELECT drug_id FROM Symptom_Drug_Map WHERE symptom_id = in_symptom_id
    );

    -- 6. 증상 + 종 기반 상품 추천
    SELECT
        p.product_id,
        p.name,
        p.description,
        p.price,
        p.product_link
    FROM Symptom_Product_Map spm
    JOIN Product p ON spm.product_id = p.product_id
    WHERE spm.symptom_id = in_symptom_id
      AND spm.species_id = v_species_id;

    -- 7. 병원 광고 추천
    SELECT
        va.ad_id,
        c.name AS clinic_name,
        c.contact,
        c.address,
        va.priority,
        va.start_date,
        va.end_date
    FROM VetAd va
    JOIN Clinic c ON c.clinic_id = va.clinic_id
    WHERE va.target_symptom_id = in_symptom_id
      AND va.target_species_id = v_species_id
      AND CURDATE() BETWEEN va.start_date AND va.end_date
    ORDER BY va.priority ASC;
END$$

DELIMITER ;

