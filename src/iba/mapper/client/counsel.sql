select * from counsel;

    select cNO,pTypeNO,mNO,cTitle,state,cCount
      from counsel where mNO LIKE '%@ㄴㄴ%' 
      
    select cNO,pTypeNO,mNO,cTitle,state,cCount
     from (select cNO,pTypeNO,mNO,cTitle,state,cCount, rownum rn
           from (select cNO,pTypeNO,mNO,cTitle,state,cCount
		         from counsel
		        where state = '2'
		         order by cNO desc)
		  )
     where rn between #start# and #end#      
      
      

select cNO,pTypeNO,mNO,cTitle,state,cCount
     from (select cNO,pTypeNO,mNO,cTitle,state,cCount, rownum rn
           from (select cNO,pTypeNO,mNO,cTitle,state,cCount
		         from counsel
		         where state ='2'
		         order by cNO desc)
		  );
		  
		  
     where rn between 1 and 5;

-------------------------------foreign key  등록필요함.
alter table counsel
add constraint fk_counsel foreign key(mNO)
references member(mNO);

      references member(mNO),
 references plasticType(pTypeNO),
 references employee(eNO),
----------------------------------------
 drop table counsel;
 
 create table counsel( --온라인상담(엄수용)
 cNO         varchar2(7) primary key, 
 mNO         varchar2(7),  
 pTypeNO     varchar2(2),    
 cDate       date Default SYSDATE,          
 cTitle      varchar2(60) NOT NULL, --byte 제한 50으로 하면 3바이트씩 16글자밖에 입력 못해서 50 --> 60으로 변경함.
 cContent    varchar2(500) NOT NULL, --> 한글 166글자까지 쓸 수 있어서 입력제한 160글자로 해놓음.
 cCount      number(20)  not null,
 imageURL    varchar2(100),
 eDate       date,
 eNO         varchar2(7),
 eComent     varchar2(200),
 state       varchar2(20)
 );
 
 drop sequence counsel_seq;
create sequence counsel_seq
       start with 1
       increment by 1
       nocycle
       nocache;

select cNO,cCount from counsel where cNO='CA00068';

update COUNSEL set cCount=0;

UPDATE COUNSEL 
    SET
    	cCOUNT = 1 + 1
    WHERE CNO = 'CA00068'
--확인용 ---------------------------------엄수용

INSERT INTO COUNSEL VALUES ('CA'||LPAD(counsel_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'EY','2017-11-15','글 제목입니다','쌍꺼풀수술 해야되는데...','50','이미지','2017-12-31','EA00002','하세요','1')

------------------------------------얘들아 이거 보면돼
==============================
-- 테이블 삭제
DROP TABLE employee;

-- 테이블 생성 (Foreign KEY 미포함)
CREATE TABLE employee(
  eNo VARCHAR2(7) PRIMARY KEY,
  eNO VARCHAR2(30) UNIQUE,
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

select cNO,pTypeNO,mNO,cTitle,state,cContent,cCount
      from counsel where mNO like'%키키%';

-- 시퀸스 삭제
DROP SEQUENCE emp_seq;

-- 시퀸스 생성
CREATE SEQUENCE emp_seq
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

  select cNO,pTypeNO,mNO,cTitle,state,cContent,cDate
      from counsel where state != '3';
      
      select cNO,pTypeNO,mNO,cTitle,state,cContent,cCount from counsel
      where state != '3'
      order by cNO desc 
