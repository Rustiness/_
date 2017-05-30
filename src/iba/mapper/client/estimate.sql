drop table plasticItem;--기존 plasticItem성형시술 테이블 제거

create table plasticItem( --테이블 생성
num number not null,
pTypeNO varchar2(20) not null,
pItemNO varchar2(20) primary key,
pItemName varchar2(30) not null,
pItemValue varchar2(20),
state varchar2(1)
);


drop sequence plasticItem_seq;
create sequence plasticItem_seq
start with 1
increment by 1
nocycle
nocache;

--select plasticItem_seq.currval from dual;

insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0001', '매몰법쌍꺼풀', 120 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0002', '절개법쌍꺼풀', 160 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0003', '안트임', 80 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0004', '바깥트임', 80 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0005', '눈밑지방제거술', 100 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0006', '눈위주름제거', 160 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0007', '눈위주름제거남자', 200 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0008', '눈밑주름제거', 160 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0009', '눈밑주름제거남자', 200 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0010', '눈밑애교수술', 200 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0011', '안검하수교정', 250 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0012', '쌍꺼풀 재수술', 250 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0013', '외안각 교정술', 140 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0014', '꺼진 눈두덩 지방이식', 100 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0015', '비절개눈매교정', 140 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0016', '눈썹거상술', 120,'1');

select * from plasticItem;