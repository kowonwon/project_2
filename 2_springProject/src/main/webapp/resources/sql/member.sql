## DATABASE 생성 및 선택
CREATE DATABASE IF NOT EXISTS spring;
use spring;

# 테이블 생성
DROP TABLE IF EXISTS member;
CREATE TABLE IF NOT EXISTS member(
	id VARCHAR(20) PRIMARY KEY,
	nickname VARCHAR(10) NOT NULL,
	pass VARCHAR(100) NOT NULL,
	email VARCHAR(30) NOT NULL,
	mobile VARCHAR(13) NOT NULL,
	reg_date TIMESTAMP NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# 회원 정보 추가

INSERT INTO member VALUES('admin', '이순신', 
'$2a$10$b3t8sn6QZGHYaRx3OS5KUuPxzWZdY5yHPRxlSdAgByQ7v0BlCLzrO', 
	'midastop1@naver.com', '010-5555-5555','2022-05-11 11:20:50');


commit;
SELECT * FROM member;
