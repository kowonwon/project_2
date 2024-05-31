use spring;

-- 메인 테이블
DROP TABLE IF EXISTS budget;
CREATE TABLE IF NOT EXISTS budget(
  no INTEGER AUTO_INCREMENT PRIMARY KEY,
  writer VARCHAR(10) NOT NULL, 
  category VARCHAR(100) NOT NULL,
  content VARCHAR(100) NOT NULL,
  price int NOT NULL,
  payment VARCHAR(100) default "cash",
  date Timestamp NOT NULL,
  evaluation VARCHAR(1000) null
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Kim', '식비', '점심 샐러드', 13500, '2024-03-05', '신용카드', '신선하고 맛있었음');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Lee', '쇼핑', '새 운동화', 79000, '2024-03-12', '현금', '편하고 스타일리쉬함');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Yang', '편의점&마트', '간식류', 5000, '2024-03-17', '체크카드', '가성비 좋음');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Ko', '교통비', '버스 요금', 1200, '2024-03-21', '모바일 결제', '빠르고 편리');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Kim', '보험&세금', '자동차 보험', 150000, '2024-03-25', '계좌이체', '필요한 지출');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Lee', '주거&통신', '인터넷 요금', 30000, '2024-03-29', '신용카드', '인터넷 속도 좋음');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Yang', '기타', '영화 티켓', 12000, '2024-04-02', '체크카드', '즐거운 시간');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Ko', '식비', '저녁 회식비', 45000, '2024-04-06', '현금', '동료들과 좋은 시간');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Kim', '쇼핑', '새 옷', 89000, '2024-04-10', '모바일 결제', '고급스러움');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Lee', '편의점&마트', '음료수', 3000, '2024-04-15', '체크카드', '시원하고 맛있음');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Yang', '교통비', '택시 요금', 8500, '2024-04-20', '신용카드', '빠르게 도착');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Ko', '보험&세금', '건강 보험', 200000, '2024-04-25', '계좌이체', '중요한 지출');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Kim', '주거&통신', '휴대폰 요금', 50000, '2024-04-30', '모바일 결제', '통화 품질 좋음');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Lee', '기타', '책 구입', 12000, '2024-05-04', '현금', '유익한 독서');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Yang', '식비', '점심 피자', 25000, '2024-05-08', '체크카드', '맛있고 푸짐');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Ko', '쇼핑', '선물 구입', 45000, '2024-05-12', '신용카드', '기뻐하는 모습');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Kim', '편의점&마트', '생활용품', 10000, '2024-05-16', '계좌이체', '필요한 물품');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Lee', '교통비', '지하철 요금', 1350, '2024-05-20', '모바일 결제', '편리한 이동');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Yang', '보험&세금', '주택 보험', 120000, '2024-05-24', '신용카드', '안심이 됨');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Ko', '주거&통신', '관리비', 100000, '2024-05-28', '체크카드', '청결 유지');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Kim', '기타', '스포츠 용품', 75000, '2024-05-31', '모바일 결제', '운동에 필요');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Lee', '식비', '아침 샌드위치', 5500, '2024-03-04', '현금', '간편하고 맛있음');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Yang', '쇼핑', '화장품 구입', 30000, '2024-03-09', '체크카드', '피부 좋아짐');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Ko', '편의점&마트', '컵라면', 2000, '2024-03-14', '신용카드', '간편한 한끼');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Kim', '교통비', '기차 요금', 45000, '2024-03-19', '모바일 결제', '여행 기분');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Lee', '보험&세금', '자녀 보험', 180000, '2024-03-23', '계좌이체', '자녀 안전');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Yang', '주거&통신', '전기 요금', 50000, '2024-03-27', '체크카드', '전기 절약');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Ko', '기타', '뮤지컬 티켓', 65000, '2024-03-31', '현금', '환상적인 공연');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Kim', '식비', '저녁 스테이크', 40000, '2024-04-04', '신용카드', '고급스럽고 맛있음');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Lee', '쇼핑', '새 핸드백', 95000, '2024-04-08', '모바일 결제', '디자인 예쁨');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Yang', '편의점&마트', '냉동식품', 15000, '2024-04-12', '계좌이체', '편리한 조리');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Ko', '교통비', '주차비', 3000, '2024-04-16', '체크카드', '안전한 주차');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Kim', '보험&세금', '건강 검진', 100000, '2024-04-20', '신용카드', '필수 검진');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Lee', '주거&통신', '가스 요금', 25000, '2024-04-24', '모바일 결제', '따뜻한 집');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Yang', '기타', '공연 관람', 60000, '2024-04-28', '현금', '즐거운 시간');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Ko', '식비', '아침 토스트', 3500, '2024-05-02', '체크카드', '간편하고 맛있음');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Kim', '쇼핑', '새 옷', 60000, '2024-05-06', '계좌이체', '기분 전환');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Lee', '편의점&마트', '과자', 4500, '2024-05-10', '모바일 결제', '맛있고 바삭');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Yang', '교통비', '자전거 수리', 15000, '2024-05-14', '현금', '안전한 운행');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Ko', '보험&세금', '치아 보험', 70000, '2024-05-18', '신용카드', '중요한 지출');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Kim', '주거&통신', '수도 요금', 20000, '2024-05-22', '체크카드', '물 절약');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Lee', '기타', '콘서트 티켓', 90000, '2024-05-26', '현금', '흥겨운 공연');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Yang', '식비', '저녁 김치찌개', 18000, '2024-05-30', '계좌이체', '맛있고 푸짐');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Ko', '쇼핑', '스마트워치', 250000, '2024-03-03', '모바일 결제', '유용한 기능');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Kim', '편의점&마트', '우유', 2000, '2024-03-07', '현금', '신선하고 맛있음');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Lee', '교통비', '기름 값', 50000, '2024-03-11', '신용카드', '운전 편리');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Yang', '보험&세금', '여행자 보험', 45000, '2024-03-15', '체크카드', '여행 안심');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Ko', '주거&통신', '전세 대출 이자', 250000, '2024-03-19', '계좌이체', '필수 지출');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Kim', '기타', '전자제품 수리', 70000, '2024-03-23', '모바일 결제', '신속한 수리');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Lee', '식비', '아이스크림', 3000, '2024-03-27', '체크카드', '달콤하고 시원');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Yang', '쇼핑', '책상 구입', 120000, '2024-03-31', '신용카드', '공부에 필요');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Ko', '편의점&마트', '빵', 4000, '2024-04-04', '현금', '신선하고 맛있음');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Kim', '교통비', '지하철 정기권', 60000, '2024-04-08', '계좌이체', '편리한 출퇴근');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Lee', '보험&세금', '생명 보험', 100000, '2024-04-12', '체크카드', '필요한 지출');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Yang', '주거&통신', '케이블 TV 요금', 40000, '2024-04-16', '모바일 결제', '다양한 채널');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Ko', '기타', '스포츠 경기 관람', 75000, '2024-04-20', '신용카드', '흥미진진한 경기');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Kim', '식비', '점심 돈가스', 14000, '2024-04-24', '현금', '바삭하고 맛있음');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Lee', '쇼핑', '모자 구입', 30000, '2024-04-28', '계좌이체', '스타일리쉬');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Yang', '편의점&마트', '과일', 8000, '2024-05-02', '체크카드', '신선하고 맛있음');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Ko', '교통비', '고속버스 요금', 15000, '2024-05-06', '모바일 결제', '편안한 여행');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Kim', '보험&세금', '화재 보험', 60000, '2024-05-10', '신용카드', '안전한 집');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Lee', '주거&통신', '집 수리비', 90000, '2024-05-14', '현금', '집이 깨끗해짐');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Yang', '기타', '취미 용품', 45000, '2024-05-18', '계좌이체', '재미있는 시간');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Ko', '식비', '점심 도시락', 8500, '2024-05-22', '모바일 결제', '간편하고 맛있음');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Kim', '쇼핑', '전자제품 구입', 300000, '2024-05-26', '신용카드', '편리한 생활');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Lee', '편의점&마트', '우유', 2000, '2024-05-30', '체크카드', '신선하고 맛있음');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Yang', '교통비', '기차 요금', 45000, '2024-03-03', '모바일 결제', '여행 기분');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Ko', '보험&세금', '자동차 보험', 150000, '2024-03-07', '계좌이체', '필요한 지출');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Kim', '주거&통신', '인터넷 요금', 30000, '2024-03-11', '신용카드', '인터넷 속도 좋음');
INSERT INTO budget (writer, category, content, price, date, payment, evaluation) VALUES ('Lee', '기타', '영화 티켓', 12000, '2024-03-15', '체크카드', '즐거운 시간');


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

INSERT INTO reply(bbs_no, reply_content, reply_writer, reg_date)VALUES(21, '뭐사셨나요', '라이언', SYSDATE());
INSERT INTO reply(bbs_no, reply_content, reply_writer, reg_date)VALUES(21, '맛있겠다', '황희', SYSDATE());
INSERT INTO reply(bbs_no, reply_content, reply_writer, reg_date)VALUES(21, '짱', '효열', SYSDATE());
INSERT INTO reply(bbs_no, reply_content, reply_writer, reg_date)VALUES(21, '바가지 쓰신듯', '동욱', SYSDATE());
INSERT INTO reply(bbs_no, reply_content, reply_writer, reg_date)VALUES(21, '멋져요', '은정', SYSDATE());
INSERT INTO reply(bbs_no, reply_content, reply_writer, reg_date)VALUES(21, '중고인가요', '형철', SYSDATE());
INSERT INTO reply(bbs_no, reply_content, reply_writer, reg_date)VALUES(21, '중고 냄새나는데', '희선', SYSDATE());
INSERT INTO reply(bbs_no, reply_content, reply_writer, reg_date)VALUES(21, '무슨운동?', '현학', SYSDATE());
INSERT INTO reply(bbs_no, reply_content, reply_writer, reg_date)VALUES(21, '별로다', '고원', SYSDATE());
INSERT INTO reply(bbs_no, reply_content, reply_writer, reg_date)VALUES(21, '우엑', '원진', SYSDATE());
commit;
SELECT * FROM reply;

SELECT *
		FROM budget
		WHERE writer = '이순신' and DATE(date) = DATE(NOW())
		ORDER by date DESC;