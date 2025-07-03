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
    INSERT INTO UserSymptomReport (user_id, animal_id, symptom_id, custom_description, reported_at)
    VALUES (p_user_id, p_animal_id, p_symptom_id, p_custom_description, NOW());

    -- 3. 약물 추천 + 경고 + 상호작용 약물 표시
    SELECT
        d.drug_id,
        d.drug_name,
        m.recommended_dose,
        m.min_dose,
        m.max_dose,
        m.contraindicated,
        w.warning_type,
        w.description AS warning_description,
        w.severity,
        GROUP_CONCAT(DISTINCT d2.drug_name SEPARATOR ', ') AS interaction_risks
    FROM SymptomDrugSpeciesMap m
    JOIN Drug d ON m.drug_id = d.drug_id

    LEFT JOIN DrugWarning w
        ON w.drug_id = d.drug_id
        AND (w.species_id = v_species_id OR w.species_id IS NULL)
        AND (w.symptom_id = p_symptom_id OR w.symptom_id IS NULL)

    LEFT JOIN DrugInteraction i
        ON i.drug_id_low = d.drug_id OR i.drug_id_high = d.drug_id
    LEFT JOIN Drug d2
        ON d2.drug_id = IF(i.drug_id_low = d.drug_id, i.drug_id_high, i.drug_id_low)

    WHERE m.symptom_id = p_symptom_id
      AND m.species_id = v_species_id

    GROUP BY d.drug_id, d.drug_name, m.recommended_dose, m.min_dose, m.max_dose, m.contraindicated,
             w.warning_type, w.description, w.severity;

    -- 4. 상품 추천
    SELECT
        pr.name AS product_name,
        pr.price,
        pr.product_link,
        pr.image_url
    FROM Symptom_Product_Map sp
    JOIN Product pr ON sp.product_id = pr.product_id
    WHERE sp.symptom_id = p_symptom_id
      AND sp.species_id = v_species_id;

    -- 5. 병원 광고 추천
    SELECT
        c.name AS clinic_name,
        c.address,
        c.contact,
        a.priority,
        a.start_date,
        a.end_date
    FROM VetAd a
    JOIN Clinic c ON a.clinic_id = c.clinic_id
    WHERE a.target_species_id = v_species_id
      AND a.target_symptom_id = p_symptom_id
      AND CURDATE() BETWEEN a.start_date AND a.end_date
    ORDER BY a.priority DESC;
END $$

DELIMITER ;

CALL ReportSymptomAndRecommendAll(1, 1, 1, '기침을 하루 종일 해요');