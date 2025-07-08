--  신고 수 10 이상일 경우 자동으로 쓰레기통에 등록하는 트리거
DELIMITER $$

CREATE TRIGGER trigger_add_to_trash_bin
AFTER UPDATE ON community
FOR EACH ROW
BEGIN
    IF NEW.post_report >= 10 THEN
        INSERT IGNORE INTO community_trash_bin (post_id)
        VALUES (NEW.post_id);
    END IF;
END $$

DELIMITER ;

-- 쓰레기통에 등록된 게시글을 삭제 (관리자가 일주일 단위로 실행)
DELETE FROM community
WHERE post_id IN (
    SELECT post_id FROM community_trash_bin
);

-- 쓰레기통 비우기(삭제된 게시글 기록 제거)
DELETE FROM community_trash_bin;
