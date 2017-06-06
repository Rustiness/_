drop table member; --기존 member테이블 제거


create table member( --테이블 생성
 mNo     	varchar2(10) primary key,
 mID	 	varchar2(20) unique,
 pass		varchar2(20) not null,
 question   varchar2(60) not null,
 answer 	varchar2(30) not null, 
 name		varchar2(20) not null,
 birth		DATE 		not null,
 sex		varchar2(10) not null,
 tel		varchar2(15) not null,
 email		varchar2(30) not null,
 pTypeNO    varchar2(20), 
 latestDate	DATE		not null,
 joinDate	DATE		not null,
 uMemo		varchar2(200),
 uMdate	    DATE,
 rNO		varchar2(20),
 pNO		varchar2(20),	
 state		varchar2(10)
);


drop sequence mem_seq;--기존 mem시퀀스 제거 
 
create sequence mem_seq  --새로운 mem시퀀스 생성
           start with 1
           increment by 1
           nocycle
           nocache;
           
           
           