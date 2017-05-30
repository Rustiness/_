drop table plasticItem;--���� plasticItem�����ü� ���̺� ����

create table plasticItem( --���̺� ����
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
(plasticItem_seq.nextval, 'EY', 'EY0001', '�Ÿ����ֲ�Ǯ', 120 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0002', '�������ֲ�Ǯ', 160 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0003', '��Ʈ��', 80 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0004', '�ٱ�Ʈ��', 80 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0005', '�����������ż�', 100 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0006', '�����ָ�����', 160 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0007', '�����ָ����ų���', 200 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0008', '�����ָ�����', 160 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0009', '�����ָ����ų���', 200 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0010', '���ؾֱ�����', 200 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0011', '�Ȱ��ϼ�����', 250 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0012', '�ֲ�Ǯ �����', 250 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0013', '�ܾȰ� ������', 140 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0014', '���� ���ε� �����̽�', 100 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0015', '���������ű���', 140 ,'1');
insert into plasticItem values 
(plasticItem_seq.nextval, 'EY', 'EY0016', '����Ż��', 120,'1');

select * from plasticItem;