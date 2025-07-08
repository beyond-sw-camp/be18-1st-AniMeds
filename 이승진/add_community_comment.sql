-- 커뮤니티 댓글 등록
DELIMITER $$
CREATE PROCEDURE AddComment (
    IN 게시글ID BIGINT,
    IN 작성자ID INT,
    IN 댓글내용 TEXT
)
BEGIN
    INSERT INTO comment (post_id, user_id, content)
    VALUES (게시글ID, 작성자ID, 댓글내용);

    SELECT LAST_INSERT_ID() AS 댓글ID;
END $$
DELIMITER ;

CALL AddComment(3, 2, '저도 이런 경험 있었어요. 빨리 좋아지길!');