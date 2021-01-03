ALTER TABLE NATION   DROP CONSTRAINT NATION_FK1;
ALTER TABLE SUPPLIER DROP CONSTRAINT SUPPLIER_FK1;
ALTER TABLE CUSTOMER DROP CONSTRAINT CUSTOMER_FK1;
ALTER TABLE PARTSUPP DROP CONSTRAINT PARTSUPP_FK1;
ALTER TABLE PARTSUPP DROP CONSTRAINT PARTSUPP_FK2;
ALTER TABLE ORDERS   DROP CONSTRAINT ORDERS_FK1;
ALTER TABLE LINEITEM DROP CONSTRAINT LINEITEM_FK1;
ALTER TABLE LINEITEM DROP CONSTRAINT LINEITEM_FK2;

ALTER TABLE REGION   DROP PRIMARY KEY;
ALTER TABLE NATION   DROP PRIMARY KEY;
ALTER TABLE PART     DROP PRIMARY KEY;
ALTER TABLE SUPPLIER DROP PRIMARY KEY;
ALTER TABLE PARTSUPP DROP PRIMARY KEY;
ALTER TABLE ORDERS   DROP PRIMARY KEY;
ALTER TABLE LINEITEM DROP PRIMARY KEY;
ALTER TABLE CUSTOMER DROP PRIMARY KEY;
COMMIT WORK;