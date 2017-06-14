
drop table plasticType; -- The name of plasticType with pTypeNO and pTypeName 

--성형타입 테이블 num,pTypeNO,pTypeName,state
--TableName: plasticType

create table plasticType(

num number(7) not null,
pTypeNO varchar2(7) primary key,
pTypeName varchar2(50) not null,
state varchar2(3)
);
--plasticType sequece numbering
drop sequence plasticType_seq;
create sequence plasticType_seq
start with 1
increment by 1
nocycle
nocache;

insert into plasticType values 
(plasticType_seq.nextval, 'EY', '눈성형','1');

insert into plasticType values 
(plasticType_seq.nextval, 'NO', '코성형','1');

insert into plasticType values 
(plasticType_seq.nextval, 'FA', '안면윤곽성형','1');

insert into plasticType values 
(plasticType_seq.nextval, 'BO', '체형성형','1');

insert into plasticType values 
(plasticType_seq.nextval, 'BR', '가슴성형','1');
-------------------plasticItem----------------------------
drop table plasticItem;

create table plasticItem( 
num number(7) not null,
pTypeNO varchar2(7)  primary key,
pItemNO varchar2(7) foreign key,
pItemName varchar2(50) not null,
pItemValue double precision,
state varchar2(3)
);

select * from plasticItem where pItemNO='BR0001';
select * from plasticItem where pItemNO= #pItemNO#

drop sequence plasticItem_seq;
create sequence plasticItem_seq
start with 1
increment by 1
nocycle
nocache;
-- SequenceNumber Generator
CREATE SEQUENCE eye_seq
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

CREATE SEQUENCE nose_seq
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

CREATE SEQUENCE face_seq
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

CREATE SEQUENCE body_seq
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

CREATE SEQUENCE breast_seq
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

--select plasticItem_seq.currval from dual;

insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '매몰법쌍꺼풀', 120 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '절개법쌍꺼풀', 160 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '안트임', 80 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '바깥트임', 80 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '눈밑지방제거술', 100 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '눈위주름제거',160,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '눈위주름제거남자', 200 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '눈밑주름제거',160,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '눈밑주름제거남자', 200 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '눈밑애교수술',200,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '안검하수교정', 250 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '쌍꺼풀 재수술', 250 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '외안각 교정술', 140 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '꺼진 눈두덩 지방이식', 100 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '비절개눈매교정', 140 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '눈썹거상술', 120,'1');
--nose plasticItem
insert into plasticItem values 
(plasticItem_seq.nextval, 'NO', 'NO'||LPAD(nose_seq.nextval,4,0), '코높이기', 250,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'NO', 'NO'||LPAD(nose_seq.nextval,4,0), '코낮추기', 250,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'NO', 'NO'||LPAD(nose_seq.nextval,4,0), '코끝성형', 180,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'NO', 'NO'||LPAD(nose_seq.nextval,4,0), '콧등교정', 250,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'NO', 'NO'||LPAD(nose_seq.nextval,4,0), '휜코교정', 300,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'NO', 'NO'||LPAD(nose_seq.nextval,4,0), '매부리코교정', 300,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'NO', 'NO'||LPAD(nose_seq.nextval,4,0), '짧은코교정', 250,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'NO', 'NO'||LPAD(nose_seq.nextval,4,0), '콧망울축소', 100,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'NO', 'NO'||LPAD(nose_seq.nextval,4,0), '코재수술', 300,'1');
--face plasticItem
 
insert into plasticItem values 
(plasticItem_seq.nextval, 'FA', 'FA'||LPAD(face_seq.nextval,4,0), '사각턱교정', 450,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'FA', 'FA'||LPAD(face_seq.nextval,4,0), '광대뼈축소', 450,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'FA', 'FA'||LPAD(face_seq.nextval,4,0), '주걱턱교정', 1000,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'FA', 'FA'||LPAD(face_seq.nextval,4,0), '튀어나온입교정', 1000,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'FA', 'FA'||LPAD(face_seq.nextval,4,0), '무턱교정절골술', 450,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'FA', 'FA'||LPAD(face_seq.nextval,4,0), '무턱교정보형물', 300,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'FA', 'FA'||LPAD(face_seq.nextval,4,0), '이마성형', 400,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'FA', 'FA'||LPAD(face_seq.nextval,4,0), '귀족수술', 250,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'FA', 'FA'||LPAD(face_seq.nextval,4,0), '사각턱축소', 200,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'FA', 'FA'||LPAD(face_seq.nextval,4,0), 'v라인턱끝수술', 500,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'FA', 'FA'||LPAD(face_seq.nextval,4,0), '양악수술', 1500,'1');

--body plasticItem

insert into plasticItem values 
(plasticItem_seq.nextval, 'BO', 'BO'||LPAD(body_seq.nextval,4,0), '유방확대_생리식염수백', 500,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'BO', 'BO'||LPAD(body_seq.nextval,4,0), '유방확대_미세지방이식', 500,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'BO', 'BO'||LPAD(body_seq.nextval,4,0), '유방확대_실리콘백', 750,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'BO', 'BO'||LPAD(body_seq.nextval,4,0), '유방축소', 800,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'BO', 'BO'||LPAD(body_seq.nextval,4,0), '함몰유두교정', 150,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'BO', 'BO'||LPAD(body_seq.nextval,4,0), '처진유방교정', 500,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'BO', 'BO'||LPAD(body_seq.nextval,4,0), '유방재건', 1000,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'BO', 'BO'||LPAD(body_seq.nextval,4,0), '여성형유방교정', 300,'1');

-- breast plasticItem

insert into plasticItem values 
(plasticItem_seq.nextval, 'BR', 'BR'||LPAD(breast_seq.nextval,4,0), '허벅지', 500,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'BR', 'BR'||LPAD(breast_seq.nextval,4,0), '힙', 250,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'BR', 'BR'||LPAD(breast_seq.nextval,4,0), '종아리', 250,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'BR', 'BR'||LPAD(breast_seq.nextval,4,0), '종아리축소', 300,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'BR', 'BR'||LPAD(breast_seq.nextval,4,0), '종아리신경차단술', 250,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'BR', 'BR'||LPAD(breast_seq.nextval,4,0), '하복부', 200,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'BR', 'BR'||LPAD(breast_seq.nextval,4,0), '상_하복부', 400,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'BR', 'BR'||LPAD(breast_seq.nextval,4,0), '등', 200,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'BR', 'BR'||LPAD(breast_seq.nextval,4,0), '팔', 250,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'BR', 'BR'||LPAD(breast_seq.nextval,4,0), '얼굴', 100,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'BR', 'BR'||LPAD(breast_seq.nextval,4,0), '종아리근육퇴축술', 300,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'BR', 'BR'||LPAD(breast_seq.nextval,4,0), '복부성형술', 800,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'BR', 'BR'||LPAD(breast_seq.nextval,4,0), '배꼽성형술', 150,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'BR', 'BR'||LPAD(breast_seq.nextval,4,0), '엉덩이성형술', 800,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'BR', 'BR'||LPAD(breast_seq.nextval,4,0), '어코니아레이저지방용해술', 25,'1');
 





select * from plasticItem;

select num, pTypeNO, pTypeName, pItemNO, pItemName, pItemValue, state 
     from (select num, pTypeNO, pTypeName, pItemNO, pItemName, pItemValue, state, rownum rn
           from (select i.num, i.pTypeNO, t.pTypeName, i.pItemNO, i.pItemName, i.pItemValue, i.state 
	from plasticItem i left outer join plasticType t on i.pTypeNO =t.pTypeNO
		                order by i.pItemNO desc)
		  );
    -- where rn between 0 and 12;