-- 커뮤니티 게시글 신고 (신고 수 +1)
DELIMITER $$

CREATE PROCEDURE ReportCommunityPost (
    IN 게시글ID BIGINT
)
BEGIN
    UPDATE community
    SET post_report = post_report + 1
    WHERE post_id = 게시글ID;
    
    SELECT 
        post_id AS 게시글ID,
        post_report AS 현재신고수
    FROM community
    WHERE post_id = 게시글ID;
END $$

DELIMITER ;

CALL ReportCommunityPost(2);