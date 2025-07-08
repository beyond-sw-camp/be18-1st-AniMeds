-- 커뮤니티 게시글 등록
DELIMITER $$
CREATE PROCEDURE AddCommunityPost (
    IN 제목 VARCHAR(255),
    IN 내용 TEXT,
    IN 작성자ID INT
)
BEGIN
    INSERT INTO community (title, content, user_id)
    VALUES (제목, 내용, 작성자ID);
    
    SELECT LAST_INSERT_ID() AS 게시글ID;
END $$
DELIMITER ;

CALL AddCommunityPost('고양이 눈에서 눈물나요', '계속 흘러요ㅠㅠ 알러지일까요?', 1);