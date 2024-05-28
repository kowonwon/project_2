use spring;

-- 메인 테이블
DROP TABLE IF EXISTS budget;
CREATE TABLE IF NOT EXISTS budget(
  no INTEGER AUTO_INCREMENT PRIMARY KEY,
  writer VARCHAR(10) NOT NULL, 
  category VARCHAR(100) NOT NULL,
  content VARCHAR(100) NOT NULL,
  price int NOT NULL,
  date TIMESTAMP NOT NULL,
  evaluation VARCHAR(1000) NOT NULL,
  good INTEGER DEFAULT 0,
  bad INTEGER DEFAULT 0
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO budget (writer, category, content, price, date, evaluation, good, bad) VALUES ('Kim', '식비', '저녁 닭가슴살', 1400, sysdate(), '대량구매 굿', 0, 0);
INSERT INTO budget (writer, category, content, price, date, evaluation, good, bad)
		VALUES ('Ko', '식비', '넷플릭스 구독료', 5000, sysdate(), '좋음', 0, 0);
commit;

-- 게시글 보기
SELECT * FROM budget ORDER BY no DESC;
SELECT * FROM budget ORDER BY date;

-- 상세보기 
SELECT * FROM budget WHERE no = 1;

-- 댓글 테이블
DROP TABLE IF EXISTS reply;
CREATE TABLE IF NOT EXISTS reply(
	no INTEGER AUTO_INCREMENT PRIMARY KEY,
	bbs_no INTEGER NOT NULL,
	reply_content VARCHAR(500) NOT NULL,
	reply_writer VARCHAR(20) NOT NULL,
	reg_date TIMESTAMP NOT NULL,	
	CONSTRAINT reply_fk FOREIGN KEY(bbs_no) REFERENCES budget(no)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO reply(bbs_no, reply_content, reply_writer, reg_date)VALUES(2, '잘했네요', 'Kang', SYSDATE());
commit;
SELECT * FROM reply;