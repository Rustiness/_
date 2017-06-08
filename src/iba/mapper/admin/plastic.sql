
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
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '�Ÿ����ֲ�Ǯ', 120 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '�������ֲ�Ǯ', 160 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '��Ʈ��', 80 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '�ٱ�Ʈ��', 80 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '�����������ż�', 100 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '�����ָ�����', 160 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '�����ָ����ų���', 200 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '�����ָ�����', 160 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '�����ָ����ų���', 200 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '���ؾֱ�����', 200 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '�Ȱ��ϼ�����', 250 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '�ֲ�Ǯ �����', 250 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '�ܾȰ� ������', 140 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '���� ���ε� �����̽�', 100 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '���������ű���', 140 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY'||LPAD(eye_seq.nextval,4,0), '����Ż��', 120,'1');

select * from plasticItem;