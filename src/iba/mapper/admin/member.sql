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
 qNO VARCHAR2(85) not null,
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
 rNO VARCHAR2(7),
 pNO VARCHAR2(7),
 state VARCHAR2(3)
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
