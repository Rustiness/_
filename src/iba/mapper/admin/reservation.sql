drop table reservation;
create table reservation(
	rNO varchar2(7) primary key,
	mNO varchar2(7),
	pTypeNO varchar2(7),
	rDate varchar2(11) not null,
	rFTime varchar2(6) not null,
	rLTime varchar2(6) not null,
	rContent varchar2(200),
	rState varchar2(3),
	FOREIGN KEY (mNO) REFERENCES member(mNO),
	FOREIGN KEY (pTypeNO) REFERENCES plasticType(pTypeNO)
);

create sequence reservation_rNOseq
       start with 1
       increment by 1
       nocycle
       nocache;

update reservation set rState='예약대기';
select rNO, rDate, rState from RESERVATION order by rDate;
delete reservation where rNO='RA00009';
