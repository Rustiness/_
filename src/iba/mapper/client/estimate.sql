
-----------------Estimates written by patients----------------------------
drop table estimate;
-- after completing the process of estimate in the client section, 
-- Insert the surgeryNames for each customer.
create table estimate(
pNO varchar2(7),
pDate date default SYSDATE,
pEyeItem varchar2(300),
pNoseItem varchar2(300),
pFaceItem varchar2(300),
pBodyItem varchar2(300),
pBreastItem varchar2(300),
price double precision
);

create sequence patient_seq
start with 1
increment by 1
nocycle
nocache;

insert into estimate values 
('PA'||LPAD(patient_seq.nextval,5,0), SYSDATE, #pEyeItem#,#pNoseItem#,#pFaceItem#,#pBodyItem#,#pBreastItem#,#price#)

select pEyeItem from estimate;



