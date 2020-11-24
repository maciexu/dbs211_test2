CREATE DATABASE DBS211_1;

CREATE TABLE PART(
PARTNO VARCHAR(4),
DESCRIPTION VARCHAR(20),
UNITPRICE DECIMAL(5,2) NOT NULL,
CONSTRAINT PK_PART PRIMARY KEY(PARTNO));

CREATE TABLE DETAILLINE(
ORDERNO INTEGER,
PARTNO VARCHAR(4),
QTY INTEGER NOT NULL,
CONSTRAINT PK_DETAILLINE PRIMARY KEY(ORDERNO, PARTNO),
CONSTRAINT FK_DETAILLINE_PARTNO FOREIGN KEY(PARTNO) REFERENCES PART(PARTNO));

INSERT INTO PART(PARTNO, DESCRIPTION, UNITPRICE)
VALUES('AX12','IRON', 10.99),
      ('BT04','Gas Grill', 89.99),
	  ('BZ66','Washer', 189.99);

INSERT INTO DETAILLINE(ORDERNO, PARTNO, QTY)
VALUES(2489,'AX12', 11),
      (2491,'BT04', 1),
	  (2491,'BZ66', 1),
	  (2498,'AX12', 4),
	  (2498,'BT04', 2);

Alter table detailline
    add constraint ck_detailline_QTY check(QTY >= 1);

alter table part 
alter column UNITPRICE decimal(5, 2) not null;

INSERT INTO PART(PARTNO, DESCRIPTION, UNITPRICE)
   VALUES('BZ68','Switch', 29.99);

UPDATE PART
SET DESCRIPTION = 'Gas Tank'
WHERE PARTNO='BZ68';

Alter table part
   add constraint df_description default 'Unknown' for description;

delete from DETAILLINE
where PARTNO='BZ66';

delete from PART
where PARTNO='BZ66';

select orderno, d.PARTNO, QTY, Description, unitprice
from DETAILLINE d
join PART p
on d.PARTNO=p.PARTNO;


alter table part 
alter column description varchar(70);

select min(unitprice) as minprice, max(unitprice) as maxprice, AVG(unitprice) as avgprice
from PART;


select orderno, sum(qty) as Total_Qty
from DETAILLINE
group by orderno
order by Total_Qty desc;

select orderno, count(distinct partno) as CountofParts
from detailline
group by orderno; 




