-- Created
-- User: KJK
-- Date: 2017-05-30
-- Time: 오전 11:13
-- employee DB생성 SQL문

-- 테이블 삭제
DROP TABLE employee;

-- 테이블 생성 (Foreign KEY 미포함)
CREATE TABLE employee(
  eNo VARCHAR2(7) PRIMARY KEY,
  eID VARCHAR2(30) UNIQUE,
  pass VARCHAR2(30) NOT NULL,
  name VARCHAR2(20) NOT NULL,
  birth DATE,
  sex VARCHAR2(10),
  tel VARCHAR2(15) NOT NULL,
  email VARCHAR2(50) NOT NULL,
  position VARCHAR2(20),
  gNO VARCHAR2(7),
  hireDate DATE DEFAULT SYSDATE,
  latestDate DATE DEFAULT SYSDATE,
  retireDate DATE,
  state VARCHAR2(20)
);

-- 시퀸스 삭제
DROP SEQUENCE emp_seq;

-- 시퀸스 생성
CREATE SEQUENCE emp_seq
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- 데이터 생성 (Foreign KEY 미포함)
INSERT INTO employee VALUES ('EA'||LPAD(emp_seq.nextval,5,0),'hosp','qwer1234','김사원','1987-11-17','1','010-3456-5567','hosp@naver.com','1','1','2017-05-23','2016-12-25','2015-11-23','1');
INSERT INTO employee VALUES ('EA'||LPAD(emp_seq.nextval,5,0),'hoswp','qwer1234','이방원','1987-11-17','2','010-3456-5567','hosp@naver.com','2','1','2017-05-23','2016-12-25','2015-11-23','2');
INSERT INTO employee VALUES ('EA'||LPAD(emp_seq.nextval,5,0),'hosaap','qwer1234','길라임원','1987-11-17','3','010-3456-5567','hosp@naver.com','3','1','2017-05-23','2016-12-25','2015-11-23','3');

-- 데이터 조회 (전체)
SELECT * FROM employee;

-- 데이터 조회 (컬럼명 기입)
SELECT eNo, eID, pass, name, birth, sex, tel, email, position, gNO, hireDate, latestDate, retireDate, state FROM employee;