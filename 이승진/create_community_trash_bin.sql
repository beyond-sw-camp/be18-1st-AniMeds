-- 커뮤니티 글 신고 당할시 삭제 대기 목록(쓰레기통)
CREATE TABLE community_trash_bin (
    post_id BIGINT PRIMARY KEY COMMENT '삭제 대상 커뮤니티 게시글 ID',
    trashed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '삭제 후보 등록 시각'
);