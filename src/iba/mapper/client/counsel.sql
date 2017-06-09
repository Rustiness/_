select * from counsel;

delete from counsel;
-----------------------------------------------------------------
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
		         where state != '3'
		         order by cNO desc)
		  )
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
 mNO         varchar2(7) ,  
 pTypeNO     varchar2(2),    
 cDate       date Default SYSDATE,          
 cTitle      varchar2(60) NOT NULL, --byte 제한 50으로 하면 3바이트씩 16글자밖에 입력 못해서 50 --> 60으로 변경함.
 cContent    varchar2(500) NOT NULL, --> 한글 166글자까지 쓸 수 있어서 입력제한 160글자로 해놓음.
 cCount      number(10),
 imageURL    varchar2(100),
 eDate       date,
 eNO         varchar2(7),
 eComent     varchar2(1000),
 state       varchar2(20)
 );
 INSERT INTO COUNSEL VALUES ('CA'||LPAD(counsel_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'EY',SYSDATE,'글 제목입니다','쌍꺼풀수술 해야되는데',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','1')

 
 drop sequence counsel_seq;
create sequence coun_seq
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

INSERT INTO COUNSEL VALUES (               CNO,                                  MNO,              pTypeNO,SYSDATE,     cTitle,      cContent,      cCount,'이미지',  eDate,       eNO,  eComent,state)
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'EY',SYSDATE,'눈매교정술 견적 문의','눈매 교정수술하고 쌍꺼풀 수술하고 많이 다른가요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','2');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'EY',SYSDATE,'눈성형 문의','안녕하세요. 20대 여자입니다. 안쪽 트임을 해볼까 하는데 금액이 얼마나 나올까요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','2');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'EY',SYSDATE,'짝눈 재수술 비용문의','왼쪽 눈에는 쌍꺼풀이 있는데 오른쪽 눈에 쌍꺼풀이 없어서 고민인데요. 혹시 한쪽눈만 쌍꺼풀 수술하는것도 가능한가요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','1');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'EY',SYSDATE,'안검하수교정 문의 드립니다.','안녕하세요. 주변 친구들이 항상 눈이 졸려보인다고 해서 안검하수 아니냐고 하더라구요. 방문상담 언제쯤 가능할까요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','2');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'EY',SYSDATE,'시크릿 라인 문의','눈썹 문신을 할까하는데 이 병원에서도 시크릿 라인 가능한가요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','2');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'NO',SYSDATE,'수술 날짜 문의','제가 코끝이 좀 뭉툭해서 수술을 고민중입니다. 현재 회사를 다니고 있는데 이번 징검다리 휴일때도 혹시 병원 운영하시나요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','2');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'NO',SYSDATE,'남자 복코성형비용문의','안녕하세요. 복코 때문에 스트레스를 받아서 상담을 받아보고 싶은데 비용이 얼마정도 할까요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','2');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'NO',SYSDATE,'코성형 후 세안','혹시 코 수술을 하고나서 세수 할수 있나요? 안된다면 얼마동안 세안없이 지내야 하나요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','1');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'NO',SYSDATE,'코,눈 필러 문의','필러 금액 좀 알려주세요.',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','2');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'NO',SYSDATE,'들창코교정 수술법','들창코 때문에 고민인 남자입니다. 수술을 하면 괜찮다던데 어떤방식으로 진행되나요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','2');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'NO',SYSDATE,'코 붓기 빠지는데 얼마나 걸리나요?','수술하면 보통 붓기 빠지는데 얼마나 기간이 소요되나요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','1');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'FA',SYSDATE,'안면윤곽 재수술','안녕하세요. 5개월 전에 다른병원에서 안면윤곽 수술을 받았었는데 마음에 안들어서 수술을 했던 병원을 찾아가니 재수술이 힘들다는데 혹시 이 병원은 가능한가요? ',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','1');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'FA',SYSDATE,'사각턱 수술','턱이 사각이라 수술을 고민중인데 수술하고 난 뒤 후유증은 없나요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','2');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'FA',SYSDATE,'돌려깎기가 어떤 수술이죠?','안녕하세요. 주변 지인들이 광대,턱 수술을 받으면 인상이 달라진다는데 돌려깎기가 어떤 수술인가요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','1');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'FA',SYSDATE,'비용 문의 드려요.','양악수술 비용은 얼마나 되나요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','2');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'FA',SYSDATE,'비대칭 얼굴 교정 상담이요','비대칭 얼굴때문에 인상이 안 좋아보입니다. 수술로 정상으로 되돌릴 수 있을까요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','1');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'FA',SYSDATE,'옆광대 축소술이요~','광대 축소 수술 말고 시술같은 주사주입으로 할 수 있는 방법도 있나요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','1');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'BR',SYSDATE,'출산 후 가슴 처짐때문에 고민이에요','안녕하세요. 작년 겨울에 아이를 출산한 주부인데요. 모유수유를 하고나서 가슴이 처지는데 너무 스트레스를 받네요. 혹시 수술말고 다른 방법이 있을까요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','2');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'BR',SYSDATE,'가슴축소하는 수술','안녕하세요. 가슴이 남들보다 좀 많이 커서 자세도 구부정하고 허리에 디스크까지 생기는 바람에 가슴 축소수술을 생각중인데요. 수술 받으면 B컵 정도로 바뀔수 있을까요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','1');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'BR',SYSDATE,'물방울 가슴성형 문의드려요','아는 지인분이 이 병원 원장님이 가슴수술 전문이라고 하시던데 금액이 얼마정도인가요? 혹시 수술을 받게되면 다음날 출근 할 수 있나요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','2');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'BR',SYSDATE,'모티바 보형물 상속녀 가슴수술','수술하면 많이 아픈가요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','2');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'BR',SYSDATE,'가슴 재수술 문의합니다.','저번 달에 가슴 확대 수술받은 000인데요. 처음엔 붓기때문에 정확히 판단이 안됐는데 시간이 지나니 제가 원했던 것만큼 수술이 잘되지 않아서 다시 한번 수술을 고민중입니다. 금액지불없이 AS처럼 받을수 있나요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','1');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'BR',SYSDATE,'가슴 수술비용 문의.','수술시 원하는 사이즈에 따라 비용이 달라지나요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','1');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'BO',SYSDATE,'종아리 지방흡입 티날까요?','요새 종아리가 너무 두꺼워서 치마도 못입고 있어서요. 혹시 종아리 지방흡입을 하면 수술 자국이 남나요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','2');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'BO',SYSDATE,'복부 지방흡입 비용','복부 지방흡입시 몸무게가 얼마나 빠질까요? 그리고 비용은 얼마나 나오죠?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','1');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'BO',SYSDATE,'다리 지방흡입 특히 허벅지 문의요.','허벅지 셀룰라이트 때문에 걱정입니다.. 아이를 출산하고 나니 허벅지 살이 안빠져서 지방흡입을 생각중입니다. 방문시 여자 의사선생님과 상담 받을 수 있을까요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','2');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'BO',SYSDATE,'팔뚝 지방흡입','팔뚝살 지방흡입을 할까 하는데요. 허벅지나 복부도 같이 진행할수 있나요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','1');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'BO',SYSDATE,'지방흡입 수술 하면..','지방흡입 수술하면 정말 살이 많이 빠지나요? 요요현상처럼 다시 살찌지는 않을까요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','1');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'BO',SYSDATE,'남자인데 엉덩이 지방흡입 할려고요','안녕하십니까. 엉덩이에 살이 많아서 사이즈가 맞는 바지를 찾기 힘들어서 복부지방흡입처럼 엉덩이도 지방흡입이 가능한가요?',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','2');
INSERT INTO COUNSEL VALUES ('CA'||LPAD(coun_seq.nextval,5,0),'MA'||LPAD(counsel_seq.nextval,5,0),'EY',SYSDATE,'글 제목입니다','쌍꺼풀수술 해야되는데...',0,'이미지',SYSDATE,'EA'||LPAD(counsel_seq.nextval,5,0),'하세요','1');
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
