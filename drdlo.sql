--------------------------------------------------------
--  File created - Monday-July-03-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View COMBINE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "PROJECT"."COMBINE" ("V_CODE", "V_NAME", "V_ADD1", "V_ADD2", "V_CITY") AS 
  (select "V_CODE","V_NAME","V_ADD1","V_ADD2","V_CITY" from venmast union select "V_CODE","V_NAME","V_ADD1","V_ADD2","V_CITY" from venprov)
;
--------------------------------------------------------
--  DDL for View STEP
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "PROJECT"."STEP" ("DEMAND_NO", "V_CODE", "V_NAME", "V_ADD1", "V_ADD2", "V_CITY") AS 
  select ctsrespond.demand_no,v_code,combine.v_name,combine.v_add1,combine.v_add2,combine.v_city from ctsrespond natural join combine
;
--------------------------------------------------------
--  DDL for Table CTSRESPOND
--------------------------------------------------------

  CREATE TABLE "PROJECT"."CTSRESPOND" 
   (	"DEMAND_NO" VARCHAR2(14 BYTE), 
	"V_CODE" VARCHAR2(9 BYTE), 
	"DEMAND_DATE" DATE, 
	"RESPOND_DATE" DATE, 
	"DESCRIPTION" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table DEMAND
--------------------------------------------------------

  CREATE TABLE "PROJECT"."DEMAND" 
   (	"DEMAND_NO" VARCHAR2(14 BYTE), 
	"DEMDATE" DATE, 
	"DESCRIPTION" VARCHAR2(500 BYTE), 
	"DEMVALUE" NUMBER(10,0), 
	"REMARKS" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table EMDTAB
--------------------------------------------------------

  CREATE TABLE "PROJECT"."EMDTAB" 
   (	"DEMAND_NO" VARCHAR2(14 BYTE), 
	"V_CODE" VARCHAR2(9 BYTE), 
	"TENDER_FEE" NUMBER(10,0), 
	"TENDER_FEE_DD_FEE" NUMBER(10,0), 
	"TENDER_FEE_DD_DATE" DATE, 
	"EMD_AMOUNT" FLOAT(126), 
	"EMD_AMOUNT_DD_NO" VARCHAR2(30 BYTE), 
	"EMD_AMOUNT_DD_DATE" DATE, 
	"EMD_VALID_FROM" DATE, 
	"EMD_VALID_TO" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table VENMAST
--------------------------------------------------------

  CREATE TABLE "PROJECT"."VENMAST" 
   (	"V_CODE" VARCHAR2(9 BYTE), 
	"V_NAME" VARCHAR2(60 BYTE), 
	"V_ADD1" VARCHAR2(200 BYTE), 
	"V_ADD2" VARCHAR2(200 BYTE), 
	"V_CITY" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table VENPROV
--------------------------------------------------------

  CREATE TABLE "PROJECT"."VENPROV" 
   (	"V_CODE" VARCHAR2(9 BYTE), 
	"V_NAME" VARCHAR2(60 BYTE), 
	"V_ADD1" VARCHAR2(200 BYTE), 
	"V_ADD2" VARCHAR2(200 BYTE), 
	"V_CITY" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into PROJECT.CTSRESPOND
SET DEFINE OFF;
Insert into PROJECT.CTSRESPOND (DEMAND_NO,V_CODE,DEMAND_DATE,RESPOND_DATE,DESCRIPTION) values ('dmd100','v202',to_date('01-01-17','DD-MM-RR'),to_date('04-01-17','DD-MM-RR'),'tender for dmd100 by v202');
Insert into PROJECT.CTSRESPOND (DEMAND_NO,V_CODE,DEMAND_DATE,RESPOND_DATE,DESCRIPTION) values ('dmd100','v203',to_date('01-01-17','DD-MM-RR'),to_date('06-01-17','DD-MM-RR'),'tender for dmd100 by v203');
Insert into PROJECT.CTSRESPOND (DEMAND_NO,V_CODE,DEMAND_DATE,RESPOND_DATE,DESCRIPTION) values ('dmd100','v204',to_date('01-01-17','DD-MM-RR'),to_date('07-01-17','DD-MM-RR'),'tender for dmd100 by v204');
Insert into PROJECT.CTSRESPOND (DEMAND_NO,V_CODE,DEMAND_DATE,RESPOND_DATE,DESCRIPTION) values ('dmd102','v205',to_date('01-02-17','DD-MM-RR'),to_date('05-02-17','DD-MM-RR'),'tender for dmd101 by v205');
Insert into PROJECT.CTSRESPOND (DEMAND_NO,V_CODE,DEMAND_DATE,RESPOND_DATE,DESCRIPTION) values ('dmd102','v206',to_date('01-02-17','DD-MM-RR'),to_date('08-02-17','DD-MM-RR'),'tender for dmd101 by v206');
Insert into PROJECT.CTSRESPOND (DEMAND_NO,V_CODE,DEMAND_DATE,RESPOND_DATE,DESCRIPTION) values ('dmd100','v201',to_date('01-01-17','DD-MM-RR'),to_date('05-01-17','DD-MM-RR'),'tender for dmd100 by v201');
REM INSERTING into PROJECT.DEMAND
SET DEFINE OFF;
Insert into PROJECT.DEMAND (DEMAND_NO,DEMDATE,DESCRIPTION,DEMVALUE,REMARKS) values ('dmd100',to_date('01-01-17','DD-MM-RR'),'This is a sample project dmd1',100,'This a very good project');
Insert into PROJECT.DEMAND (DEMAND_NO,DEMDATE,DESCRIPTION,DEMVALUE,REMARKS) values ('dmd101',to_date('01-02-17','DD-MM-RR'),'This is a sample project dmd2',101,'This a very avg project');
Insert into PROJECT.DEMAND (DEMAND_NO,DEMDATE,DESCRIPTION,DEMVALUE,REMARKS) values ('dmd102',to_date('01-03-17','DD-MM-RR'),'This is a sample project dmd1',102,'This a very ok project');
REM INSERTING into PROJECT.EMDTAB
SET DEFINE OFF;
Insert into PROJECT.EMDTAB (DEMAND_NO,V_CODE,TENDER_FEE,TENDER_FEE_DD_FEE,TENDER_FEE_DD_DATE,EMD_AMOUNT,EMD_AMOUNT_DD_NO,EMD_AMOUNT_DD_DATE,EMD_VALID_FROM,EMD_VALID_TO) values ('dmd101','v202',104,100,to_date('01-01-17','DD-MM-RR'),null,null,null,null,null);
Insert into PROJECT.EMDTAB (DEMAND_NO,V_CODE,TENDER_FEE,TENDER_FEE_DD_FEE,TENDER_FEE_DD_DATE,EMD_AMOUNT,EMD_AMOUNT_DD_NO,EMD_AMOUNT_DD_DATE,EMD_VALID_FROM,EMD_VALID_TO) values ('dmd101','v202',102,100,to_date('03-02-97','DD-MM-RR'),100,'100',to_date('03-02-97','DD-MM-RR'),to_date('03-02-97','DD-MM-RR'),to_date('03-02-97','DD-MM-RR'));
Insert into PROJECT.EMDTAB (DEMAND_NO,V_CODE,TENDER_FEE,TENDER_FEE_DD_FEE,TENDER_FEE_DD_DATE,EMD_AMOUNT,EMD_AMOUNT_DD_NO,EMD_AMOUNT_DD_DATE,EMD_VALID_FROM,EMD_VALID_TO) values ('dmd100','v201',1001,100,to_date('01-02-18','DD-MM-RR'),100,'100',to_date('01-01-17','DD-MM-RR'),to_date('01-01-17','DD-MM-RR'),to_date('04-07-17','DD-MM-RR'));
REM INSERTING into PROJECT.VENMAST
SET DEFINE OFF;
Insert into PROJECT.VENMAST (V_CODE,V_NAME,V_ADD1,V_ADD2,V_CITY) values ('v201','vendor1','address 1','address 1','city 1');
Insert into PROJECT.VENMAST (V_CODE,V_NAME,V_ADD1,V_ADD2,V_CITY) values ('v202','vendor2','address 2','address 2','city 2');
Insert into PROJECT.VENMAST (V_CODE,V_NAME,V_ADD1,V_ADD2,V_CITY) values ('v203','vendor3','address 3','address 3','city 3');
REM INSERTING into PROJECT.VENPROV
SET DEFINE OFF;
Insert into PROJECT.VENPROV (V_CODE,V_NAME,V_ADD1,V_ADD2,V_CITY) values ('v204','vendor4','address 4','address 4','city 4');
Insert into PROJECT.VENPROV (V_CODE,V_NAME,V_ADD1,V_ADD2,V_CITY) values ('v204','vendor4','address 4','address 4','city 4');
Insert into PROJECT.VENPROV (V_CODE,V_NAME,V_ADD1,V_ADD2,V_CITY) values ('v205','vendor5','address 5','address 5','city 5');
Insert into PROJECT.VENPROV (V_CODE,V_NAME,V_ADD1,V_ADD2,V_CITY) values ('v206','vendor6','address 6','address 6','city 6');
--------------------------------------------------------
--  DDL for Procedure INSERT_APP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "PROJECT"."INSERT_APP" (dno varchar,vno varchar,tf number,tfdf number,tfdd date,ea float,eadn varchar,eadd date,evf date,evt date)
as
begin
    merge into emdtab e
    using dual on (demand_no=dno)
     when matched then update set e.tender_fee=tf,
             e.tender_fee_dd_fee = tfdf,
             e.tender_fee_dd_date= tfdd,
             e.emd_amount=ea,
             e.emd_amount_dd_no=eadn,
             e.emd_amount_dd_date=eadd,
             e.emd_valid_from=evf,
             e.emd_valid_to=evt
             where e.v_code=vno and e.demand_no=dno
    when not matched then insert values (dno,vno,tf,tfdf,tfdd,ea,eadn,eadd,evf,evt);

end insert_app;

/
--------------------------------------------------------
--  DDL for Procedure INSERT_NAPP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "PROJECT"."INSERT_NAPP" (dno varchar,vno varchar,tf number,tfdf number,tfdd date)
as
begin
    merge into emdtab e
    using dual on (demand_no=dno)
     when matched then update set e.tender_fee=tf,
             e.tender_fee_dd_fee = tfdf,
             e.tender_fee_dd_date= tfdd
             where e.v_code=vno and e.demand_no=dno
    when not matched then insert(DEMAND_NO,V_CODE,TENDER_FEE,TENDER_FEE_DD_FEE,TENDER_FEE_DD_DATE) values (dno,vno,tf,tfdf,tfdd);

end insert_napp;

/
