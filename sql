
# sql 테이블

use db211702;


show tables;

CREATE TABLE detection_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '로그 고유 번호',
    event_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '이벤트 발생 시간',
    
    -- 탐지 정보
    object_type VARCHAR(50) NOT NULL COMMENT '탐지된 객체 종류 (고라니, 멧돼지 등)',
    confidence FLOAT COMMENT 'AI 탐지 신뢰도 (0.0 ~ 1.0)',
    
    -- 미디어 경로 (파일 자체 대신 경로 저장)
    image_path VARCHAR(255) COMMENT '현장 스냅샷 이미지 저장 경로',
    video_path VARCHAR(255) COMMENT '사건 전후 영상 저장 경로',
    
    -- 하드웨어 및 서비스 상태
    siren_status ENUM('Y', 'N') DEFAULT 'N' COMMENT '사이렌 작동 여부',
    light_status ENUM('Y', 'N') DEFAULT 'N' COMMENT '경광등 작동 여부',
    alert_status ENUM('SUCCESS', 'FAIL', 'PENDING') DEFAULT 'PENDING' COMMENT '알림 전송 상태',
    
    -- 기타 메모
    remarks TEXT COMMENT '특이사항 기록'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

select * from detection_logs
