-- Created
-- User: KJK
-- Date: 2017-06-07
-- Time: 오전 01:49
-- Member DB생성 SQL문

-- 테이블 삭제
DROP TABLE Member;

-- 테이블 생성
CREATE TABLE Member (
 mNO VARCHAR2(7) primary key,
 mID VARCHAR2(30) unique,
 pass VARCHAR2(30) not null,
 qNO VARCHAR2(7) not null,
 answer VARCHAR2(30) not null,
 name VARCHAR2(20) not null,
 birth DATE 		not null,
 sex VARCHAR2(10) not null,
 tel VARCHAR2(15) not null,
 email VARCHAR2(50) not null,
 pTypeNO VARCHAR2(7),
 latestDate DATE,
 joinDate DATE not null,
 mMemo VARCHAR2(200),
 mMdate DATE,
 pNO VARCHAR2(7),
 state VARCHAR2(3),
 FOREIGN KEY (qNO) REFERENCES Question(qNO) -- 질문 식별번호와 연결
);

-- 시퀸스 삭제
DROP SEQUENCE mem_seq;

-- 시퀸스 생성
CREATE SEQUENCE mem_seq
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- 데이터 샘플
INSERT INTO Member (mNO, mID, pass, qNO, answer, name, birth, sex, tel, email, pTypeNO, joinDate, state)
VALUES ('MA'||LPAD(mem_seq.nextval,5,0),'hosp','qwer1234','1','자전거','김사원','1987-11-17','1','010-3456-5567','hosp@naver.com','1,2,3','2017-05-23','1');

INSERT INTO Member (mNO, mID, pass, qNO, answer, name, birth, sex, tel, email, pTypeNO, joinDate, state)
VALUES ('MA'||LPAD(mem_seq.nextval,5,0),'hosp2','qwer1234','2','서울초등학교','김민영','1990-04-02','1','010-3456-5567','hosp@naver.com','1,2,3','2017-05-23','1');

INSERT INTO Member (mNO, mID, pass, qNO, answer, name, birth, sex, tel, email, pTypeNO, joinDate, state)
VALUES ('MA'||LPAD(mem_seq.nextval,5,0),'chuchu','qwer1234','3','자전거','추사랑','1997-11-17','1','010-3456-5567','hosp@naver.com','1,2,3','2017-05-23','1');

-- 데이터 조회 (전체)
SELECT * FROM Member

-- 데이터 조회 (컬럼명 기입)
SELECT mNO, mID, pass, qNO, answer, name, birth, sex, tel, email, pTypeNO, latestdate, joinDate, mMemo, mMdate, rNO, pNO, state FROM Member;

--====== Question TABLE 시작 ======--

-- 질문 테이블 삭제
DROP TABLE Question;

-- 질문 테이블 생성
CREATE TABLE Question (
  qNO VARCHAR2(7) PRIMARY KEY,
  qContent VARCHAR2(500)
);

-- 질문 시퀸스 삭제
DROP SEQUENCE ques_seq;

-- 질문 시퀸스 생성
CREATE SEQUENCE ques_seq
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- 질문 조회
SELECT * FROM Question;

-- 질문 기본 생성 데이터
INSERT INTO Question (qNO, qContent) VALUES (ques_seq.nextval, '미지정');
INSERT INTO Question (qNO, qContent) VALUES (ques_seq.nextval, '기억에 남는 추억의 장소는?');
INSERT INTO Question (qNO, qContent) VALUES (ques_seq.nextval, '자신의 인생 좌우명은? ');
INSERT INTO Question (qNO, qContent) VALUES (ques_seq.nextval, '가장 기억에 남는 선생님 성함은?');
INSERT INTO Question (qNO, qContent) VALUES (ques_seq.nextval, '타인이 모르는 자신만의 신체비밀이 있다면?');
INSERT INTO Question (qNO, qContent) VALUES (ques_seq.nextval, '추억하고 싶은 날짜가 있다면?');
INSERT INTO Question (qNO, qContent) VALUES (ques_seq.nextval, '받았던 선물 중 기억에 남는 독특한 선물은?');
INSERT INTO Question (qNO, qContent) VALUES (ques_seq.nextval, '유년시절 가장 생각나는 친구 이름은?');
INSERT INTO Question (qNO, qContent) VALUES (ques_seq.nextval, '인상 깊게 읽은 책 이름은?');
INSERT INTO Question (qNO, qContent) VALUES (ques_seq.nextval, '자신이제일 존경하는 인물은?');
INSERT INTO Question (qNO, qContent) VALUES (ques_seq.nextval, '친구들에게 공개하지 않은 어릴 적 별명이 있다면?');
INSERT INTO Question (qNO, qContent) VALUES (ques_seq.nextval, '초등학교때 기억에 남는 짝꿍 이름은?');
INSERT INTO Question (qNO, qContent) VALUES (ques_seq.nextval, '다시 태어나면 되고 싶은 것은?');
INSERT INTO Question (qNO, qContent) VALUES (ques_seq.nextval, '내가 좋아하는 캐릭터는?');
--====== Question TABLE 종료 ======--