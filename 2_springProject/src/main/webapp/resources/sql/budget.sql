use spring;

DROP TABLE IF EXISTS budget;
CREATE TABLE IF NOT EXISTS budget(
  no INTEGER AUTO_INCREMENT PRIMARY KEY,
  writer VARCHAR(10) NOT NULL, 
  category VARCHAR(100) NOT NULL,
  content VARCHAR(100) NOT NULL,
  price int NOT NULL,
  date Timestamp NOT NULL,
  evaluation VARCHAR(1000) NOT NULL,
  good INTEGER DEFAULT 0,
  bad INTEGER DEFAULT 0
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


insert into budget(writer, category, content, price, date, evaluation) values('이현학', '카드', '점심식사', 11000, SYSDATE(), '무난함');

SELECT * FROM budget ORDER BY no DESC;

commit;