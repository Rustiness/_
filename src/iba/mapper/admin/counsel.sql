-- Created
-- User: KJK
-- Date: 2017-06-07
-- Time: 오후 03:12
-- Counsel DB생성 SQL문

--
-- 테이블 삭제
DROP TABLE Counsel;

-- 테이블 생성
CREATE TABLE Counsel(
  cNO         VARCHAR2(7) primary key,
  mNO         VARCHAR2(7),
  pTypeNO     VARCHAR2(7),
  cDate       DATE DEFAULT SYSDATE,
  cTitle      VARCHAR2(60) NOT NULL, --byte 제한 50으로 하면 3바이트씩 16글자밖에 입력 못해서 50 --> 60으로 변경함.
  cContent    VARCHAR2(500) NOT NULL, --> 한글 166글자까지 쓸 수 있어서 입력제한 160글자로 해놓음.
  cCount      NUMBER(10)  NOT NULL,
  imageURL    VARCHAR2(100),
  eDate       DATE,
  eNO         VARCHAR2(7),
  eComent     VARCHAR2(1000),
  state       VARCHAR2(20)
);

-- 시퀸스 삭제
DROP SEQUENCE coun_seq;

-- 시퀸스 생성
CREATE SEQUENCE coun_seq
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- 데이터 샘플
INSERT INTO Counsel (cNO, mNO, pTypeNO, cDate, cTitle, cContent, cCount, imageURL, eDate, eNO, eComent, state)
VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA00001','EY','2017-11-15','글 제목이다','글 내용이다아','0','/img/img.jpg','2016-11-25','EA00001','답변입니다아아','1');

INSERT INTO Counsel (cNO, mNO, pTypeNO, cDate, cTitle, cContent, cCount, imageURL, eDate, eNO, eComent, state)
VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA00001','EY','2017-11-15','글 제목이다','글 내용이다아','0','/img/img.jpg','2016-11-25','EA00001','답변입니다아아','1');

INSERT INTO Counsel (cNO, mNO, pTypeNO, cDate, cTitle, cContent, cCount, imageURL, state)
VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA00001','EY','2017-11-15','글 제목이다','글 내용이다아','0','/img/img.jpg','1');


-- 데이터 조회 (전체)
SELECT * FROM Counsel;

-- 데이터 조회 (컬럼명 기입)
SELECT cNO, mNO, pTypeNO, cDate, cTitle, cContent, cCount, imageURL, eDate, eNO, eComent, state FROM Counsel;