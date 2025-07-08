-- 1. 회원가입 ----------------------------------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE sp_register_user (
    IN in_email VARCHAR(255),
    IN in_phone VARCHAR(20),
    IN in_password VARCHAR(100),
    IN in_name VARCHAR(100),
    IN in_role ENUM('보호자', '수의사', '관리자'),
    OUT out_user_id INT
)
BEGIN
    DECLARE v_exists INT DEFAULT 0;

    -- 1. 이메일 중복 검사
    SELECT COUNT(*) INTO v_exists 
	 FROM User 
	 WHERE email = in_email COLLATE UTF8MB4_UNICODE_CI ;
    IF v_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '이미 사용 중인 이메일입니다.';
    END IF;

    -- 2. 전화번호 중복 검사
    SELECT COUNT(*) INTO v_exists 
	 FROM User 
	 WHERE phone = in_phone COLLATE utf8mb4_unicode_ci;
    IF v_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '이미 사용 중인 전화번호입니다.';
    END IF;

    -- 3. 역할 유효성 검사 (ENUM이라 사실상 자동 됨 → 생략 가능)

    -- 4. 회원 등록
    INSERT INTO User (email, phone, password, name, role, created_at)
    VALUES (in_email, in_phone, in_password, in_name, in_role, NOW());

    -- 5. 새 user_id 반환
    SET out_user_id = LAST_INSERT_ID();
END$$

DELIMITER ;

CALL sp_register_user(
    'owner1@example.com',
    '010-7777-8888',
    'hashed_pw_999',
    '최신가입자',
    '보호자',
    @new_user_id
);

SELECT *
FROM user;

-- 2. 로그인 ------------------------------------------------------------------------------------------

DELIMITER $$

CREATE PROCEDURE sp_login_user (
    IN in_email VARCHAR(255) COLLATE utf8mb4_unicode_ci,
    IN in_password VARCHAR(100),
    OUT out_token VARCHAR(255)
)
BEGIN
    DECLARE v_user_id INT;
    DECLARE v_stored_password VARCHAR(100);
    DECLARE v_now DATETIME;

    -- 1. 사용자 조회
    SELECT user_id, password INTO v_user_id, v_stored_password
    FROM User
    WHERE email = in_email;

    -- 2. 사용자 존재하지 않음
    IF v_user_id IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '존재하지 않는 사용자입니다.';
    END IF;

    -- 3. 비밀번호 불일치
    IF v_stored_password != in_password THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '비밀번호가 올바르지 않습니다.';
    END IF;

    -- 4. 토큰 생성 (단순한 문자열 기반)
    SET v_now = NOW();
    SET out_token = CONCAT('token_user_', v_user_id, '_', UNIX_TIMESTAMP(v_now));

    -- 5. 기존 세션 삭제 (선택적, 다중 로그인 방지용)
    DELETE FROM UserSession WHERE user_id = v_user_id;

    -- 6. 세션 등록
    INSERT INTO UserSession (user_id, token, created_at, expired_at)
    VALUES (v_user_id, out_token, v_now, DATE_ADD(v_now, INTERVAL 1 DAY));
END$$

DELIMITER ;

CALL sp_login_user('owner1@example.com', 'hashed_pw_2', @token);

SELECT *
FROM user;

-- 로그아웃 ----------------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE sp_logout_user (
    IN in_token VARCHAR(255)
)
BEGIN
    DECLARE v_exists INT;

    -- 해당 토큰이 존재하는지 확인
    SELECT COUNT(*) INTO v_exists
    FROM UserSession
    WHERE token = in_token COLLATE utf8mb4_unicode_ci;

    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '유효하지 않은 세션 토큰입니다.';
    END IF;

    -- 해당 세션 삭제 → 로그아웃 처리
    DELETE FROM UserSession
    WHERE token = in_token COLLATE utf8mb4_unicode_ci;
END$$

DELIMITER ;

CALL sp_logout_user('token_user_1_1720455567');

-- -------------------------------------------------------------------------

