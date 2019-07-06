/*
***********************************************************
           CBA Base Schema Objects 
************************************************************
*/


CREATE TABLE "TER01"
(
  "TERRCOD" VARCHAR2(50) , -- Primary key column for the TER01 table
  "TERRNAM" VARCHAR2(50) NOT NULL, -- The territory name,
  "TERRLAN" VARCHAR2(50) NOT NULL, --Language,
  "TERRSLA" VARCHAR2(50) NOT NULL, --Source language,
  CONSTRAINT "TER01_TERRCODE_PK" PRIMARY KEY ("TERRCOD")
);

COMMENT ON TABLE "TER01" IS 'The territories master data table';
COMMENT ON COLUMN "TER01"."TERRCOD" IS 'Primary key column for the TER01 table';
COMMENT ON COLUMN "TER01"."TERRNAM" IS 'The territory name';
COMMENT ON COLUMN "TER01"."TERRLAN" IS 'Language';
COMMENT ON COLUMN "TER01"."TERRSLA" IS 'Source language';

CREATE TABLE "ADD01"
(
  "ADDREID" NUMBER(8,0) NOT NULL, -- Primary key column for the ADD01 table
  "ADDRCIT" VARCHAR2(50) NOT NULL, -- Column for cities information
  "ADDRSTR" VARCHAR2(50) NOT NULL, -- Column for street information
  "ADDRSTA" VARCHAR2(200) NOT NULL, -- Column for state/region information
  "ADDRTYP" VARCHAR2(50), -- Column for  the address type
  "ADDRUSR" VARCHAR2(80), -- Standart  created by column
  "ADDRDAT" DATE DEFAULT SYSDATE, -- Standart created on column
  "ADDRUUS" VARCHAR2(80), -- Standart  last updated by column
  "ADDRUAT" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "ADDRCOU" VARCHAR2(50) NOT NULL, -- Foreign key to the countries table
  CONSTRAINT "ADD01_ADDREID_PK" PRIMARY KEY ("ADDREID")

);

COMMENT ON TABLE "ADD01" IS 'Locations master data table';
COMMENT ON COLUMN "ADD01"."ADDREID" IS 'Primary key column for the ADD01 table';
COMMENT ON COLUMN "ADD01"."ADDRCIT" IS 'Column for cities information';
COMMENT ON COLUMN "ADD01"."ADDRSTR" IS 'Column for street information';
COMMENT ON COLUMN "ADD01"."ADDRSTA" IS 'Column for state/region information';
COMMENT ON COLUMN "ADD01"."ADDRTYP" IS 'Column for  the address type';
COMMENT ON COLUMN "ADD01"."ADDRUSR" IS 'Standart  created by column';
COMMENT ON COLUMN "ADD01"."ADDRDAT" IS 'Standart created on column';
COMMENT ON COLUMN "ADD01"."ADDRUUS" IS 'Standart  last updated by column';
COMMENT ON COLUMN "ADD01"."ADDRUAT" IS 'Standart last updated on column';
COMMENT ON COLUMN "ADD01"."ADDRCOU" IS 'Foreign key to the countries table';

CREATE TABLE "BAN01"
(
  "BANKSID" NUMBER(8,0) , -- Primary key column for the BAN01 table
  "BANKCOD" VARCHAR2(50) NOT NULL , -- The bank code
  "BANKNAM" VARCHAR2(50) NOT NULL, -- The bank name,
  "BANKUSR" VARCHAR2(80), -- Standart  created by column
  "BANKDAT" DATE DEFAULT SYSDATE, -- Standart created on column
  "BANKUUS" VARCHAR2(80), -- Standart  last updated by column
  "BANKUAT" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "BANKTER" VARCHAR2(50) NOT NULL, -- Foreign key to the countries table (TER01)
  CONSTRAINT "BAN01_BANKSID_PK" PRIMARY KEY ("BANKSID")
);

COMMENT ON TABLE "BAN01" IS 'The banks master data table';
COMMENT ON COLUMN "BAN01"."BANKSID" IS 'Primary key column for the BAN01 table';
COMMENT ON COLUMN "BAN01"."BANKCOD" IS 'The bank code';
COMMENT ON COLUMN "BAN01"."BANKNAM" IS 'The bank name';
COMMENT ON COLUMN "BAN01"."BANKUSR" IS 'Standart  created by column';
COMMENT ON COLUMN "BAN01"."BANKDAT" IS 'Standart created on column';
COMMENT ON COLUMN "BAN01"."BANKUUS" IS 'Standart  last updated by column';
COMMENT ON COLUMN "BAN01"."BANKUAT" IS 'Standart last updated on column';
COMMENT ON COLUMN "BAN01"."BANKTER" IS 'Foreign key to the countries table (TER01)';



CREATE TABLE "DOC01"
(
  "DOCTYID" NUMBER(8,0) , -- Primary key column for the DOC01 table
  "DOCTCOD" VARCHAR2(50) NOT NULL , -- The doc type code
  "DOCTDES" VARCHAR2(50) NOT NULL, -- The doc type description
  CONSTRAINT "DOC01_DOCTYID_PK" PRIMARY KEY ("DOCTYID")
);

COMMENT ON TABLE "DOC01" IS 'The document types table';
COMMENT ON COLUMN "DOC01"."DOCTYID" IS 'Primary key column for the DOC01 table';
COMMENT ON COLUMN "DOC01"."DOCTCOD" IS 'The doc type code';
COMMENT ON COLUMN "DOC01"."DOCTDES" IS 'The doc type description';

/* Foreign Keys */

ALTER TABLE "ADD01" ADD  CONSTRAINT "ADD01_TER01_FK" FOREIGN KEY("ADDRCOU")
REFERENCES "TER01" ("TERRCOD")
;



/*
***********************************************************
           CBA General Ledger Schema Objects 
************************************************************
*/

/* Tables */

CREATE TABLE "CHA01"
(
  "COASIDS" NUMBER(8,0) NOT NULL , -- Primary key column for the CHA01 table
  "COANAME" VARCHAR2(255) NOT NULL, -- The name of the chart
  "COACODE" VARCHAR2(255), -- A short description for the chart
  "COADESC" VARCHAR2(255), -- A long description for the chart
  "COALANG" VARCHAR2(255), -- Chart base maintenance language
  "COAUSER" VARCHAR2(80), -- Standart created by column
  "COADATE" DATE  DEFAULT SYSDATE, -- Standart created on column
  "COAUPUS" VARCHAR2(80), -- Standart last updated by column
  "COAUPDD" DATE DEFAULT SYSDATE, -- Standart last updated on column
   CONSTRAINT "CHA01_COASIDS_PK" PRIMARY KEY ("COASIDS")
);

COMMENT ON TABLE "CHA01" IS 'The charts of accounts table';
COMMENT ON COLUMN "CHA01"."COASIDS" IS 'Primary key column for the CHA01 table';
COMMENT ON COLUMN "CHA01"."COANAME" IS 'The name of the chart';
COMMENT ON COLUMN "CHA01"."COACODE" IS 'A short description for the chart';
COMMENT ON COLUMN "CHA01"."COADESC" IS 'A long description for the chart';
COMMENT ON COLUMN "CHA01"."COALANG" IS 'Chart base maintenance language';
COMMENT ON COLUMN "CHA01"."COAUSER" IS 'Standart  created by column';
COMMENT ON COLUMN "CHA01"."COADATE" IS 'Standart created on column';
COMMENT ON COLUMN "CHA01"."COAUPUS" IS 'Standart last updated on column';
COMMENT ON COLUMN "CHA01"."COAUPDD" IS 'Standart last updated on column';

CREATE TABLE "ACC01"
(
  "ACCNTCD" NUMBER(8,0) , -- Primary key column for the accounts table
  "ACCNTNB" VARCHAR2(255) NOT NULL, -- Account code
  "ACCNTNM" VARCHAR2(255) NOT NULL, -- Account name
  "ACCNTDE" VARCHAR2(255), -- Account description
  "ACCNTTP" VARCHAR2(20), -- Account type
  "ACCNTPO" VARCHAR2(1), -- Allowing posting flag
  "ACCNTBU" VARCHAR2(1), -- Allowing budgeting flag
  "ACCNTST" VARCHAR2(1), -- Account status
  "ACCNTLE" NUMBER(20,0), -- Account level
  "ACCNTGR" NUMBER(20,0), -- Account group
  "ACCNTUS" VARCHAR2(80), -- Standart  created by column
  "ACCNTDT" DATE DEFAULT SYSDATE, -- Standart created on column
  "ACCNTUP" VARCHAR2(80), -- Standart  updated by column
  "ACCNTUD" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "ACCNTCA" NUMBER(8,0), -- Foreign key to the charts of accounts table (CHA01)
  "ACCNTPA" VARCHAR2(255), -- Foreign key to this table (ACC01) designating the account parent
  "ACCNTSE" NUMBER(8,0), -- Foreign key to ths segments table (ACS01)
  CONSTRAINT "ACC01_ACCNTCD_PK" PRIMARY KEY ("ACCNTCD")
);

COMMENT ON TABLE "ACC01" IS 'Natural G/L Accounts master list table';
COMMENT ON COLUMN "ACC01"."ACCNTCD" IS 'Primary key column for the ACC01 table';
COMMENT ON COLUMN "ACC01"."ACCNTNB" IS 'Account code';
COMMENT ON COLUMN "ACC01"."ACCNTNM" IS 'Account name';
COMMENT ON COLUMN "ACC01"."ACCNTDE" IS 'Account description';
COMMENT ON COLUMN "ACC01"."ACCNTTP" IS 'Account type';
COMMENT ON COLUMN "ACC01"."ACCNTPO" IS 'Allowing posting flag';
COMMENT ON COLUMN "ACC01"."ACCNTBU" IS 'Allowing budgeting flag';
COMMENT ON COLUMN "ACC01"."ACCNTST" IS 'Account status';
COMMENT ON COLUMN "ACC01"."ACCNTLE" IS 'Account level';
COMMENT ON COLUMN "ACC01"."ACCNTGR" IS 'Account group';
COMMENT ON COLUMN "ACC01"."ACCNTUS" IS 'Standart created by column';
COMMENT ON COLUMN "ACC01"."ACCNTDT" IS 'Standart created on column';
COMMENT ON COLUMN "ACC01"."ACCNTUP" IS 'Standart updated by column';
COMMENT ON COLUMN "ACC01"."ACCNTUD" IS 'Standart last updated on column';
COMMENT ON COLUMN "ACC01"."ACCNTCA" IS 'Foreign key to the accounts segments table (CHA01)';
COMMENT ON COLUMN "ACC01"."ACCNTPA" IS 'Foreign key to this table (ACC01) designating the account parent';
COMMENT ON COLUMN "ACC01"."ACCNTSE" IS 'Foreign key to ths segments table (ACS01)';

CREATE TABLE "CUR01"
(
  "CURRENI" NUMBER(8,0) NOT NULL , -- Primary key column for the CUR01 table
  "CURRENC" VARCHAR2(80) NOT NULL, -- The currency code
  "CURRENN" VARCHAR2(80), -- The currency name
  "CURRENS" VARCHAR2(80), -- The currency symbol
  "CURRENG" VARCHAR2(1), -- The currency status (enabled or disabled)
  "CURREND" DATE, -- The currency start date (enabled from)
  "CURRENE" DATE, -- The currency end date (enabled until)
  "CURRENU" VARCHAR2(80) , -- Standart created by column
  "CURRENA" DATE DEFAULT SYSDATE, -- Standart created on column
  "CURRENL" VARCHAR2(80) , -- Standart last updated by column
  "CURRENB" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "CURRENF" VARCHAR2(20), -- Foreign key to the countries table
  CONSTRAINT "CURRENCY_CURRENID_PK" PRIMARY KEY ("CURRENI")
);

COMMENT ON TABLE "CUR01" IS 'The currencies master list table';
COMMENT ON COLUMN "CUR01"."CURRENI" IS 'Primary key column for the CUR01 table';
COMMENT ON COLUMN "CUR01"."CURRENC" IS 'The currency code';
COMMENT ON COLUMN "CUR01"."CURRENN" IS 'The currency name';
COMMENT ON COLUMN "CUR01"."CURRENS" IS 'The currency symbol';
COMMENT ON COLUMN "CUR01"."CURRENG" IS 'The currency status (enabled or disabled)';
COMMENT ON COLUMN "CUR01"."CURREND" IS 'The currency start date (enabled from)';
COMMENT ON COLUMN "CUR01"."CURRENE" IS 'The currency end date (enabled until)';
COMMENT ON COLUMN "CUR01"."CURRENU" IS 'Standart created by column';
COMMENT ON COLUMN "CUR01"."CURRENA" IS 'Standart created on column';
COMMENT ON COLUMN "CUR01"."CURRENL" IS 'Standart last updated by column';
COMMENT ON COLUMN "CUR01"."CURRENB" IS 'Standart last updated on column';
COMMENT ON COLUMN "CUR01"."CURRENF" IS 'Foreign key to the countries table';

CREATE TABLE "LEG01"
(
  "LEGALID" NUMBER(8,0) NOT NULL , -- Primary key column for the LEG01 table
  "LEGALNA" VARCHAR2(255) NOT NULL, -- The legal entity name
  "LEGALEG" VARCHAR2(255), -- The legal enity national registration ID
  "LEGALIS" VARCHAR2(255), -- The legal enity tax ID
  "LEGALSR" VARCHAR2(80), -- Standart created by column
  "LEGALAT" DATE DEFAULT SYSDATE, -- Standart created on column
  "LEGALPU" VARCHAR2(80), -- Standart last updated by column
  "LEGALPD" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "LEGALCA" NUMBER(8,0), -- Foreign key to chart of accounts table (CHA01)
  "LEGALHE" NUMBER(8,0), -- Foreign key to addresses table (ADD01)
  CONSTRAINT "LEG01_LEGALID_PK" PRIMARY KEY ("LEGALID")
);

COMMENT ON TABLE "LEG01" IS 'The legal entities master list table';
COMMENT ON COLUMN "LEG01"."LEGALID" IS 'Primary key column for the LEG01 table';
COMMENT ON COLUMN "LEG01"."LEGALNA" IS 'The legal entity name';
COMMENT ON COLUMN "LEG01"."LEGALEG" IS 'The legal enity national registration ID';
COMMENT ON COLUMN "LEG01"."LEGALIS" IS 'The legal enity fiscal ID';
COMMENT ON COLUMN "LEG01"."LEGALSR" IS 'Standart created by column';
COMMENT ON COLUMN "LEG01"."LEGALAT" IS 'Standart created on column';
COMMENT ON COLUMN "LEG01"."LEGALPU" IS 'Standart last updated by column';
COMMENT ON COLUMN "LEG01"."LEGALPD" IS 'Standart last updated on column';
COMMENT ON COLUMN "LEG01"."LEGALCA" IS 'Foreign key to chart of accounts table (CHA01)';
COMMENT ON COLUMN "LEG01"."LEGALHE" IS 'Foreign key to addresses table (ADD01)';

CREATE TABLE "CAL01"
(
  "CALENID" NUMBER(8,0) NOT NULL , -- Primary key column for the CAL01 table
  "CALENDN" VARCHAR2(80) NOT NULL, -- The calendar name
  "CALENDS" VARCHAR2(80) NOT NULL, -- The calendar status
  "CALENDU" VARCHAR2(80), -- Standart created by column
  "CALENDT" DATE DEFAULT SYSDATE, -- Standart created on column
  "CALENDP" VARCHAR2(80) , -- Standart last updated by column
  "CALENLU" DATE DEFAULT SYSDATE, -- Standart last updated on column
  CONSTRAINT "CAL01_CALENDID_PK" PRIMARY KEY ("CALENID")
);

COMMENT ON TABLE "CAL01" IS 'The calendars master list table';
COMMENT ON COLUMN "CAL01"."CALENID" IS 'Primary key column for the CAL01 table';
COMMENT ON COLUMN "CAL01"."CALENDN" IS 'The calendar name';
COMMENT ON COLUMN "CAL01"."CALENDS" IS 'The calendar status';
COMMENT ON COLUMN "CAL01"."CALENDU" IS 'Standart created by column';
COMMENT ON COLUMN "CAL01"."CALENDT" IS 'Standart created on column';
COMMENT ON COLUMN "CAL01"."CALENDP" IS 'Standart last updated by column';
COMMENT ON COLUMN "CAL01"."CALENLU" IS 'Standart last updated on column';

CREATE TABLE "PER01"
(
  "PERIODI" NUMBER(8,0) NOT NULL, -- Primary key column for the PER01 table
  "PERIODN" VARCHAR2(80) NOT NULL, -- The period name
  "PERIODS" DATE NOT NULL, -- The period start date
  "PERIODE" DATE NOT NULL, -- The period end date
  "PERIODA" VARCHAR2(1), -- Period for adjustment flag
  "PERIODT" VARCHAR2(80), -- The period status
  "PERIODU" VARCHAR2(80), -- Standart created by column
  "PERIODD" DATE DEFAULT SYSDATE, -- Standart created on column
  "PERIODL" VARCHAR2(80), -- Standart last updated by column
  "PERIODM" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "PERIODC" NUMBER(8,0), -- Foreign key to the calendar table
   CONSTRAINT "PER01_PERIODID_PK" PRIMARY KEY ("PERIODI")
);

COMMENT ON TABLE "PER01" IS 'The periods table';
COMMENT ON COLUMN "PER01"."PERIODI" IS 'Primary key column for the PER01 table';
COMMENT ON COLUMN "PER01"."PERIODN" IS 'The period name';
COMMENT ON COLUMN "PER01"."PERIODS" IS 'The period start date';
COMMENT ON COLUMN "PER01"."PERIODE" IS 'The period end date';
COMMENT ON COLUMN "PER01"."PERIODA" IS 'Period for adjustment flag';
COMMENT ON COLUMN "PER01"."PERIODT" IS 'The period status';
COMMENT ON COLUMN "PER01"."PERIODU" IS 'Standart created by column';
COMMENT ON COLUMN "PER01"."PERIODD" IS 'Standart created on column';
COMMENT ON COLUMN "PER01"."PERIODL" IS 'Standart last updated by column';
COMMENT ON COLUMN "PER01"."PERIODM" IS 'Standart last updated on column';
COMMENT ON COLUMN "PER01"."PERIODC" IS 'Foreign key to the calendar table (CAL01)';


CREATE TABLE "TAX01"
(
  "TAXCODE" NUMBER(8,0) NOT NULL , -- Primary key column for the TAX01 table
  "TAXNAME" VARCHAR2(80) NOT NULL, -- The tax name
  "TAXRATE" NUMBER(15,2) NOT NULL, -- The taxe rate
  "TAXTYPE" VARCHAR2(20) NOT NULL, -- The tax type
  "TAXSTAR" DATE, -- The tax start date
  "TAXEEND" DATE, -- The tax end date
  "TAXUSER" VARCHAR2(80), -- Standart created by column
  "TAXDATE" DATE DEFAULT SYSDATE, -- Standart created on column
  "TAXUUPD" VARCHAR2(80), -- Standart last updated by column
  "TAXUATE" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "TAXTERR" VARCHAR2(50), -- Foreign key  to the countries table
  "TAXACCT" NUMBER(8,0), -- Foreign key to the accounts table
  CONSTRAINT "TAX01_TAXCODE_PK" PRIMARY KEY ("TAXCODE")
);

COMMENT ON TABLE "TAX01" IS 'The taxes master data table';
COMMENT ON COLUMN "TAX01"."TAXCODE" IS 'Primary key column for the TAX01 table';
COMMENT ON COLUMN "TAX01"."TAXNAME" IS 'The tax name';
COMMENT ON COLUMN "TAX01"."TAXRATE" IS 'The taxe rate';
COMMENT ON COLUMN "TAX01"."TAXTYPE" IS 'The tax type';
COMMENT ON COLUMN "TAX01"."TAXSTAR" IS 'The tax start date';
COMMENT ON COLUMN "TAX01"."TAXEEND" IS 'The tax end date';
COMMENT ON COLUMN "TAX01"."TAXUSER" IS 'Standart created by column';
COMMENT ON COLUMN "TAX01"."TAXDATE" IS 'Standart created on column';
COMMENT ON COLUMN "TAX01"."TAXUUPD" IS 'Standart last updated by column';
COMMENT ON COLUMN "TAX01"."TAXUATE" IS 'Standart last updated on column';
COMMENT ON COLUMN "TAX01"."TAXTERR" IS 'Foreign key  to the countries table';
COMMENT ON COLUMN "TAX01"."TAXACCT" IS 'Foreign key to the accounts table';

CREATE TABLE "JHE01"
(
  "JOURNID" NUMBER(8,0) NOT NULL , -- Primary key column for the JHE01 table
  "JOURNDE" VARCHAR2(255), -- The journal description
  "JOURNSO" VARCHAR2(20), -- The journal source
  "JOURNST" VARCHAR2(20), -- The journal status
  "JOURNCA" VARCHAR2(20), -- The journal category
  "JOURNAF" VARCHAR2(20), -- Actual flag
  "JOURNBF" VARCHAR2(20), -- Balanced flag
  "JOURNTC" NUMBER(19,2), -- Total journal credits
  "JOURNTD" NUMBER(19,2), -- Total journal debits
  "JOURNUS" VARCHAR2(80), -- Standart created by column
  "JOURNDA" DATE DEFAULT SYSDATE, -- Standart created on column
  "JOURNUU" VARCHAR2(80), -- Standart last updated by column
  "JOURNUD" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "JOURNCU" NUMBER(8,0) NOT NULL,  -- Foreign key to the currency table
  "JOURNLE" NUMBER(8,0) NOT NULL,  -- Foreign key to the legal entities table
  "JOURNPE" NUMBER(8,0) NOT NULL,  -- Foreign key to the periods table
  CONSTRAINT "JHE01_JOURNAID_PK" PRIMARY KEY ("JOURNID")

);

COMMENT ON TABLE "JHE01" IS 'G/L journal header table';
COMMENT ON COLUMN "JHE01"."JOURNID" IS 'Primary key column for the JHE01 table';
COMMENT ON COLUMN "JHE01"."JOURNDE" IS 'The journal description';
COMMENT ON COLUMN "JHE01"."JOURNSO" IS 'The journal source';
COMMENT ON COLUMN "JHE01"."JOURNST" IS 'The journal status';
COMMENT ON COLUMN "JHE01"."JOURNAF" IS 'Actual flag';
COMMENT ON COLUMN "JHE01"."JOURNBF" IS 'Balanced flag';
COMMENT ON COLUMN "JHE01"."JOURNTC" IS 'Total journal credits';
COMMENT ON COLUMN "JHE01"."JOURNTD" IS 'Total journal debits';
COMMENT ON COLUMN "JHE01"."JOURNUS" IS 'Standart created by column';
COMMENT ON COLUMN "JHE01"."JOURNDA" IS 'Standart created on column';
COMMENT ON COLUMN "JHE01"."JOURNUU" IS 'Standart last updated by column';
COMMENT ON COLUMN "JHE01"."JOURNUD" IS 'Standart last updated on column';
COMMENT ON COLUMN "JHE01"."JOURNCU" IS 'Foreign key to the currency table';
COMMENT ON COLUMN "JHE01"."JOURNLE" IS 'Foreign key to the legal entities table';
COMMENT ON COLUMN "JHE01"."JOURNPE" IS 'Foreign key to the periods table';

CREATE TABLE "JLI01"
(
  "JRNLILI" NUMBER(8,0) NOT NULL, -- Part of the composite primary key of the JRNLILI table.This column holds a unique number for every journal details line.
  "JRNLIJI" NUMBER(8,0) NOT NULL, -- Primary key column for the JRNLILI table and foreign key that reference the journal headers table
  "JRNLIDE" NUMBER(15,2), -- Debit amount
  "JRNLICR" NUMBER(15,2), -- Credit amount
  "JRNLUSR" VARCHAR2(80), -- Standart  created by column
  "JRNLDAT" DATE DEFAULT SYSDATE, -- Standart  created on column
  "JRNLIUS" VARCHAR2(80), -- Standart  last updated by column
  "JRNLIDA" DATE DEFAULT SYSDATE, -- Standart  last updated on column
  "JRNLACC" NUMBER(8,0), -- Foreign key to the accounts table (ACC01)
  "JRNLTAX" NUMBER(8,0), -- Foreign key to the taxes table (TAX01)
  CONSTRAINT "JLI01_JRNLILIN_JRNLIJID_PK" PRIMARY KEY ("JRNLILI", "JRNLIJI")
);

COMMENT ON TABLE "JLI01" IS 'G/L journal details table';
COMMENT ON COLUMN "JLI01"."JRNLILI" IS 'Part of the composite primary key of the JRNLILI table.This column holds a unique number for every journal details line.';
COMMENT ON COLUMN "JLI01"."JRNLIJI" IS 'Primary key column for the journal lines table and foreign key that reference the journal headers table';
COMMENT ON COLUMN "JLI01"."JRNLIDE" IS 'Debit amount';
COMMENT ON COLUMN "JLI01"."JRNLICR" IS 'Credit amount';
COMMENT ON COLUMN "JLI01"."JRNLUSR" IS 'Standart  created by column';
COMMENT ON COLUMN "JLI01"."JRNLDAT" IS 'Standart  created on column';
COMMENT ON COLUMN "JLI01"."JRNLIUS" IS 'Standart  last updated by column';
COMMENT ON COLUMN "JLI01"."JRNLIDA" IS 'Standart  last updated on column';
COMMENT ON COLUMN "JLI01"."JRNLACC" IS 'Foreign key to the accounts table (ACC01)';
COMMENT ON COLUMN "JLI01"."JRNLTAX" IS 'Foreign key to the taxes table (TAX01)';

CREATE TABLE "BUD01"
(
  "BUDGETI" NUMBER(8,0) NOT NULL  , -- Primary key column for the BUD01  table
  "BUDGETN" VARCHAR2(255), -- The budget name
  "BUDGETD" VARCHAR2(255), -- A budget description
  "BUDGETS" VARCHAR2(20), -- The budget status
  "BUDGETU" VARCHAR2(80), -- Standart created by column
  "BUDGETA" DATE DEFAULT SYSDATE,  -- Standart  created on column
  "BUDGEDU" VARCHAR2(80), -- Standart last updated by column
  "BUDGEUD" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "BUDGECA" NUMBER(8,0), -- Foreign key to the calendars table
  "BUDGETL" NUMBER(8,0), -- Foreign key to the legal entities table
   CONSTRAINT "BUD01_BUDGETI_PK"  PRIMARY KEY ("BUDGETI") 
);

COMMENT ON TABLE "BUD01" IS 'The budgets table';
COMMENT ON COLUMN "BUD01"."BUDGETI" IS 'Primary key column for the BUD01 table';
COMMENT ON COLUMN "BUD01"."BUDGETN" IS 'The budget name';
COMMENT ON COLUMN "BUD01"."BUDGETD" IS 'A budget description';
COMMENT ON COLUMN "BUD01"."BUDGETS" IS 'The budget status';
COMMENT ON COLUMN "BUD01"."BUDGETU" IS 'Standart created by column';
COMMENT ON COLUMN "BUD01"."BUDGETA" IS 'Standart created on column';
COMMENT ON COLUMN "BUD01"."BUDGEDU" IS 'Standart last updated by column';
COMMENT ON COLUMN "BUD01"."BUDGEUD" IS 'Standart last updated on column';
COMMENT ON COLUMN "BUD01"."BUDGECA" IS 'Foreign key to the calendars table';
COMMENT ON COLUMN "BUD01"."BUDGETL" IS 'Foreign key to the legal entites table';

CREATE TABLE "BUL01"
(
  "BULLILI" NUMBER(8,0) NOT NULL, -- Part of the composite primary key of the BUL01 table
  "BULLIBU" NUMBER(8,0) NOT NULL, -- Primary key column for the BUL01 table and foreign key that reference the budget headers table BUD01
  "BULLIAM" NUMBER(19,2) NOT NULL, -- The budget amount 
  "BULLUSR" VARCHAR2(80), -- Standart  created by column
  "BULLDAT" DATE DEFAULT SYSDATE, -- Standart  created on column
  "BULLIUS" VARCHAR2(80), -- Standart  last updated by column
  "BULLIDA" DATE DEFAULT SYSDATE, -- Standart  last updated on column
  "BULLACC" NUMBER(8,0), -- Foreign key to the accounts  table (ACC01)
  "BULLPER" NUMBER(8,0), -- Foreign key to the periods table (PER01)
  CONSTRAINT "BUL01_BULLILI_BULLIBI_PK" PRIMARY KEY ("BULLILI", "BULLIBU")
) ;

COMMENT ON TABLE "BUL01" IS 'The buget details table';
COMMENT ON COLUMN "BUL01"."BULLILI" IS 'Part of the composite primary key of the BUL01 table';
COMMENT ON COLUMN "BUL01"."BULLIBU" IS 'Primary key and foreign key to the  master table (BUD01)';
COMMENT ON COLUMN "BUL01"."BULLIAM" IS 'The budget amount';
COMMENT ON COLUMN "BUL01"."BULLUSR" IS 'Standart  created by column';
COMMENT ON COLUMN "BUL01"."BULLDAT" IS 'Standart  created on column';
COMMENT ON COLUMN "BUL01"."BULLIUS" IS 'Standart  last updated by column';
COMMENT ON COLUMN "BUL01"."BULLIDA" IS 'Standart  last updated on column';
COMMENT ON COLUMN "BUL01"."BULLACC" IS 'Foreign key to the accounts table (ACC01)';
COMMENT ON COLUMN "BUL01"."BULLPER" IS 'Foreign key to the periods table (PER01)';


CREATE TABLE "BAL01"
(
  "BALANCI" NUMBER(8,0) NOT NULL, -- Primary key column for the BAL01 balance table
  "BALANBD" NUMBER(10,2), -- Account begining total debit balance
  "BALANBC" NUMBER(10,2), -- Account begining total credit balance
  "BALANPD" NUMBER(10,2), -- Account period debit balance
  "BALANPC" NUMBER(10,2), -- Account period credit balance
  "BALANUP" VARCHAR2(80), -- Balance last updated by
  "BALANUD" DATE DEFAULT SYSDATE, -- Balance last updated on
  "BALANAC" NUMBER(8,0), -- Foreign key to the accounts table (ACC01)
  "BALANCU" NUMBER(8,0), -- Foreign key to the currency table (CUR01)
  "BALANJL" NUMBER(8,0), -- Foreign key to the journals items table (JLI01)
  "BALANJI" NUMBER(8,0), -- Foreign key to the journal items table (JLI01)
  "BALANPE" NUMBER(8,0), -- Foreign key to the periods table (PER01)
  "BALANLE" NUMBER(8,0), -- Foreign key to the legal entities table (LEG01)
  CONSTRAINT "BAL01_BALANCID_PK" PRIMARY KEY ("BALANCI")
);

COMMENT ON TABLE "BAL01" IS 'Daily account balances table';
COMMENT ON COLUMN "BAL01"."BALANCI" IS 'Primary key column for the BAL01 balance table';
COMMENT ON COLUMN "BAL01"."BALANBD" IS 'Account begining total debit balance';
COMMENT ON COLUMN "BAL01"."BALANBC" IS 'Account begining total credit balance';
COMMENT ON COLUMN "BAL01"."BALANPD" IS 'Account period debit balance';
COMMENT ON COLUMN "BAL01"."BALANPC" IS 'Account period credit balance ';
COMMENT ON COLUMN "BAL01"."BALANUP" IS 'Balance last updated by';
COMMENT ON COLUMN "BAL01"."BALANUD" IS 'Balance last updated on';
COMMENT ON COLUMN "BAL01"."BALANAC" IS 'Foreign key to the accounts table (ACC01)';
COMMENT ON COLUMN "BAL01"."BALANCU" IS 'Foreign key to the currency table(CUR01)';
COMMENT ON COLUMN "BAL01"."BALANJL" IS 'Foreign key to the journals items table (JLI01)';
COMMENT ON COLUMN "BAL01"."BALANJI" IS 'Foreign key to the journal items table (JLI01)';
COMMENT ON COLUMN "BAL01"."BALANPE" IS 'Foreign key to the periods table (PER01)';
COMMENT ON COLUMN "BAL01"."BALANLE" IS 'Foreign key to the legal entities table(LEG01)';


CREATE TABLE "ACS01"
(
  "ACSTSID" NUMBER(8,0) NOT NULL, -- Primary key for the ACS01 table
  "ACSNAME" VARCHAR2(255) NOT NULL, -- The segment name
  "ACSTYPE" VARCHAR2(20), -- The segment type
  "ACSDESC" VARCHAR2(255), -- The segment description
  "ACSNTUS" VARCHAR2(80) , -- Standart created by column
  "ACSDATE" DATE DEFAULT SYSDATE, -- Standart created on column
  "ACSNTUP" VARCHAR2(80) , -- Standart last updated by column
  "ACSNTUD" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "ACSCOID" NUMBER NOT NULL, -- Foreign key that holds a reference to the charts of account table
  CONSTRAINT "ACS01_ACSTSID_PK" PRIMARY KEY ("ACSTSID")
);

COMMENT ON TABLE "ACS01" IS 'Table for accounts segments';
COMMENT ON COLUMN "ACS01"."ACSTSID" IS 'Primary key for the ACS01 table';
COMMENT ON COLUMN "ACS01"."ACSNAME" IS 'The segment name';
COMMENT ON COLUMN "ACS01"."ACSTYPE" IS 'The segment type';
COMMENT ON COLUMN "ACS01"."ACSDESC" IS 'The segment description';
COMMENT ON COLUMN "ACS01"."ACSNTUS" IS 'Standart created by column';
COMMENT ON COLUMN "ACS01"."ACSDATE" IS 'Standart created on column';
COMMENT ON COLUMN "ACS01"."ACSNTUP" IS 'Standart last updated by column';
COMMENT ON COLUMN "ACS01"."ACSNTUD" IS 'Standart last updated on column';
COMMENT ON COLUMN "ACS01"."ACSCOID" IS 'Foreign key that holds a reference to the charts of account table';

CREATE TABLE "AGP01"
(
  "ACGRPID" NUMBER(8,0) NOT NULL, -- Primary key for the AGP01 table
  "ACGAPID" NUMBER(8,0), -- Account group parent account id
  "ACGRPST" NUMBER(8,0), -- Account group range start account
  "ACGRPEN" NUMBER(8,0), -- Account group rang end account
  "ACGNTUS" VARCHAR2(80), -- Standart created by column
  "ACGNTDT" DATE DEFAULT SYSDATE, -- Standart created on column
  "ACGNTUP" VARCHAR2(80), -- Standart last updated by column
  "ACGNTUD" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "ACGRCOA" NUMBER(8,0), -- Foreign key that holds a reference to the charts of account table
  CONSTRAINT "AGP01_ACGRPID_PK" PRIMARY KEY ("ACGRPID")

);

COMMENT ON TABLE "AGP01" IS 'Table for account groups and their respective ranges';
COMMENT ON COLUMN "AGP01"."ACGRPID" IS 'Primary key for the ACCGP table';
COMMENT ON COLUMN "AGP01"."ACGAPID" IS 'Account group parent account id';
COMMENT ON COLUMN "AGP01"."ACGRPST" IS 'Account group range start account';
COMMENT ON COLUMN "AGP01"."ACGRPEN" IS 'Account group rang end account';
COMMENT ON COLUMN "AGP01"."ACGNTUS" IS 'Standart created by column';
COMMENT ON COLUMN "AGP01"."ACGNTDT" IS 'Standart created on column';
COMMENT ON COLUMN "AGP01"."ACGNTUP" IS 'Standart last updated by column';
COMMENT ON COLUMN "AGP01"."ACGNTUD" IS 'Standart last updated on column';
COMMENT ON COLUMN "AGP01"."ACGRCOA" IS 'Foreign key that holds a reference to the charts of account table';

CREATE TABLE "RAT01"
(
  "RATEIDS" NUMBER(8,0) NOT NULL , -- Primary key column for the RAT01 table
  "RATECUF" NUMBER(8,0), -- Holds a reference to the currencies table to represent the currency source
  "RATECUT" NUMBER(8,0), -- Holds a reference to the currencies table to represent the currency target
  "RATEDVA" NUMBER(15,2) NOT NULL, -- Rate value column
  "RATESDA" DATE NOT NULL, -- Rate start date
  "RATEEDA" DATE NOT NULL, -- Rate end date
  "RATEUSR" VARCHAR2(80) , -- Standart created by column
  "RATEDAT" DATE DEFAULT SYSDATE, -- Standart created on column
  "RATEUPU" VARCHAR2(80), -- Standart last updated by column
  "RATEUPD" DATE DEFAULT SYSDATE, -- Standart last updated on column
  CONSTRAINT "RAT01_RATESIDS_PK" PRIMARY KEY ("RATEIDS")
);

COMMENT ON TABLE "RAT01" IS 'The currencies rates table';
COMMENT ON COLUMN "RAT01"."RATEIDS" IS 'Primary key column for the RAT01 table';
COMMENT ON COLUMN "RAT01"."RATECUF" IS 'Holds a reference to the currencies table to represent the currency source';
COMMENT ON COLUMN "RAT01"."RATECUT" IS 'Holds a reference to the currencies table to represent the currency target';
COMMENT ON COLUMN "RAT01"."RATEDVA" IS 'Rate value column';
COMMENT ON COLUMN "RAT01"."RATESDA" IS 'Rate start date';
COMMENT ON COLUMN "RAT01"."RATEEDA" IS 'Rate end date';
COMMENT ON COLUMN "RAT01"."RATEUSR" IS 'Standart created by column';
COMMENT ON COLUMN "RAT01"."RATEDAT" IS 'Standart created on column';
COMMENT ON COLUMN "RAT01"."RATEUPU" IS 'Standart last updated by column';
COMMENT ON COLUMN "RAT01"."RATEUPD" IS 'Standart last updated on column';


/*Foreign Keys */

ALTER TABLE "ACC01" ADD  CONSTRAINT "ACC01_CHA01_FK" FOREIGN KEY("ACCNTCA")
REFERENCES "CHA01" ("COASIDS")
;
ALTER TABLE "ACC01" ADD  CONSTRAINT "ACC01_ACS01_FK" FOREIGN KEY("ACCNTSE")
REFERENCES "ACS01" ("ACSTSID")
;
ALTER TABLE "ACS01" ADD  CONSTRAINT "ACS01_CHA01_FK" FOREIGN KEY("ACSCOID")
REFERENCES "CHA01" ("COASIDS")
;
ALTER TABLE "BUD01" ADD  CONSTRAINT "BUD01_CAL01_FK" FOREIGN KEY("BUDGECA")
REFERENCES "CAL01" ("CALENID")
;
ALTER TABLE "BUD01" ADD  CONSTRAINT "BUD01_LEG01_FK" FOREIGN KEY("BUDGETL")
REFERENCES "LEG01" ("LEGALID")
;
ALTER TABLE "BUL01" ADD  CONSTRAINT "BUL01_BUD01_FK" FOREIGN KEY("BULLIBU")
REFERENCES "BUD01" ("BUDGETI")
;
ALTER TABLE "BUL01" ADD  CONSTRAINT "BUL01_ACC01_FK" FOREIGN KEY("BULLACC")
REFERENCES "ACC01" ("ACCNTCD")
;
ALTER TABLE "BUL01" ADD  CONSTRAINT "BUL01_PER01_FK" FOREIGN KEY("BULLPER")
REFERENCES "PER01" ("PERIODI")
;
ALTER TABLE "JHE01" ADD  CONSTRAINT "JHE01_CUR01_FK" FOREIGN KEY("JOURNCU")
REFERENCES "CUR01" ("CURRENI")
;
ALTER TABLE "JHE01" ADD  CONSTRAINT "JHE01_LEG01_FK" FOREIGN KEY("JOURNLE")
REFERENCES "LEG01" ("LEGALID")
;
ALTER TABLE "JHE01" ADD  CONSTRAINT "JHE01_PER01_FK" FOREIGN KEY("JOURNPE")
REFERENCES "PER01" ("PERIODI")
;
ALTER TABLE "JLI01" ADD  CONSTRAINT "JLI01_JHE01_FK" FOREIGN KEY("JRNLIJI")
REFERENCES "JHE01" ("JOURNID")
;
ALTER TABLE "JLI01" ADD  CONSTRAINT "JLI01_ACC01_FK" FOREIGN KEY("JRNLACC")
REFERENCES "ACC01" ("ACCNTCD")
;
ALTER TABLE "JLI01" ADD  CONSTRAINT "JLI01_TAX01_FK" FOREIGN KEY("JRNLTAX")
REFERENCES "TAX01" ("TAXCODE")
;
ALTER TABLE "LEG01" ADD  CONSTRAINT "LEG01_CHA01_FK" FOREIGN KEY("LEGALCA")
REFERENCES "CHA01" ("COASIDS")
;
ALTER TABLE  "LEG01" ADD CONSTRAINT "LEG01_ADD01_FK" FOREIGN KEY ("LEGALHE")
REFERENCES  "ADD01" ("ADDREID")
;
ALTER TABLE "BAL01" ADD  CONSTRAINT "BAL01_ACC01_FK" FOREIGN KEY("BALANAC")
REFERENCES "ACC01" ("ACCNTCD")
;
ALTER TABLE "BAL01" ADD  CONSTRAINT "BAL01_CUR01_FK" FOREIGN KEY("BALANCU")
REFERENCES "CUR01" ("CURRENI")
;
ALTER TABLE "BAL01" ADD  CONSTRAINT "BAL01_JLI01_FK" FOREIGN KEY("BALANJL" , "BALANJI")
REFERENCES "JLI01" ("JRNLIJI" , "JRNLILI")
;
ALTER TABLE "BAL01" ADD  CONSTRAINT "BAL01_LEG01_FK" FOREIGN KEY("BALANLE")
REFERENCES "LEG01" ("LEGALID")
;
ALTER TABLE "BAL01" ADD  CONSTRAINT "BAL01_PER01_FK" FOREIGN KEY("BALANPE")
REFERENCES "PER01" ("PERIODI")
;
ALTER TABLE  "TAX01" ADD CONSTRAINT "TAX01_TER01_FK" FOREIGN KEY ("TAXTERR")
REFERENCES  "TER01" ("TERRCOD")
;


/*
***********************************************************
           CBA Banking  Objects 
************************************************************
*/


CREATE TABLE "BAN01"
(
  "BANKSID" NUMBER(8,0) , -- Primary key column for the BAN01 table
  "BANKCOD" VARCHAR2(50) NOT NULL , -- The bank code
  "BANKNAM" VARCHAR2(50) NOT NULL, -- The bank name,
  "BANKNUM" VARCHAR2(80), -- The bank account number,
  "BANKBEN" VARCHAR2(80), -- The bank beneficiary name,
  "BANKUSR" VARCHAR2(80), -- Standart created by column
  "BANKDAT" DATE DEFAULT SYSDATE, -- Standart created on column
  "BANKUUS" VARCHAR2(80), -- Standart last updated by column
  "BANKUAT" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "BANKTER" VARCHAR2(50) NOT NULL, -- Foreign key to the countries table (TER01)
  "BANKLEG" NUMBER(8,0) NOT NULL -- Foreign key to the legal entities table (LEG01)

  CONSTRAINT "BAN01_BANKSID_PK" PRIMARY KEY ("BANKSID")
);

COMMENT ON TABLE "BAN01" IS 'The banks master data table';
COMMENT ON COLUMN "BAN01"."BANKSID" IS 'Primary key column for the BAN01 table';
COMMENT ON COLUMN "BAN01"."BANKCOD" IS 'The bank code';
COMMENT ON COLUMN "BAN01"."BANKNAM" IS 'The bank name';
COMMENT ON COLUMN "BAN01"."BANKNUM" IS 'The bank account number';
COMMENT ON COLUMN "BAN01"."BANKBEN" IS 'The bank beneficiary name';
COMMENT ON COLUMN "BAN01"."BANKUSR" IS 'Standart created by column';
COMMENT ON COLUMN "BAN01"."BANKDAT" IS 'Standart created on column';
COMMENT ON COLUMN "BAN01"."BANKUUS" IS 'Standart last updated by column';
COMMENT ON COLUMN "BAN01"."BANKUAT" IS 'Standart last updated on column';
COMMENT ON COLUMN "BAN01"."BANKTER" IS 'Foreign key to the countries table (TER01)';
COMMENT ON COLUMN "BAN01"."BANKLEG" IS 'Foreign key to the legal entities table (LEG01)';



CREATE TABLE "PAY01"
(
  "PAYESID" NUMBER(8,0), -- Primary key column for the PAY01 table
  "PAYETYP" VARCHAR2(50) NOT NULL, -- The payment type
  "PAYEAMO" VARCHAR2(50) NOT NULL, -- The payment amount
  "PAYEMET" VARCHAR2(80), -- The payment method
  "PAYEUSR" VARCHAR2(80), -- Standart created by column
  "PAYEDAT" DATE DEFAULT SYSDATE, -- Standart created on column
  "PAYEUUS" VARCHAR2(80), -- Standart last updated by column
  "PAYEUAT" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "PAYELEG" NUMBER(8,0) , -- Foreign key to the legal entities table (LEG01)
  "PAYEBAN" NUMBER(8,0) , -- Foreign key to the bank table (BAN01)
  "PAYEBPA" NUMBER(8,0)  -- Foreign key to the business partner table (BPA01)

  CONSTRAINT "PAY01_PAYESID_PK" PRIMARY KEY ("PAYESID")
);

COMMENT ON TABLE "PAY01" IS 'The payments table';
COMMENT ON COLUMN "PAY01"."PAYESID" IS 'Primary key column for the PAY01 table';
COMMENT ON COLUMN "PAY01"."PAYETYP" IS 'The bank code';
COMMENT ON COLUMN "PAY01"."PAYEAMO" IS 'The bank name';
COMMENT ON COLUMN "PAY01"."PAYEMET" IS 'The bank account number';
COMMENT ON COLUMN "PAY01"."PAYEUSR" IS 'The bank beneficiary name';
COMMENT ON COLUMN "PAY01"."PAYEDAT" IS 'Standart created by column';
COMMENT ON COLUMN "PAY01"."PAYEUAT" IS 'Standart created on column';
COMMENT ON COLUMN "PAY01"."PAYELEG" IS 'Standart last updated on column';
COMMENT ON COLUMN "PAY01"."PAYEBAN" IS 'Foreign key to the countries table (TER01)';
COMMENT ON COLUMN "PAY01"."PAYEBPA" IS 'Foreign key to the legal entities table (LEG01)';


/* Foreign keys */

ALTER TABLE "BAN01" ADD  CONSTRAINT "BAN01_LEG01_FK" FOREIGN KEY("BANKLEG")
REFERENCES "LEG01" ("LEGALID")
;
ALTER TABLE "BAN01" ADD  CONSTRAINT "BAN01_TER01_FK" FOREIGN KEY("BANKTER")
REFERENCES "TER01" ("TERRCOD")
;

ALTER TABLE "PAY01" ADD  CONSTRAINT "PAY01_LEG01_FK" FOREIGN KEY("BANKLEG")
REFERENCES "LEG01" ("LEGALID")
;



/*
***********************************************************
           CBA Inventory  Objects 
************************************************************
*/

/* Tables */

CREATE TABLE "PFA01"
(
  "PFATSID" NUMBER(8,0), -- Primary key for the PFA01 table
  "PFANAME" VARCHAR2(255) NOT NULL, -- The product family name
  "PFADESC" VARCHAR2(255), -- The product family description
  "PFANTUS" VARCHAR2(80) , -- Standart created by column
  "PFADATE" DATE DEFAULT SYSDATE, -- Standart created on column
  "PFALUDB" VARCHAR2(80) , -- Standart last updated by column
  "PFALUDO" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "PFALEGA" NUMBER(8,0) , -- Foreign key to the legal entities table (LEG01)
  CONSTRAINT "PFA01_PFATSID_PK" PRIMARY KEY ("PFATSID")
);

COMMENT ON TABLE "PFA01" IS 'Products family table';
COMMENT ON COLUMN "PFA01"."PFATSID" IS 'Primary key for the PFA01 table';
COMMENT ON COLUMN "PFA01"."PFANAME" IS 'The product family name';
COMMENT ON COLUMN "PFA01"."PFADESC" IS 'The product family description';
COMMENT ON COLUMN "PFA01"."PFANTUS" IS 'Standart created by column';
COMMENT ON COLUMN "PFA01"."PFADATE" IS 'Standart created on column';
COMMENT ON COLUMN "PFA01"."PFALUDB" IS 'Standart last updated by column';
COMMENT ON COLUMN "PFA01"."PFALEGA" IS 'Foreign key to the legal entities table (LEG01)';


CREATE TABLE "PSF01"
(
  "PSFTSID" NUMBER(8,0), -- Primary key for the PSF01 table
  "PSFNAME" VARCHAR2(255) NOT NULL, -- The product sub-family name
  "PSFDESC" VARCHAR2(255), -- The product sub-family description
  "PSFCBUS" VARCHAR2(80) , -- Standart created by column
  "PSFDATE" DATE DEFAULT SYSDATE, -- Standart created on column
  "PSFLUDB" VARCHAR2(80) , -- Standart last updated by column
  "PSFLUDO" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "PSFPFFK" NUMBER(8,0), -- Foreign key to the product family table (PFA01)
  CONSTRAINT "PSF01_PSFTSID_PK" PRIMARY KEY ("PSFTSID")
);

COMMENT ON TABLE "PSF01" IS 'Products sub-family table';
COMMENT ON COLUMN "PSF01"."PSFTSID" IS 'Primary key for the PSF01 table';
COMMENT ON COLUMN "PSF01"."PSFNAME" IS 'The product sub-family name';
COMMENT ON COLUMN "PSF01"."PSFDESC" IS 'The product sub-family description';
COMMENT ON COLUMN "PSF01"."PSFCBUS" IS 'Standart created by column';
COMMENT ON COLUMN "PSF01"."PSFDATE" IS 'Standart created on column';
COMMENT ON COLUMN "PSF01"."PSFLUDB" IS 'Standart last updated by column';
COMMENT ON COLUMN "PSF01"."PSFLUDO" IS 'Standart last updated on column';
COMMENT ON COLUMN "PSF01"."PSFPFFK" IS 'Foreign key to the product family table (PFA01)';

CREATE TABLE "WAR01"
(
  "WAREHID" NUMBER(8,0), -- Primary key for the WAR01 table
  "WAREDES" VARCHAR2(255), -- The warehouse short description
  "WAREHUS" VARCHAR2(80) , -- Standart created by column
  "WARDATE" DATE DEFAULT SYSDATE, -- Standart created on column
  "WARLUDB" VARCHAR2(80) , -- Standart last updated by column
  "WARLUDO" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "WARLADD" NUMBER(8,0), -- Foreign key to the address table (ADD01)
  "WARELEG" NUMBER(8,0), -- Foreign key to the legal entities table (LEG01)
  CONSTRAINT "WAR01_WAREHID_PK" PRIMARY KEY ("WAREHID")
  
);

COMMENT ON TABLE "WAR01" IS 'The warehouses master table';
COMMENT ON COLUMN "WAR01"."WAREHID" IS 'Primary key for the WAR01 table';
COMMENT ON COLUMN "WAR01"."WAREDES" IS 'The warehouse short description';
COMMENT ON COLUMN "WAR01"."WAREHUS" IS 'Standart created by column';
COMMENT ON COLUMN "WAR01"."WARDATE" IS 'Standart created on column';
COMMENT ON COLUMN "WAR01"."WARLUDB" IS 'Standart last updated by column';
COMMENT ON COLUMN "WAR01"."WARLUDO" IS 'Standart last updated on column';
COMMENT ON COLUMN "WAR01"."WARLADD" IS 'Foreign key to the address table (ADD01)';
COMMENT ON COLUMN "WAR01"."WARELEG" IS 'Foreign key to the legal entities table (LEG01)';

CREATE TABLE "PRO01"
(
  "PRODUCD" NUMBER(8,0) , -- Primary key column for the products table
  "PRODNUB" VARCHAR2(80) NOT NULL, -- Product code
  "PRODTNM" VARCHAR2(80) NOT NULL, -- Product name
  "PRODTDE" VARCHAR2(255), -- Product  description
  "PRODTLP" NUMBER(8,2) , -- Product current list price
  "PRODSIZ" VARCHAR2(5), -- Product size
  "PRODSUM" VARCHAR2(3), -- Size unit measure code
  "PRODWEI" NUMBER(8,0) , --  Product weight
  "PRODWUM" VARCHAR2(3) , -- Weight Unit Measure code
  "PRODCLA" VARCHAR2(3) , -- Product Class
  "PRODTST" VARCHAR2(1), -- Product status
  "PRODSSD" DATE , -- Product sell start date
  "PRODSED" DATE , -- Product sell end date
  "PRODDAT" DATE ,  -- Product discontinued date
  "PRODTUS" VARCHAR2(80), -- Standart  created by column
  "PRODTDT" DATE DEFAULT SYSDATE, -- Standart created on column
  "PRODTUP" VARCHAR2(80), -- Standart  updated by column
  "PRODTUD" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "PRODTSF" NUMBER(8,0), -- Foreign key to the product sub-family table (PSF01) 
  CONSTRAINT "PRO01_PRODUCD_PK" PRIMARY KEY ("PRODUCD")
);

COMMENT ON TABLE "PRO01" IS 'Products master data table';
COMMENT ON COLUMN "PRO01"."PRODUCD" IS 'Primary key column for the products table';
COMMENT ON COLUMN "PRO01"."PRODNUB" IS 'The product code';
COMMENT ON COLUMN "PRO01"."PRODTNM" IS 'The product name';
COMMENT ON COLUMN "PRO01"."PRODTDE" IS 'The product description';
COMMENT ON COLUMN "PRO01"."PRODTLP" IS 'The product current list price';
COMMENT ON COLUMN "PRO01"."PRODSIZ" IS 'The product size';
COMMENT ON COLUMN "PRO01"."PRODSUM" IS 'The size unit measure code';
COMMENT ON COLUMN "PRO01"."PRODWEI" IS 'The product weight';
COMMENT ON COLUMN "PRO01"."PRODWUM" IS 'The weight unit measure code';
COMMENT ON COLUMN "PRO01"."PRODCLA" IS 'The product class';
COMMENT ON COLUMN "PRO01"."PRODTST" IS 'The product status';
COMMENT ON COLUMN "PRO01"."PRODSSD" IS 'The product sell start date';
COMMENT ON COLUMN "PRO01"."PRODSED" IS 'The product sell end date';
COMMENT ON COLUMN "PRO01"."PRODDAT" IS 'The product discontinued date';
COMMENT ON COLUMN "PRO01"."PRODTUS" IS 'The standart created by column';
COMMENT ON COLUMN "PRO01"."PRODTDT" IS 'The standart created on column';
COMMENT ON COLUMN "PRO01"."PRODTUP" IS 'The standart updated by column';
COMMENT ON COLUMN "PRO01"."PRODTUD" IS 'The standart last updated on column';
COMMENT ON COLUMN "PRO01"."PRODTSF" IS 'The foreign key to the product sub-family table (PSF01)';

/* Foreign keys */

ALTER TABLE "PFA01" ADD  CONSTRAINT "PFA01_LEG01_FK" FOREIGN KEY("PFALEGA")
REFERENCES "LEG01" ("LEGALID")
;
ALTER TABLE "PSF01" ADD  CONSTRAINT "PSF01_PFA01_FK" FOREIGN KEY("PSFPFFK")
REFERENCES "PFA01" ("PFATSID")
;
ALTER TABLE "WAR01" ADD  CONSTRAINT "WAR01_ADD01_FK" FOREIGN KEY("WARLADD")
REFERENCES "ADD01" ("ADDREID")
;
ALTER TABLE "WAR01" ADD  CONSTRAINT "WAR01_LEG01_FK" FOREIGN KEY("WARELEG")
REFERENCES "LEG01" ("LEGALID")
;
ALTER TABLE "PRO01" ADD  CONSTRAINT "PRO01_PSF01_FK" FOREIGN KEY("PRODTSF")
REFERENCES "PSF01" ("PSFTSID")
;

/************************************************************
           CBA Business Partners (BP) Schema Objects 
*************************************************************/


/* Tables */
/*
CREATE TABLE "VEN01"
(
  "VENDSID" NUMBER(8,0), -- Primary key for the VEN01 table
  "VENCODE" VARCHAR2(20) NOT NULL, -- The vendor's code
  "VENNAME" VARCHAR2(80) NOT NULL, -- The vendor's company name
  "VENCBUS" VARCHAR2(80) , -- Standart created by column
  "VENDATE" DATE DEFAULT SYSDATE, -- Standart created on column
  "VENLUDB" VARCHAR2(80) , -- Standart last updated by column
  "VENLUDO" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "VENACCO" NUMBER(8,0), --Foreign key to the G/L accounts table (ACC01) 
  "VENLEGA" NUMBER(8,0), --Foreign key to the legal entities table (LEG01) 
  CONSTRAINT "VEN01_VENDSID_PK" PRIMARY KEY ("VENDSID")
);

COMMENT ON TABLE "VEN01" IS 'The vendors mater list table';
COMMENT ON COLUMN "VEN01"."VENDSID" IS 'Primary key for the VEN01 table';
COMMENT ON COLUMN "VEN01"."VENCODE" IS 'The vendor''s code';
COMMENT ON COLUMN "VEN01"."VENNAME" IS 'The vendor''s name';
COMMENT ON COLUMN "VEN01"."VENCBUS" IS 'Standart created by column';
COMMENT ON COLUMN "VEN01"."VENDATE" IS 'Standart created on column';
COMMENT ON COLUMN "VEN01"."VENLUDB" IS 'Standart last updated by column';
COMMENT ON COLUMN "VEN01"."VENLUDO" IS 'Standart last updated on column';
COMMENT ON COLUMN "VEN01"."VENACCO" IS 'Foreign key to the G/L accounts table (ACC01)';
COMMENT ON COLUMN "VEN01"."VENLEGA" IS 'Foreign key to the legal entities table (LEG01)';


CREATE TABLE "CUS01"
(
  "CUSTSID" NUMBER(8,0), -- Primary key for the CUS01 table
  "CUSTCOD" VARCHAR2(20) NOT NULL, -- The customer's code
  "CUSTNAM" VARCHAR2(80) NOT NULL, -- The customer's company name
  "CUSTOUS" VARCHAR2(80), -- Standart created by column
  "CUSTDAT" DATE DEFAULT SYSDATE, -- Standart created on column
  "CUSTUDB" VARCHAR2(80), -- Standart last updated by column
  "CUSTUDO" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "CUSTACC" NUMBER(8,0), --Foreign key to the G/L accounts table (ACC01) 
  "CUSTLEG" NUMBER(8,0), --Foreign key to the legal entities (LEG01) 
  CONSTRAINT "CUS01_CUSTSID_PK" PRIMARY KEY ("CUSTSID")
);

COMMENT ON TABLE "CUS01" IS 'The customers mater data table';
COMMENT ON COLUMN "CUS01"."CUSTSID" IS 'Primary key for the CUS01 table';
COMMENT ON COLUMN "CUS01"."CUSTCOD" IS 'The customer''s code';
COMMENT ON COLUMN "CUS01"."CUSTNAM" IS 'The customer''s company name';
COMMENT ON COLUMN "CUS01"."CUSTOUS" IS 'Standart created by column';
COMMENT ON COLUMN "CUS01"."CUSTDAT" IS 'Standart created on column';
COMMENT ON COLUMN "CUS01"."CUSTUDB" IS 'Standart last updated by column';
COMMENT ON COLUMN "CUS01"."CUSTUDO" IS 'Standart last updated on column';
COMMENT ON COLUMN "CUS01"."CUSTACC" IS 'Foreign key to the G/L accounts table (ACC01)';
COMMENT ON COLUMN "CUS01"."CUSTLEG" IS 'Foreign key to the legal entities (LEG01)';
*/

CREATE TABLE "BPA01"
(
  "BUSIPID" NUMBER(8,0), -- Primary key for the BPA01 table
  "BUSICOD" VARCHAR2(20) NOT NULL, -- The business partner's code
  "BUSINAM" VARCHAR2(80) NOT NULL, -- The business partner's name
  "BUSITYP" VARCHAR2(20) NOT NULL, -- The business partner type
  "BUSIOUS" VARCHAR2(80), -- Standart created by column
  "BUSIDAT" DATE DEFAULT SYSDATE, -- Standart created on column
  "BUSIUDB" VARCHAR2(80), -- Standart last updated by column
  "BUSIUDO" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "BUSTLEG" NUMBER(8,0), --Foreign key to the legal entities (LEG01) 
  CONSTRAINT "BPA01_BUSIPID_PK" PRIMARY KEY ("BUSIPID")
);

COMMENT ON TABLE "BPA01" IS 'The business parteners mater data table';
COMMENT ON COLUMN "BPA01"."BUSIPID" IS 'Primary key for the BPA01 table';
COMMENT ON COLUMN "BPA01"."BUSICOD" IS 'The business partner''s code';
COMMENT ON COLUMN "BPA01"."BUSINAM" IS 'The business partner''s name';
COMMENT ON COLUMN "BPA01"."BUSITYP" IS 'The business partner type';
COMMENT ON COLUMN "BPA01"."BUSIOUS" IS 'Standart created by column';
COMMENT ON COLUMN "BPA01"."BUSIDAT" IS 'Standart created on column';
COMMENT ON COLUMN "BPA01"."BUSIUDB" IS 'Standart last updated by column';
COMMENT ON COLUMN "BPA01"."BUSIUDO" IS 'Standart last updated on column';
COMMENT ON COLUMN "BPA01"."BUSTLEG" IS 'Foreign key to the legal entities (LEG01)';

CREATE TABLE "BPD01"
(
  "BPDREID" NUMBER(8,0) NOT NULL, -- Primary key column for the BPD01 table
  "BPDRCIT" VARCHAR2(50) NOT NULL, -- Business partner address city
  "BPDRSTR" VARCHAR2(50) NOT NULL, -- Business partner address street
  "BPDRSTA" VARCHAR2(200) NOT NULL, -- Business partner address state/region
  "BPDRTYP" VARCHAR2(50), -- Business partner address type (shipping or billing)
  "BPDRUSR" VARCHAR2(80), -- Standart  created by column
  "BPDRDAT" DATE DEFAULT SYSDATE, -- Standart created on column
  "BPDRUUS" VARCHAR2(80), -- Standart  last updated by column
  "BPDRUAT" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "BPDRCOU" VARCHAR2(50) NOT NULL, -- Foreign key to the countries table (TER01)
  "BPDRBPI" NUMBER(8,0) NOT NULL, -- Foreign key to the business partners table (BPA01)
  CONSTRAINT "BPD01_BPDREID_PK" PRIMARY KEY ("BPDREID")

);

COMMENT ON TABLE "BPD01" IS 'Business partners address table';
COMMENT ON COLUMN "BPD01"."BPDREID" IS 'Primary key column for the BPD01 table';
COMMENT ON COLUMN "BPD01"."BPDRCIT" IS 'Business partner address city';
COMMENT ON COLUMN "BPD01"."BPDRSTR" IS 'Business partner address street';
COMMENT ON COLUMN "BPD01"."BPDRSTA" IS 'Business partner address state/region';
COMMENT ON COLUMN "BPD01"."BPDRTYP" IS 'Business partner address type (shipping or billing)';
COMMENT ON COLUMN "BPD01"."BPDRUSR" IS 'Standart  created by column';
COMMENT ON COLUMN "BPD01"."BPDRDAT" IS 'Standart created on column';
COMMENT ON COLUMN "BPD01"."BPDRUUS" IS 'Standart  last updated by column';
COMMENT ON COLUMN "BPD01"."BPDRUAT" IS 'Standart last updated on column';
COMMENT ON COLUMN "BPD01"."BPDRCOU" IS 'Foreign key to the countries table (TER01)';
COMMENT ON COLUMN "BPD01"."BPDRBPI" IS 'Foreign key to the business partners table (BPA01)';

ALTER TABLE "BPA01" ADD  CONSTRAINT "BPA01_LEG01_FK" FOREIGN KEY("BUSTLEG")
REFERENCES "LEG01" ("LEGALID")
;
ALTER TABLE "BPD01" ADD  CONSTRAINT "BPD01_BPA01_FK" FOREIGN KEY("BPDRBPI")
REFERENCES "BPA01" ("BUSIPID")
;
/*
ALTER TABLE "VEN01" ADD  CONSTRAINT "VEN01_ACC01_FK" FOREIGN KEY("VENACCO")
REFERENCES "ACC01" ("ACCNTCD")
;

ALTER TABLE "VEN01" ADD  CONSTRAINT "VEN01_LEG01_FK" FOREIGN KEY("VENLEGA")
REFERENCES "LEG01" ("LEGALID")
;
ALTER TABLE "CUS01" ADD  CONSTRAINT "CUS01_ACC01_FK" FOREIGN KEY("CUSTACC")
REFERENCES "ACC01" ("ACCNTCD")
;
ALTER TABLE "CUS01" ADD  CONSTRAINT "CUS01_ORG01_FK" FOREIGN KEY("CUSTLEG")
REFERENCES "LEG01" ("LEGALID")
;
*/
/************************************************************
           CBA Accounts Payable (AP) Schema Objects 
*************************************************************/

CREATE TABLE "RFQ01"
(
  "RFQPKID" NUMBER(8,0) NOT NULL , -- Primary key column for the RFQ01 table
  "RFQDOCN" GENERATED ALWAYS AS ('RFQ'  || "RFQPKID") VIRTUAL, -- Request for quote docment id
  "RFQDATE" DATE, -- Request for quote docment date
  "RFQSTAT" VARCHAR2(20), -- Request for quote document status
  "RFQNOTE" VARCHAR2(255), -- Request for quote note
  "RFQGROS" NUMBER(8,2), -- Total gross amount
  "RFQDISC" NUMBER(8,2), -- Total discount amount
  "RFQTAXE" NUMBER(8,2), -- Total tax amount
  "RFQNETA" NUMBER(8,2), -- Total net to pay amount
  "RFQRNUS" VARCHAR2(80), -- Standart created by column
  "RFQRNDA" DATE DEFAULT SYSDATE, -- Standart created on column
  "RFQRNUU" VARCHAR2(80), -- Standart last updated by column
  "RFQRNUD" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "RFQLEGA" NUMBER (8,0), -- Foreign key to the legal entities table (LEG01)  
  "RFQBPAR" NUMBER (8,0), -- Foreign key to the business partners table (BPA01)
  "RFQPERI" NUMBER (8,0), -- Foreign key to the periods table (PER01)
  "RFQDOTY" NUMBER (8,0), -- Foreign key to the documents type table (DOC01)
  CONSTRAINT "RFQ01_RFQPKID_PK" PRIMARY KEY ("RFQPKID")

);

COMMENT ON TABLE "RFQ01" IS 'Request for quote document header table';
COMMENT ON COLUMN "RFQ01"."RFQPKID" IS 'Primary key column for the RFQ01 table';
COMMENT ON COLUMN "RFQ01"."RFQDOCN" IS 'Request for quote docment id';
COMMENT ON COLUMN "RFQ01"."RFQDATE" IS 'Request for quote docment date';
COMMENT ON COLUMN "RFQ01"."RFQSTAT" IS 'Request for quote document status';
COMMENT ON COLUMN "RFQ01"."RFQNOTE" IS 'Request for quote note';
COMMENT ON COLUMN "RFQ01"."RFQGROS" IS 'Total gross amount';
COMMENT ON COLUMN "RFQ01"."RFQDISC" IS 'Total discount amount';
COMMENT ON COLUMN "RFQ01"."RFQTAXE" IS 'Total tax amount';
COMMENT ON COLUMN "RFQ01"."RFQNETA" IS 'Total net to pay amount';
COMMENT ON COLUMN "RFQ01"."RFQRNUS" IS 'Standart created by column';
COMMENT ON COLUMN "RFQ01"."RFQRNDA" IS 'Standart created on column';
COMMENT ON COLUMN "RFQ01"."RFQRNUU" IS 'Standart last updated by column';
COMMENT ON COLUMN "RFQ01"."RFQRNUD" IS 'Standart last updated on column';
COMMENT ON COLUMN "RFQ01"."RFQLEGA" IS 'Foreign key to the legal entities table (LEG01)';
COMMENT ON COLUMN "RFQ01"."RFQBPAR" IS 'Foreign key to the business partners table (BPA01)';
COMMENT ON COLUMN "RFQ01"."RFQPERI" IS 'Foreign key to the periods table (PER01)';
COMMENT ON COLUMN "RFQ01"."RFQDOTY" IS 'Foreign key to the documents type table (DOC01)';

CREATE TABLE "RFL01"
(
  "RFLLIID" NUMBER(8,0) NOT NULL, -- Part of the composite primary key of the RFL01 table
  "RFLRFQI" NUMBER(8,0) NOT NULL, -- Foreign key that reference the request for quote headers (RFQ01) table, also primary key
  "RFLLQUA" NUMBER(8,0) NOT NULL, -- Product quantity
  "RFLLPRI" NUMBER(8,2) NOT NULL, -- Product price
  "RFLLUSR" VARCHAR2(80), -- Standart  created by column
  "RFLLDAT" DATE DEFAULT SYSDATE, -- Standart  created on column
  "RFLLIUS" VARCHAR2(80), -- Standart  last updated by column
  "RFLLIDA" DATE DEFAULT SYSDATE, -- Standart  last updated on column
  "RFLLPRO" NUMBER(8,0), -- Foreign key to the products table (PRO01)
  "RFLTAID" NUMBER(8,0), -- Foreign key to the taxes table (TAX01)
  "RFLLLTO" NUMBER GENERATED ALWAYS AS ("RFLLQUA"*"RFLLPRI") VIRTUAL ,  -- Line gross amount
  "RFLDISC" NUMBER(8,2), -- Line discount amount
  "RFLTAXE" NUMBER(8,2), -- Line tax amount
  "RFLNETA" NUMBER(8,2), -- Line net to pay amount
  CONSTRAINT "RFL01_RFLLIID_RFLRFQI_PK" PRIMARY KEY ("RFLLIID", "RFLRFQI")
);

COMMENT ON TABLE "RFL01" IS 'Request for quotes details table';
COMMENT ON COLUMN "RFL01"."RFLLIID" IS 'Part of the composite primary key of the RFL01 table';
COMMENT ON COLUMN "RFL01"."RFLRFQI" IS 'Foreign key that reference the request for quote headers (RFQ01) table, also primary key';
COMMENT ON COLUMN "RFL01"."RFLLQUA" IS 'Desired quantity';
COMMENT ON COLUMN "RFL01"."RFLLPRI" IS 'Product price';
COMMENT ON COLUMN "RFL01"."RFLLUSR" IS 'Standart created by column';
COMMENT ON COLUMN "RFL01"."RFLLDAT" IS 'Standart created on column';
COMMENT ON COLUMN "RFL01"."RFLLIUS" IS 'Standart last updated by column';
COMMENT ON COLUMN "RFL01"."RFLLIDA" IS 'Standart last updated on column';
COMMENT ON COLUMN "RFL01"."RFLLPRO" IS 'Foreign key to the products table (PRO01)';
COMMENT ON COLUMN "RFL01"."RFLTAID" IS 'Foreign key to the taxes table (TAX01)';
COMMENT ON COLUMN "RFL01"."RFLLLTO" IS 'Line gross amount';
COMMENT ON COLUMN "RFL01"."RFLDISC" IS 'Line discount amount';
COMMENT ON COLUMN "RFL01"."RFLTAXE" IS 'Line tax amount';
COMMENT ON COLUMN "RFL01"."RFLNETA" IS 'Line net to pay amount';

/*
CREATE TABLE "POH01"
(
  "POHRNID" NUMBER(8,0) NOT NULL , -- Primary key column for the POH01 table
  "POHSTAT" VARCHAR2(20), -- Purchase order status
  "POHRNUS" VARCHAR2(80), -- Standart created by column
  "POHRNDA" DATE DEFAULT SYSDATE, -- Standart created on column
  "POHRNUU" VARCHAR2(80), -- Standart last updated by column
  "POHRNUD" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "POHLEGA" NUMBER (8,0), -- Foreign key to the legal entities table (LEG01)  
  "POHVEND" NUMBER (8,0), -- Foreign key to the vendors table (VEN01)
  CONSTRAINT "POH01_POHRNID_PK" PRIMARY KEY ("POHRNID")

);

COMMENT ON TABLE "POH01" IS 'Purchase order document header table';
COMMENT ON COLUMN "POH01"."POHRNID" IS 'Primary key column for the POH01 table';
COMMENT ON COLUMN "POH01"."POHSTAT" IS 'Purchase order status';
COMMENT ON COLUMN "POH01"."POHRNUS" IS 'Standart created by column';
COMMENT ON COLUMN "POH01"."POHRNDA" IS 'Standart created on column';
COMMENT ON COLUMN "POH01"."POHRNUU" IS 'Standart last updated by column';
COMMENT ON COLUMN "POH01"."POHRNUD" IS 'Standart last updated on column';
COMMENT ON COLUMN "POH01"."POHLEGA" IS 'Foreign key to the legal entities table (LEG01)';
COMMENT ON COLUMN "POH01"."POHVEND" IS 'Foreign key to the vendors table (VEN01)';
*/

CREATE TABLE "POR01"
(
  "PORRNID" NUMBER(8,0) NOT NULL , -- Primary key column for the POR01 table
  "PORDOCN" GENERATED ALWAYS AS ('PO'  || "PORRNID") VIRTUAL, -- Purchase order docment id
  "PORDATE" DATE, -- Purchase order docment date
  "PORSTAT" VARCHAR2(20), -- Purchase order document status
  "PORORIG" VARCHAR2(20), -- Purchase order document origin
  "PORORTY" NUMBER (8,0), -- Purchase order document origin type
  "PORNOTE" VARCHAR2(255), -- Purchase order note
  "PORGROS" NUMBER(8,2), -- Total gross amount
  "PORDISC" NUMBER(8,2), -- Total discount amount
  "PORTAXE" NUMBER(8,2), -- Total tax amount
  "PORNETA" NUMBER(8,2), -- Total net to pay amount
  "PORRNUS" VARCHAR2(80), -- Standart created by column
  "PORRNDA" DATE DEFAULT SYSDATE, -- Standart created on column
  "PORRNUU" VARCHAR2(80), -- Standart last updated by column
  "PORRNUD" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "PORLEGA" NUMBER (8,0), -- Foreign key to the legal entities table (LEG01)  
  "PORBPAR" NUMBER (8,0), -- Foreign key to the business partners table (BPA01)
  "PORPERI" NUMBER (8,0), -- Foreign key to the periods table (PER01)
  "PORDOTY" NUMBER (8,0), -- Foreign key to the documents type table (DOC01)
  CONSTRAINT "POR01_PORRNID_PK" PRIMARY KEY ("PORRNID")

);

COMMENT ON TABLE "POR01" IS 'Purchase order document header table';
COMMENT ON COLUMN "POR01"."PORRNID" IS 'Primary key column for the POR01 table';
COMMENT ON COLUMN "POR01"."PORDOCN" IS 'Purchase order docment id';
COMMENT ON COLUMN "POR01"."PORDATE" IS 'Purchase order docment date';
COMMENT ON COLUMN "POR01"."PORSTAT" IS 'Purchase order document status';
COMMENT ON COLUMN "POR01"."PORORIG" IS 'Purchase order document origin';
COMMENT ON COLUMN "POR01"."PORORTY" IS 'Purchase order document origin type';
COMMENT ON COLUMN "POR01"."PORNOTE" IS 'Purchase order note';
COMMENT ON COLUMN "POR01"."PORGROS" IS 'Total gross amount';
COMMENT ON COLUMN "POR01"."PORDISC" IS 'Total discount amount';
COMMENT ON COLUMN "POR01"."PORTAXE" IS 'Total tax amount';
COMMENT ON COLUMN "POR01"."PORNETA" IS 'Total net to pay amount';
COMMENT ON COLUMN "POR01"."PORRNUS" IS 'Standart created by column';
COMMENT ON COLUMN "POR01"."PORRNDA" IS 'Standart created on column';
COMMENT ON COLUMN "POR01"."PORRNUU" IS 'Standart last updated by column';
COMMENT ON COLUMN "POR01"."PORRNUD" IS 'Standart last updated on column';
COMMENT ON COLUMN "POR01"."PORLEGA" IS 'Foreign key to the legal entities table (LEG01)';
COMMENT ON COLUMN "POR01"."PORBPAR" IS 'Foreign key to the business partners table (BPA01)';
COMMENT ON COLUMN "POR01"."PORPERI" IS 'Foreign key to the periods table (PER01)';
COMMENT ON COLUMN "POR01"."PORDOTY" IS 'Foreign key to the documents type table (DOC01)';

CREATE TABLE "POL01"
(
  "POLLIID" NUMBER(8,0) NOT NULL, -- Part of the composite primary key of the POL01 table.
  "POLLIPO" NUMBER(8,0) NOT NULL, -- Foreign key that reference the purchase orders headers (POR01) table, also primary key
  "POLLQUA" NUMBER(8,0) NOT NULL, -- Product quantity
  "POLLPRI" NUMBER(8,2) NOT NULL, -- Product price
  "POLLUSR" VARCHAR2(80), -- Standart  created by column
  "POLLDAT" DATE DEFAULT SYSDATE, -- Standart  created on column
  "POLLIUS" VARCHAR2(80), -- Standart  last updated by column
  "POLLIDA" DATE DEFAULT SYSDATE, -- Standart  last updated on column
  "POLLPRO" NUMBER(8,0), -- Foreign key to the products table (PRO01)
  "POLTAID" NUMBER(8,0), -- Foreign key to the taxes table (TAX01)
  "POLLLTO" NUMBER GENERATED ALWAYS AS ("POLLQUA"*"POLLPRI") VIRTUAL ,  -- Line gross amount
  "POLDISC" NUMBER(8,2), -- Line discount amount
  "POLTAXE" NUMBER(8,2), -- Line tax amount
  "POLNETA" NUMBER(8,2), -- Line net to pay amount
  CONSTRAINT "POL01_POLLIID_POLLIPO_PK" PRIMARY KEY ("POLLIID", "POLLIPO")
);

COMMENT ON TABLE "POL01" IS 'Purchase order details table';
COMMENT ON COLUMN "POL01"."POLLIID" IS 'Part of the composite primary key of the POL01 table';
COMMENT ON COLUMN "POL01"."POLLIPO" IS 'Foreign key that reference the purchase orders headers (POR01) table, also primary key';
COMMENT ON COLUMN "POL01"."POLLQUA" IS 'Ordered quantity';
COMMENT ON COLUMN "POL01"."POLLPRI" IS 'Product price';
COMMENT ON COLUMN "POL01"."POLLUSR" IS 'Standart created by column';
COMMENT ON COLUMN "POL01"."POLLDAT" IS 'Standart created on column';
COMMENT ON COLUMN "POL01"."POLLIUS" IS 'Standart last updated by column';
COMMENT ON COLUMN "POL01"."POLLIDA" IS 'Standart last updated on column';
COMMENT ON COLUMN "POL01"."POLLPRO" IS 'Foreign key to the products table (PRO01)';
COMMENT ON COLUMN "POL01"."POLTAID" IS 'Foreign key to the taxes table (TAX01)';
COMMENT ON COLUMN "POL01"."POLLLTO" IS 'Line gross amount';
COMMENT ON COLUMN "POL01"."POLDISC" IS 'Line discount amount';
COMMENT ON COLUMN "POL01"."POLTAXE" IS 'Line tax amount';
COMMENT ON COLUMN "POL01"."POLNETA" IS 'Line net to pay amount';

CREATE TABLE "GOR01"
(
  "GORERID" NUMBER(8,0) NOT NULL , -- Primary key column for the GOR01 table
  "GORDOCN" GENERATED ALWAYS AS ('GR'  || "GORERID") VIRTUAL, -- Goods receipt docment id
  "GORDODA" DATE, -- Goods receipt docment date  
  "GORSTAT" VARCHAR2(20), -- Goods receipt status
  "GORORIG" VARCHAR2(20), -- Goods receipt document origin
  "GORORTY" NUMBER (8,0), -- Goods receipt document origin type
  "GORNOTE" VARCHAR2(255), -- Goods receipt note
  "GORGROS" NUMBER(8,2), -- Total gross amount
  "GORDISC" NUMBER(8,2), -- Total discount amount
  "GORTAXE" NUMBER(8,2), -- Total tax amount
  "GORNETA" NUMBER(8,2), -- Total net to pay amount
  "GORRNUS" VARCHAR2(80), -- Standart created by column
  "GORRNDA" DATE DEFAULT SYSDATE, -- Standart created on column
  "GORRNUU" VARCHAR2(80), -- Standart last updated by column
  "GORRNUD" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "GORLEGA" NUMBER (8,0), -- Foreign key to the legal entities table (LEG01)  
  "GORBPAR" NUMBER (8,0), -- Foreign key to the business partners table (BPA01)
  "GORPERI" NUMBER (8,0), -- Foreign key to the periods table (PER01)
  "GORDOTY" NUMBER (8,0), -- Foreign key to the documents type table (DOC01)
  CONSTRAINT "GOR01_GORERID_PK" PRIMARY KEY ("GORERID")

);

COMMENT ON TABLE "GOR01" IS 'Goods receipt order document header table';
COMMENT ON COLUMN "GOR01"."GORERID" IS 'Primary key column for the GOR01 table';
COMMENT ON COLUMN "GOR01"."GORDOCN" IS 'Goods receipt docment id';
COMMENT ON COLUMN "GOR01"."GORDODA" IS 'Goods receipt docment date';
COMMENT ON COLUMN "GOR01"."GORSTAT" IS 'Goods receipt status';
COMMENT ON COLUMN "GOR01"."GORORIG" IS 'Goods receipt document origin';
COMMENT ON COLUMN "GOR01"."GORORIG" IS 'Goods receipt document origin type';
COMMENT ON COLUMN "GOR01"."GORNOTE" IS 'Goods receipt note';
COMMENT ON COLUMN "GOR01"."GORGROS" IS 'Total gross amount';
COMMENT ON COLUMN "GOR01"."GORDISC" IS 'Total discount amount';
COMMENT ON COLUMN "GOR01"."GORTAXE" IS 'Total tax amount';
COMMENT ON COLUMN "GOR01"."GORNETA" IS 'Total net to pay amount';
COMMENT ON COLUMN "GOR01"."GORRNUS" IS 'Standart created by column';
COMMENT ON COLUMN "GOR01"."GORRNDA" IS 'Standart created on column';
COMMENT ON COLUMN "GOR01"."GORRNUU" IS 'Standart last updated by column';
COMMENT ON COLUMN "GOR01"."GORRNUD" IS 'Standart last updated on column';
COMMENT ON COLUMN "GOR01"."GORLEGA" IS 'Foreign key to the legal entities table (LEG01)';
COMMENT ON COLUMN "GOR01"."GORBPAR" IS 'Foreign key to the business partners table (BPA01)';
COMMENT ON COLUMN "GOR01"."GORPERI" IS 'Foreign key to the periods table (PER01)';
COMMENT ON COLUMN "GOR01"."GORDOTY" IS 'Foreign key to the documents type table (DOC01)';

CREATE TABLE "GRL01"
(
  "GRLLIID" NUMBER(8,0) NOT NULL, -- Part of the composite primary key of the GRL01 table.
  "GRLLIGR" NUMBER(8,0) NOT NULL, -- Foreign key that reference the goods receipt headers (GOR01) table, also primary key
  "GRLLQUA" NUMBER(8,0) NOT NULL, -- Received quantity
  "GRLLPRI" NUMBER(8,2) NOT NULL, -- Product price
  "GRLLUSR" VARCHAR2(80), -- Standart  created by column
  "GRLLDAT" DATE DEFAULT SYSDATE, -- Standart  created on column
  "GRLLIUS" VARCHAR2(80), -- Standart  last updated by column
  "GRLLIDA" DATE DEFAULT SYSDATE, -- Standart  last updated on column
  "GRLLPRO" NUMBER(8,0), -- Foreign key to the products table (PRO01)
  "GRLTAID" NUMBER(8,0), -- Foreign key to the taxes table (TAX01)
  "GRLLWAR" NUMBER(8,0), -- Foreign key to the warehouse table (WAR01)
  "GRLLLTO" NUMBER GENERATED ALWAYS AS ("GRLLQUA"*"GRLLPRI") VIRTUAL ,  -- Line gross amount
  "GRLDISC" NUMBER(8,2), -- Line discount amount
  "GRLTAXE" NUMBER(8,2), -- Line tax amount
  "GRLNETA" NUMBER(8,2), -- Line net to pay amount
  CONSTRAINT "GRL01_GRLLIID_GRLLIGR_PK" PRIMARY KEY ("GRLLIID", "GRLLIGR")
);

COMMENT ON TABLE "GRL01" IS 'Goods receipt details table';
COMMENT ON COLUMN "GRL01"."GRLLIID" IS 'Part of the composite primary key of the GRL01 table';
COMMENT ON COLUMN "GRL01"."GRLLIGR" IS 'Foreign key that reference the goods receipt headers (GOR01) table, also primary key';
COMMENT ON COLUMN "GRL01"."GRLLQUA" IS 'Received quantity';
COMMENT ON COLUMN "GRL01"."GRLLPRI" IS 'Product price';
COMMENT ON COLUMN "GRL01"."GRLLUSR" IS 'Standart created by column';
COMMENT ON COLUMN "GRL01"."GRLLDAT" IS 'Standart created on column';
COMMENT ON COLUMN "GRL01"."GRLLIUS" IS 'Standart last updated by column';
COMMENT ON COLUMN "GRL01"."GRLLIDA" IS 'Standart last updated on column';
COMMENT ON COLUMN "GRL01"."GRLLPRO" IS 'Foreign key to the products table (PRO01)';
COMMENT ON COLUMN "GRL01"."GRLTAID" IS 'Foreign key to the products table (TAX01)';
COMMENT ON COLUMN "GRL01"."GRLLWAR" IS 'Foreign key to the warehouse table (WAR01)';
COMMENT ON COLUMN "GRL01"."GRLLLTO" IS 'Line gross amount';
COMMENT ON COLUMN "GRL01"."GRLDISC" IS 'Line discount amount';
COMMENT ON COLUMN "GRL01"."GRLTAXE" IS 'Line tax amount';
COMMENT ON COLUMN "GRL01"."GRLNETA" IS 'Line net to pay amount';

CREATE TABLE "BIL01"
(
  "BILLSID" NUMBER(8,0) NOT NULL , -- Primary key column for the BIL01 table
  "BILDOCN" GENERATED ALWAYS AS ('BI'  || "BILLSID") VIRTUAL, -- Bill docment id
  "BILDODA" DATE, -- Bill docment date  
  "BILDUDA" DATE, -- Bill due date 
  "BILSTAT" VARCHAR2(20), -- Bill document status
  "BILORIG" VARCHAR2(20), -- Bill document origin
  "BILORTY" NUMBER (8,0), -- Bill document origin type
  "BILNOTE" VARCHAR2(255), -- Bill document note
  "BILGROS" NUMBER(8,2), -- Total gross amount
  "BILDISC" NUMBER(8,2), -- Total discount amount
  "BILTAXE" NUMBER(8,2), -- Total tax amount
  "BILNETA" NUMBER(8,2), -- Total net to pay amount
  "BILRNUS" VARCHAR2(80), -- Standart created by column
  "BILRNDA" DATE DEFAULT SYSDATE, -- Standart created on column
  "BILRNUU" VARCHAR2(80), -- Standart last updated by column
  "BILRNUD" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "BILLEGA" NUMBER (8,0), -- Foreign key to the legal entities table (LEG01)  
  "BILBPAR" NUMBER (8,0), -- Foreign key to the business partners table (BPA01)
  "BILPERI" NUMBER (8,0), -- Foreign key to the periods table (PER01)
  "BILDOTY" NUMBER (8,0), -- Foreign key to the documents type table (DOC01)
  CONSTRAINT "BIL01_BILLSID_PK" PRIMARY KEY ("BILLSID")

);

COMMENT ON TABLE "BIL01" IS 'Bills document header table';
COMMENT ON COLUMN "BIL01"."BILLSID" IS 'Primary key column for the BIL01 table';
COMMENT ON COLUMN "BIL01"."BILDOCN" IS 'Bill docment id';
COMMENT ON COLUMN "BIL01"."BILDODA" IS 'Bill docment date';
COMMENT ON COLUMN "BIL01"."BILDUDA" IS 'Bill due date';
COMMENT ON COLUMN "BIL01"."BILSTAT" IS 'Bill document status';
COMMENT ON COLUMN "BIL01"."BILORIG" IS 'Bill document origin';
COMMENT ON COLUMN "BIL01"."BILORTY" IS 'Bill document origin type';
COMMENT ON COLUMN "BIL01"."BILNOTE" IS 'Bill document note';
COMMENT ON COLUMN "BIL01"."BILGROS" IS 'Total gross amount';
COMMENT ON COLUMN "BIL01"."BILDISC" IS 'Total discount amount';
COMMENT ON COLUMN "BIL01"."BILTAXE" IS 'Total tax amount';
COMMENT ON COLUMN "BIL01"."BILNETA" IS 'Total net to pay amount';
COMMENT ON COLUMN "BIL01"."BILRNUS" IS 'Standart created by column';
COMMENT ON COLUMN "BIL01"."BILRNDA" IS 'Standart created on column';
COMMENT ON COLUMN "BIL01"."BILRNUU" IS 'Standart last updated by column';
COMMENT ON COLUMN "BIL01"."BILRNUD" IS 'Standart last updated on column';
COMMENT ON COLUMN "BIL01"."BILLEGA" IS 'Foreign key to the legal entities table (LEG01)';
COMMENT ON COLUMN "BIL01"."BILBPAR" IS 'Foreign key to the business partners table (BPA01)';
COMMENT ON COLUMN "BIL01"."BILPERI" IS 'Foreign key to the periods table (PER01)';
COMMENT ON COLUMN "BIL01"."BILDOTY" IS 'Foreign key to the documents type table (DOC01)';

CREATE TABLE "BLI01"
(
  "BLILIID" NUMBER(8,0) NOT NULL, -- Part of the composite primary key of the BLI1 table.
  "BLILIBI" NUMBER(8,0) NOT NULL, -- Foreign key that reference the bills headers (BIL01) table, also primary key
  "BLILQUA" NUMBER(8,0) NOT NULL, -- Product quantity
  "BLILPRI" NUMBER(8,2) NOT NULL, -- Product price
  "BLILUSR" VARCHAR2(80), -- Standart  created by column
  "BLILDAT" DATE DEFAULT SYSDATE, -- Standart  created on column
  "BLILIUS" VARCHAR2(80), -- Standart  last updated by column
  "BLILIDA" DATE DEFAULT SYSDATE, -- Standart  last updated on column
  "BLILPRO" NUMBER(8,0), -- Foreign key to the products table (PRO01)
  "BLITAID" NUMBER(8,0), -- Foreign key to the taxes table (TAX01)
  "BLILLTO" NUMBER GENERATED ALWAYS AS ("BLILQUA"*"BLILPRI") VIRTUAL ,  -- Line gross amount
  "BLIDISC" NUMBER(8,2), -- Line discount amount
  "BLITAXE" NUMBER(8,2), -- Line tax amount
  "BLINETA" NUMBER(8,2), -- Line net to pay amount
  CONSTRAINT "BLI01_BLILIID_BLILIBI_PK" PRIMARY KEY ("BLILIID", "BLILIBI")
);

COMMENT ON TABLE "BLI01" IS 'Bills details table';
COMMENT ON COLUMN "BLI01"."BLILIID" IS 'Part of the composite primary key of the BLI1 table';
COMMENT ON COLUMN "BLI01"."BLILIBI" IS 'Foreign key that reference the bills headers (BIL01) table, also primary key';
COMMENT ON COLUMN "BLI01"."BLILQUA" IS 'Product quantity';
COMMENT ON COLUMN "BLI01"."BLILPRI" IS 'Product price';
COMMENT ON COLUMN "BLI01"."BLILUSR" IS 'Standart created by column';
COMMENT ON COLUMN "BLI01"."BLILDAT" IS 'Standart created on column';
COMMENT ON COLUMN "BLI01"."BLILIUS" IS 'Standart last updated by column';
COMMENT ON COLUMN "BLI01"."BLILIDA" IS 'Standart last updated on column';
COMMENT ON COLUMN "BLI01"."BLILPRO" IS 'Foreign key to the products table (PRO01)';
COMMENT ON COLUMN "BLI01"."BLITAID" IS 'Foreign key to the products table (TAX01)';
COMMENT ON COLUMN "BLI01"."BLILLTO" IS 'Line gross amount';
COMMENT ON COLUMN "BLI01"."BLIDISC" IS 'Line discount amount';
COMMENT ON COLUMN "BLI01"."BLITAXE" IS 'Line tax amount';
COMMENT ON COLUMN "BLI01"."BLINETA" IS 'Line net to pay amount';


/*Foreign keys*/

ALTER TABLE "RFQ01" ADD  CONSTRAINT "RFQ01_LEG01_FK" FOREIGN KEY("RFQLEGA")
REFERENCES "LEG01" ("LEGALID")
;
ALTER TABLE "RFQ01" ADD  CONSTRAINT "RFQ01_BPA01_FK" FOREIGN KEY("RFQBPAR")
REFERENCES "BPA01" ("BUSIPID")
;
ALTER TABLE "RFQ01" ADD  CONSTRAINT "RFQ01_PER01_FK" FOREIGN KEY("RFQPERI")
REFERENCES "PER01" ("PERIODI")
;
ALTER TABLE "RFQ01" ADD  CONSTRAINT "RFQ01_DOC01_FK" FOREIGN KEY("RFQDOTY")
REFERENCES "DOC01" ("DOCTYID")
;
ALTER TABLE "RFL01" ADD  CONSTRAINT "RFL01_RFQ01_FK" FOREIGN KEY("RFLRFQI")
REFERENCES "RFQ01" ("RFQPKID")
;
ALTER TABLE "RFL01" ADD  CONSTRAINT "RFL01_PRO01_FK" FOREIGN KEY("RFLLPRO")
REFERENCES "PRO01" ("PRODUCD")
;
ALTER TABLE "POR01" ADD  CONSTRAINT "POR01_LEG01_FK" FOREIGN KEY("PORLEGA")
REFERENCES "LEG01" ("LEGALID")
;
ALTER TABLE "POR01" ADD  CONSTRAINT "POR01_BPA01_FK" FOREIGN KEY("PORBPAR")
REFERENCES "BPA01" ("BUSIPID")
;
ALTER TABLE "POR01" ADD  CONSTRAINT "POR01_PER01_FK" FOREIGN KEY("PORPERI")
REFERENCES "PER01" ("PERIODI")
;
ALTER TABLE "POR01" ADD  CONSTRAINT "POR01_DOC01_FK" FOREIGN KEY("PORDOTY")
REFERENCES "DOC01" ("DOCTYID")
;
ALTER TABLE "POL01" ADD  CONSTRAINT "POL01_POR01_FK" FOREIGN KEY("POLLIPO")
REFERENCES "POR01" ("PORRNID")
;
ALTER TABLE "POL01" ADD  CONSTRAINT "POL01_PRO01_FK" FOREIGN KEY("POLLPRO")
REFERENCES "PRO01" ("PRODUCD")
;

/*
ALTER TABLE "POH01" ADD  CONSTRAINT "POH01_LEG01_FK" FOREIGN KEY("POHLEGA")
REFERENCES "LEG01" ("LEGALID")
;
*/
ALTER TABLE "GOR01" ADD  CONSTRAINT "GOR01_LEG01_FK" FOREIGN KEY("GORLEGA")
REFERENCES "LEG01" ("LEGALID")
;
ALTER TABLE "GOR01" ADD  CONSTRAINT "GOR01_BPA01_FK" FOREIGN KEY("GORBPAR")
REFERENCES "BPA01" ("BUSIPID")
;
ALTER TABLE "GOR01" ADD  CONSTRAINT "GOR01_PER01_FK" FOREIGN KEY("GORPERI")
REFERENCES "PER01" ("PERIODI")
;
ALTER TABLE "GOR01" ADD  CONSTRAINT "GOR01_DOC01_FK" FOREIGN KEY("GORDOTY")
REFERENCES "DOC01" ("DOCTYID")
;
ALTER TABLE "GRL01" ADD  CONSTRAINT "GRL01_GOR01_FK" FOREIGN KEY("GRLLIGR")
REFERENCES "GOR01" ("GORERID")
;
ALTER TABLE "GRL01" ADD  CONSTRAINT "GRL01_PRO01_FK" FOREIGN KEY("GRLLPRO")
REFERENCES "PRO01" ("PRODUCD")
;
ALTER TABLE "BIL01" ADD  CONSTRAINT "BIL01_LEG01_FK" FOREIGN KEY("BILLEGA")
REFERENCES "LEG01" ("LEGALID")
;
ALTER TABLE "BIL01" ADD  CONSTRAINT "BIL01_BPA01_FK" FOREIGN KEY("BILBPAR")
REFERENCES "BPA01" ("BUSIPID")
;
ALTER TABLE "BIL01" ADD  CONSTRAINT "BIL01_PER01_FK" FOREIGN KEY("BILPERI")
REFERENCES "PER01" ("PERIODI")
;
ALTER TABLE "BIL01" ADD  CONSTRAINT "BIL01_DOC01_FK" FOREIGN KEY("BILDOTY")
REFERENCES "DOC01" ("DOCTYID")
;
ALTER TABLE "BLI01" ADD  CONSTRAINT "BLI01_BIL01_FK" FOREIGN KEY("BLILIBI")
REFERENCES "BIL01" ("BILLSID")
;
ALTER TABLE "BLI01" ADD  CONSTRAINT "BLI01_PRO01_FK" FOREIGN KEY("BLILPRO")
REFERENCES "PRO01" ("PRODUCD")
;


/************************************************************
           CBA Accounts Receivables Schema Objects 
*************************************************************/

/* Tables */

CREATE TABLE "QUO01"
(
  "QUOTEID" NUMBER(8,0) NOT NULL , -- Primary key column for the QUO01 table
  "QUODOCN" GENERATED ALWAYS AS ('QO'  || "QUOTEID") VIRTUAL, -- Quote docment id
  "QUODODA" DATE, -- Quote docment date  
  "QUOSTAT" VARCHAR2(20), -- Quote document status
  "QUONOTE" VARCHAR2(255), -- Quote document note
  "QUOGROS" NUMBER(8,2), -- Total gross amount
  "QUODISC" NUMBER(8,2), -- Total discount amount
  "QUOTAXE" NUMBER(8,2), -- Total tax amount
  "QUONETA" NUMBER(8,2), -- Total net to pay amount
  "QUORNUS" VARCHAR2(80), -- Standart created by column
  "QUORNDA" DATE DEFAULT SYSDATE, -- Standart created on column
  "QUORNUU" VARCHAR2(80), -- Standart last updated by column
  "QUORNUD" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "QUOLEGA" NUMBER (8,0), -- Foreign key to the legal entities table (LEG01)  
  "QUOBPAR" NUMBER (8,0), -- Foreign key to the business partners table (BPA01)
  "QUOPERI" NUMBER (8,0), -- Foreign key to the periods table (PER01)
  "QUODOTY" NUMBER (8,0), -- Foreign key to the documents type table (DOC01)
  CONSTRAINT "QUO01_QUOTEID_PK" PRIMARY KEY ("QUOTEID")

);

COMMENT ON TABLE "QUO01" IS 'Quotes document header table';
COMMENT ON COLUMN "QUO01"."QUOTEID" IS 'Primary key column for the QUO01 table';
COMMENT ON COLUMN "QUO01"."QUODOCN" IS 'Quote docment id';
COMMENT ON COLUMN "QUO01"."QUODODA" IS 'Quote docment date';
COMMENT ON COLUMN "QUO01"."QUOSTAT" IS 'Quote document status';
COMMENT ON COLUMN "QUO01"."QUONOTE" IS 'Quote document note';
COMMENT ON COLUMN "QUO01"."QUOGROS" IS 'Total gross amount';
COMMENT ON COLUMN "QUO01"."QUODISC" IS 'Total discount amount';
COMMENT ON COLUMN "QUO01"."QUOTAXE" IS 'Total tax amount';
COMMENT ON COLUMN "QUO01"."QUONETA" IS 'Total net to pay amount';
COMMENT ON COLUMN "QUO01"."QUORNUS" IS 'Standart created by column';
COMMENT ON COLUMN "QUO01"."QUORNDA" IS 'Standart created on column';
COMMENT ON COLUMN "QUO01"."QUORNUU" IS 'Standart last updated by column';
COMMENT ON COLUMN "QUO01"."QUORNUD" IS 'Standart last updated on column';
COMMENT ON COLUMN "QUO01"."QUOLEGA" IS 'Foreign key to the legal entities table (LEG01)';
COMMENT ON COLUMN "QUO01"."QUOBPAR" IS 'Foreign key to the business partners table (BPA01)';
COMMENT ON COLUMN "QUO01"."QUOPERI" IS 'Foreign key to the periods table (PER01)';
COMMENT ON COLUMN "QUO01"."QUODOTY" IS 'Foreign key to the documents type table (DOC01)';

CREATE TABLE "QLI01"
(
  "QLILIID" NUMBER(8,0) NOT NULL, -- Part of the composite primary key of the QUO01 table.
  "QLILIBI" NUMBER(8,0) NOT NULL, -- Foreign key that reference the quotes headers (QUO01) table, also primary key
  "QLILQUA" NUMBER(8,0) NOT NULL, -- Product quantity
  "QLILPRI" NUMBER(8,2) NOT NULL, -- Product price
  "QLILUSR" VARCHAR2(80), -- Standart  created by column
  "QLILDAT" DATE DEFAULT SYSDATE, -- Standart  created on column
  "QLILIUS" VARCHAR2(80), -- Standart  last updated by column
  "QLILIDA" DATE DEFAULT SYSDATE, -- Standart  last updated on column
  "QLILPRO" NUMBER(8,0), -- Foreign key to the products table (PRO01)
  "QLITAID" NUMBER(8,0), -- Foreign key to the taxes table (TAX01)
  "QLILLTO" NUMBER GENERATED ALWAYS AS ("QLILQUA"*"QLILPRI") VIRTUAL ,  -- Line gross amount
  "QLIDISC" NUMBER(8,2), -- Line discount amount
  "QLITAXE" NUMBER(8,2), -- Line tax amount
  "QLINETA" NUMBER(8,2), -- Line net to pay amount
  CONSTRAINT "QLI01_QLILIID_QLILIBI_PK" PRIMARY KEY ("QLILIID", "QLILIBI")
);

COMMENT ON TABLE "QLI01" IS 'Quotes details table';
COMMENT ON COLUMN "QLI01"."QLILIID" IS 'Part of the composite primary key of the QUO01 table';
COMMENT ON COLUMN "QLI01"."QLILIBI" IS 'Foreign key that reference the quotes headers (QUO01) table, also primary key';
COMMENT ON COLUMN "QLI01"."QLILQUA" IS 'Product quantity';
COMMENT ON COLUMN "QLI01"."QLILPRI" IS 'Product price';
COMMENT ON COLUMN "QLI01"."QLILUSR" IS 'Standart created by column';
COMMENT ON COLUMN "QLI01"."QLILDAT" IS 'Standart created on column';
COMMENT ON COLUMN "QLI01"."QLILIUS" IS 'Standart last updated by column';
COMMENT ON COLUMN "QLI01"."QLILIDA" IS 'Standart last updated on column';
COMMENT ON COLUMN "QLI01"."QLILPRO" IS 'Foreign key to the products table (PRO01)';
COMMENT ON COLUMN "QLI01"."QLITAID" IS 'Foreign key to the products table (TAX01)';
COMMENT ON COLUMN "QLI01"."QLILLTO" IS 'Line gross amount';
COMMENT ON COLUMN "QLI01"."QLIDISC" IS 'Line discount amount';
COMMENT ON COLUMN "QLI01"."QLITAXE" IS 'Line tax amount';
COMMENT ON COLUMN "QLI01"."QLINETA" IS 'Line net to pay amount';

/*
CREATE TABLE "SOH01"
(
  "SOHRNID" NUMBER(8,0) NOT NULL , -- Primary key column for the SOH01 table
  "SOHSTAT" VARCHAR2(20), -- Sales order status
  "SOHRNUS" VARCHAR2(80), -- Standart created by column
  "SOHRNDA" DATE DEFAULT SYSDATE, -- Standart created on column
  "SOHRNUU" VARCHAR2(80), -- Standart last updated by column
  "SOHRNUD" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "SOHOLEG" NUMBER (8,0), -- Foreign key to the legal entities (LEG01)  
  "SOHCUST" NUMBER (8,0), -- Foreign key to the customers table (CUS01)
  CONSTRAINT "SOH01_SOHRNID_PK" PRIMARY KEY ("SOHRNID")

);

COMMENT ON TABLE "SOH01" IS 'Sales order document header table';
COMMENT ON COLUMN "SOH01"."SOHRNID" IS 'Primary key column for the SOH01 table';
COMMENT ON COLUMN "SOH01"."SOHSTAT" IS 'Sales order status';
COMMENT ON COLUMN "SOH01"."SOHRNUS" IS 'Standart created by column';
COMMENT ON COLUMN "SOH01"."SOHRNDA" IS 'Standart created on column';
COMMENT ON COLUMN "SOH01"."SOHRNUU" IS 'Standart last updated by column';
COMMENT ON COLUMN "SOH01"."SOHRNUD" IS 'Standart last updated on column';
COMMENT ON COLUMN "SOH01"."SOHOLEG" IS 'Foreign key to the legal entities (LEG01)';
COMMENT ON COLUMN "SOH01"."SOHCUST" IS 'Foreign key to the customers table (CUS01)';
*/

CREATE TABLE "SOR01"
(
  "SORDRID" NUMBER(8,0) NOT NULL , -- Primary key column for the SOR01 table
  "SORDOCN" GENERATED ALWAYS AS ('SO'  || "SORDRID") VIRTUAL, -- Sale order docment id
  "SORDODA" DATE, -- Sale order docment date  
  "SORSTAT" VARCHAR2(20), -- Sale order document status
  "SORNOTE" VARCHAR2(255), -- Sale order document note
  "SORORIG" VARCHAR2(20), -- Sale order document origin
  "SORORTY" NUMBER (8,0), -- Sale order document origin type
  "SORGROS" NUMBER(8,2), -- Total gross amount
  "SORDISC" NUMBER(8,2), -- Total discount amount
  "SORTAXE" NUMBER(8,2), -- Total tax amount
  "SORNETA" NUMBER(8,2), -- Total net to pay amount
  "SORRNUS" VARCHAR2(80), -- Standart created by column
  "SORRNDA" DATE DEFAULT SYSDATE, -- Standart created on column
  "SORRNUU" VARCHAR2(80), -- Standart last updated by column
  "SORRNUD" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "SORLEGA" NUMBER (8,0), -- Foreign key to the legal entities table (LEG01)  
  "SORBPAR" NUMBER (8,0), -- Foreign key to the business partners table (BPA01)
  "SORPERI" NUMBER (8,0), -- Foreign key to the periods table (PER01)
  "SORDOTY" NUMBER (8,0), -- Foreign key to the documents type table (DOC01)
  CONSTRAINT "SOR01_SORDRID_PK" PRIMARY KEY ("SORDRID")

);

COMMENT ON TABLE "SOR01" IS 'Sales orders document header table';
COMMENT ON COLUMN "SOR01"."SORDRID" IS 'Primary key column for the SOR01 table';
COMMENT ON COLUMN "SOR01"."SORDOCN" IS 'Sale order docment id';
COMMENT ON COLUMN "SOR01"."SORDODA" IS 'Sale order docment date';
COMMENT ON COLUMN "SOR01"."SORSTAT" IS 'Sale order document status';
COMMENT ON COLUMN "SOR01"."SORNOTE" IS 'Sale order document note';
COMMENT ON COLUMN "SOR01"."SORORIG" IS 'Sale order document origin';
COMMENT ON COLUMN "SOR01"."SORORTY" IS 'Sale order document origin type';
COMMENT ON COLUMN "SOR01"."SORGROS" IS 'Total gross amount';
COMMENT ON COLUMN "SOR01"."SORDISC" IS 'Total discount amount';
COMMENT ON COLUMN "SOR01"."SORTAXE" IS 'Total tax amount';
COMMENT ON COLUMN "SOR01"."SORNETA" IS 'Total net to pay amount';
COMMENT ON COLUMN "SOR01"."SORRNUS" IS 'Standart created by column';
COMMENT ON COLUMN "SOR01"."SORRNDA" IS 'Standart created on column';
COMMENT ON COLUMN "SOR01"."SORRNUU" IS 'Standart last updated by column';
COMMENT ON COLUMN "SOR01"."SORRNUD" IS 'Standart last updated on column';
COMMENT ON COLUMN "SOR01"."SORLEGA" IS 'Foreign key to the legal entities table (LEG01)';
COMMENT ON COLUMN "SOR01"."SORBPAR" IS 'Foreign key to the business partners table (BPA01)';
COMMENT ON COLUMN "SOR01"."SORPERI" IS 'Foreign key to the periods table (PER01)';
COMMENT ON COLUMN "SOR01"."SORDOTY" IS 'Foreign key to the documents type table (DOC01)';

/*
CREATE TABLE "SOL01"
(
  "SOLLIID" NUMBER(8,0) NOT NULL, -- Part of the composite primary key of the SOL01 table.
  "SOLLISO" NUMBER(8,0) NOT NULL, -- Foreign key that reference the sales orders headers (SOR01) table, also primary key
  "SOLLQUA" NUMBER(8,0) NOT NULL, -- Product quantity
  "SOLLPRI" NUMBER(8,2) NOT NULL, -- Product price
  "SOLLLTO" NUMBER(8,2), -- Line total
  "SOLLDUD" DATE, -- Due date
  "SOLLSDA" DATE, -- Shipped date
  "SOLLSQA" NUMBER(8,2), -- Shipped quantity
  "SOLLREJ" NUMBER(8,2), -- Rejected quantity
  "SOLLUSR" VARCHAR2(80), -- Standart  created by column
  "SOLLDAT" DATE DEFAULT SYSDATE, -- Standart  created on column
  "SOLLIUS" VARCHAR2(80), -- Standart  last updated by column
  "SOLLIDA" DATE DEFAULT SYSDATE, -- Standart  last updated on column
  "SOLLPRO" NUMBER(8,0), -- Foreign key to the products table (INV.PRO01)
  CONSTRAINT "SOL01_SOLLIID_SOLLISO_PK" PRIMARY KEY ("SOLLIID", "SOLLISO")
);

COMMENT ON TABLE "SOL01" IS 'Sales order details table';
COMMENT ON COLUMN "SOL01"."SOLLIID" IS 'Part of the composite primary key of the SOL01 table';
COMMENT ON COLUMN "SOL01"."SOLLISO" IS 'Primary key column for the SOL01 table and foreign key that reference the SO header table (SOH01)';
COMMENT ON COLUMN "SOL01"."SOLLQUA" IS 'Product quantity';
COMMENT ON COLUMN "SOL01"."SOLLPRI" IS 'Product price';
COMMENT ON COLUMN "SOL01"."SOLLLTO" IS 'Line total';
COMMENT ON COLUMN "SOL01"."SOLLDUD" IS 'Due date';
COMMENT ON COLUMN "SOL01"."SOLLSDA" IS 'Shipped date';
COMMENT ON COLUMN "SOL01"."SOLLSQA" IS 'Shipped quantity';
COMMENT ON COLUMN "SOL01"."SOLLREJ" IS 'Rejected quantity';
COMMENT ON COLUMN "SOL01"."SOLLUSR" IS 'Standart created by column';
COMMENT ON COLUMN "SOL01"."SOLLDAT" IS 'Standart created on column';
COMMENT ON COLUMN "SOL01"."SOLLIUS" IS 'Standart last updated by column';
COMMENT ON COLUMN "SOL01"."SOLLIDA" IS 'Standart last updated on column';
COMMENT ON COLUMN "SOL01"."SOLLPRO" IS 'Foreign key to the products table (PRO01)';
*/

CREATE TABLE "SOL01"
(
  "SOLLIID" NUMBER(8,0) NOT NULL, -- Part of the composite primary key of the SOL01 table.
  "SOLLISO" NUMBER(8,0) NOT NULL, -- Foreign key that reference the sales orders headers (SOR01) table, also primary key
  "SOLLQUA" NUMBER(8,0) NOT NULL, -- Product quantity
  "SOLLPRI" NUMBER(8,2) NOT NULL, -- Product price
  "SOLLUSR" VARCHAR2(80), -- Standart  created by column
  "SOLLDAT" DATE DEFAULT SYSDATE, -- Standart  created on column
  "SOLLIUS" VARCHAR2(80), -- Standart  last updated by column
  "SOLLIDA" DATE DEFAULT SYSDATE, -- Standart  last updated on column
  "SOLLPRO" NUMBER(8,0), -- Foreign key to the products table (PRO01)
  "SOLTAID" NUMBER(8,0), -- Foreign key to the taxes table (TAX01)
  "SOLLLTO" NUMBER GENERATED ALWAYS AS ("SOLLQUA"*"SOLLPRI") VIRTUAL ,  -- Line gross amount
  "SOLDISC" NUMBER(8,2), -- Line discount amount
  "SOLTAXE" NUMBER(8,2), -- Line tax amount
  "SOLNETA" NUMBER(8,2), -- Line net to pay amount
  CONSTRAINT "SOL01_SOLLIID_SOLLISO_PK" PRIMARY KEY ("SOLLIID", "SOLLISO")
);

COMMENT ON TABLE "SOL01" IS 'Sales order details table';
COMMENT ON COLUMN "SOL01"."SOLLIID" IS 'Part of the composite primary key of the SOL01 table';
COMMENT ON COLUMN "SOL01"."SOLLISO" IS 'Foreign key that reference the sales orders headers (SOR01) table, also primary key';
COMMENT ON COLUMN "SOL01"."SOLLQUA" IS 'Product quantity';
COMMENT ON COLUMN "SOL01"."SOLLPRI" IS 'Product price';
COMMENT ON COLUMN "SOL01"."SOLLUSR" IS 'Standart created by column';
COMMENT ON COLUMN "SOL01"."SOLLDAT" IS 'Standart created on column';
COMMENT ON COLUMN "SOL01"."SOLLIUS" IS 'Standart last updated by column';
COMMENT ON COLUMN "SOL01"."SOLLIDA" IS 'Standart last updated on column';
COMMENT ON COLUMN "SOL01"."SOLLPRO" IS 'Foreign key to the products table (PRO01)';
COMMENT ON COLUMN "SOL01"."SOLTAID" IS 'Foreign key to the products table (TAX01)';
COMMENT ON COLUMN "SOL01"."SOLLLTO" IS 'Line gross amount';
COMMENT ON COLUMN "SOL01"."SOLDISC" IS 'Line discount amount';
COMMENT ON COLUMN "SOL01"."SOLTAXE" IS 'Line tax amount';
COMMENT ON COLUMN "SOL01"."SOLNETA" IS 'Line net to pay amount';

CREATE TABLE "SHI01"
(
  "SHIPMID" NUMBER(8,0) NOT NULL , -- Primary key column for the SHI01 table
  "SHIDOCN" GENERATED ALWAYS AS ('SH'  || "SHIPMID") VIRTUAL, -- Shippment docment id
  "SHIDODA" DATE, -- Shippment document date   
  "SHISTAT" VARCHAR2(20), -- Shipment document status
  "SHINOTE" VARCHAR2(255), -- Shipment document note
  "SHIORIG" VARCHAR2(20), -- Shipment document origin
  "SHIORTY" NUMBER (8,0), -- Shipment document origin type
  "SHIGROS" NUMBER(8,2), -- Total gross amount
  "SHIDISC" NUMBER(8,2), -- Total discount amount
  "SHITAXE" NUMBER(8,2), -- Total tax amount
  "SHINETA" NUMBER(8,2), -- Total net to pay amount
  "SHIRNUS" VARCHAR2(80), -- Standart created by column
  "SHIRNDA" DATE DEFAULT SYSDATE, -- Standart created on column
  "SHIRNUU" VARCHAR2(80), -- Standart last updated by column
  "SHIRNUD" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "SHILEGA" NUMBER (8,0), -- Foreign key to the legal entities table (LEG01)  
  "SHIBPAR" NUMBER (8,0), -- Foreign key to the business partners table (BPA01)
  "SHIPERI" NUMBER (8,0), -- Foreign key to the periods table (PER01)
  "SHIDOTY" NUMBER (8,0), -- Foreign key to the documents type table (DOC01)
  CONSTRAINT "SHI01_SHIPMID_PK" PRIMARY KEY ("SHIPMID")

);

COMMENT ON TABLE "SHI01" IS 'Shipment document header table';
COMMENT ON COLUMN "SHI01"."SHIPMID" IS 'Primary key column for the SHI01 table';
COMMENT ON COLUMN "SHI01"."SHIDOCN" IS 'Invoice docment id';
COMMENT ON COLUMN "SHI01"."SHIDODA" IS 'Shipment docment date';
COMMENT ON COLUMN "SHI01"."SHISTAT" IS 'Shipment document status';
COMMENT ON COLUMN "SHI01"."SHINOTE" IS 'Shipment document note';
COMMENT ON COLUMN "SHI01"."SHIORIG" IS 'Shipment document origin';
COMMENT ON COLUMN "SHI01"."SHIORTY" IS 'Shipment document origin type';
COMMENT ON COLUMN "SHI01"."SHIGROS" IS 'Total gross amount';
COMMENT ON COLUMN "SHI01"."SHIDISC" IS 'Total discount amount';
COMMENT ON COLUMN "SHI01"."SHITAXE" IS 'Total tax amount';
COMMENT ON COLUMN "SHI01"."SHINETA" IS 'Total net to pay amount';
COMMENT ON COLUMN "SHI01"."SHIRNUS" IS 'Standart created by column';
COMMENT ON COLUMN "SHI01"."SHIRNDA" IS 'Standart created on column';
COMMENT ON COLUMN "SHI01"."SHIRNUU" IS 'Standart last updated by column';
COMMENT ON COLUMN "SHI01"."SHIRNUD" IS 'Standart last updated on column';
COMMENT ON COLUMN "SHI01"."SHILEGA" IS 'Foreign key to the legal entities table (LEG01)';
COMMENT ON COLUMN "SHI01"."SHIBPAR" IS 'Foreign key to the business partners table (BPA01)';
COMMENT ON COLUMN "SHI01"."SHIPERI" IS 'Foreign key to the periods table (PER01)';
COMMENT ON COLUMN "SHI01"."SHIDOTY" IS 'Foreign key to the documents type table (DOC01)';

CREATE TABLE "SHL01"
(
  "SHLLIID" NUMBER(8,0) NOT NULL, -- Part of the composite primary key of the SHL01 table.
  "SHLINID" NUMBER(8,0) NOT NULL, -- Foreign key that reference the shipment headers (SHI01) table, also primary key
  "SHLLQUA" NUMBER(8,0) NOT NULL, -- Shipped quantity
  "SHLLPRI" NUMBER(8,2) NOT NULL, -- Shipped product price
  "SHLLUSR" VARCHAR2(80), -- Standart  created by column
  "SHLLDAT" DATE DEFAULT SYSDATE, -- Standart  created on column
  "SHLLIUS" VARCHAR2(80), -- Standart  last updated by column
  "SHLLIDA" DATE DEFAULT SYSDATE, -- Standart  last updated on column
  "SHLLPRO" NUMBER(8,0), -- Foreign key to the products table (PRO01)
  "SHLTAID" NUMBER(8,0), -- Foreign key to the taxes table (TAX01)
  "SHLLLTO" NUMBER GENERATED ALWAYS AS ("SHLLQUA"*"SHLLPRI") VIRTUAL ,  -- Line gross amount
  "SHLDISC" NUMBER(8,2), -- Line discount amount
  "SHLTAXE" NUMBER(8,2), -- Line tax amount
  "SHLNETA" NUMBER(8,2), -- Line net to pay amount
  CONSTRAINT "SHL01_SHLLIID_SHLINID_PK" PRIMARY KEY ("SHLLIID", "SHLINID")
);

COMMENT ON TABLE "SHL01" IS 'Shipment details table';
COMMENT ON COLUMN "SHL01"."SHLLIID" IS 'Part of the composite primary key of the SHL01 table';
COMMENT ON COLUMN "SHL01"."SHLINID" IS 'Foreign key that reference the shipment headers (SHI01) table, also primary key';
COMMENT ON COLUMN "SHL01"."SHLLQUA" IS 'Shipped quantity';
COMMENT ON COLUMN "SHL01"."SHLLPRI" IS 'Shipped product price';
COMMENT ON COLUMN "SHL01"."SHLLUSR" IS 'Standart created by column';
COMMENT ON COLUMN "SHL01"."SHLLDAT" IS 'Standart created on column';
COMMENT ON COLUMN "SHL01"."SHLLIUS" IS 'Standart last updated by column';
COMMENT ON COLUMN "SHL01"."SHLLIDA" IS 'Standart last updated on column';
COMMENT ON COLUMN "SHL01"."SHLLPRO" IS 'Foreign key to the products table (PRO01)';
COMMENT ON COLUMN "SHL01"."SHLTAID" IS 'Foreign key to the products table (TAX01)';
COMMENT ON COLUMN "SHL01"."SHLLLTO" IS 'Line gross amount';
COMMENT ON COLUMN "SHL01"."SHLDISC" IS 'Line discount amount';
COMMENT ON COLUMN "SHL01"."SHLTAXE" IS 'Line tax amount';
COMMENT ON COLUMN "SHL01"."SHLNETA" IS 'Line net to pay amount';

CREATE TABLE "INV01"
(
  "INVOIID" NUMBER(8,0) NOT NULL , -- Primary key column for the INV01 table
  "INVDOCN" GENERATED ALWAYS AS ('IN'  || "INVOIID") VIRTUAL, -- Invoice docment id
  "INVDODA" DATE, -- Invoice docment date 
  "INVDUDA" DATE, -- Invoice due date   
  "INVSTAT" VARCHAR2(20), -- Invoice document status
  "INVNOTE" VARCHAR2(255), -- Invoice document note
  "INVORIG" VARCHAR2(20), -- Invoice document origin
  "INVORTY" NUMBER (8,0), -- Invoice document origin type
  "INVGROS" NUMBER(8,2), -- Total gross amount
  "INVDISC" NUMBER(8,2), -- Total discount amount
  "INVTAXE" NUMBER(8,2), -- Total tax amount
  "INVNETA" NUMBER(8,2), -- Total net to pay amount
  "INVRNUS" VARCHAR2(80), -- Standart created by column
  "INVRNDA" DATE DEFAULT SYSDATE, -- Standart created on column
  "INVRNUU" VARCHAR2(80), -- Standart last updated by column
  "INVRNUD" DATE DEFAULT SYSDATE, -- Standart last updated on column
  "INVLEGA" NUMBER (8,0), -- Foreign key to the legal entities table (LEG01)  
  "INVBPAR" NUMBER (8,0), -- Foreign key to the business partners table (BPA01)
  "INVPERI" NUMBER (8,0), -- Foreign key to the periods table (PER01)
  "INVDOTY" NUMBER (8,0), -- Foreign key to the documents type table (DOC01)
  CONSTRAINT "INV01_INVOIID_PK" PRIMARY KEY ("INVOIID")

);

COMMENT ON TABLE "INV01" IS 'Invoice document header table';
COMMENT ON COLUMN "INV01"."INVOIID" IS 'Primary key column for the INV01 table';
COMMENT ON COLUMN "INV01"."INVDOCN" IS 'Invoice docment id';
COMMENT ON COLUMN "INV01"."INVDODA" IS 'Invoice docment date';
COMMENT ON COLUMN "INV01"."INVDUDA" IS 'Invoice due date';
COMMENT ON COLUMN "INV01"."INVSTAT" IS 'Invoice document status';
COMMENT ON COLUMN "INV01"."INVNOTE" IS 'Invoice document note';
COMMENT ON COLUMN "INV01"."INVORIG" IS 'Invoice document origin';
COMMENT ON COLUMN "INV01"."INVORTY" IS 'Invoice document origin type';
COMMENT ON COLUMN "INV01"."INVGROS" IS 'Total gross amount';
COMMENT ON COLUMN "INV01"."INVDISC" IS 'Total discount amount';
COMMENT ON COLUMN "INV01"."INVTAXE" IS 'Total tax amount';
COMMENT ON COLUMN "INV01"."INVNETA" IS 'Total net to pay amount';
COMMENT ON COLUMN "INV01"."INVRNUS" IS 'Standart created by column';
COMMENT ON COLUMN "INV01"."INVRNDA" IS 'Standart created on column';
COMMENT ON COLUMN "INV01"."INVRNUU" IS 'Standart last updated by column';
COMMENT ON COLUMN "INV01"."INVRNUD" IS 'Standart last updated on column';
COMMENT ON COLUMN "INV01"."INVLEGA" IS 'Foreign key to the legal entities table (LEG01)';
COMMENT ON COLUMN "INV01"."INVBPAR" IS 'Foreign key to the business partners table (BPA01)';
COMMENT ON COLUMN "INV01"."INVPERI" IS 'Foreign key to the periods table (PER01)';
COMMENT ON COLUMN "INV01"."INVDOTY" IS 'Foreign key to the documents type table (DOC01)';

CREATE TABLE "INL01"
(
  "INLLIID" NUMBER(8,0) NOT NULL, -- Part of the composite primary key of the INL01 table.
  "INLINID" NUMBER(8,0) NOT NULL, -- Foreign key that reference the invoice headers (INV01) table, also primary key
  "INLLQUA" NUMBER(8,0) NOT NULL, -- Product quantity
  "INLLPRI" NUMBER(8,2) NOT NULL, -- Product price
  "INLLUSR" VARCHAR2(80), -- Standart  created by column
  "INLLDAT" DATE DEFAULT SYSDATE, -- Standart  created on column
  "INLLIUS" VARCHAR2(80), -- Standart  last updated by column
  "INLLIDA" DATE DEFAULT SYSDATE, -- Standart  last updated on column
  "INLLPRO" NUMBER(8,0), -- Foreign key to the products table (PRO01)
  "INLTAID" NUMBER(8,0), -- Foreign key to the taxes table (TAX01)
  "INLLLTO" NUMBER GENERATED ALWAYS AS ("INLLQUA"*"INLLPRI") VIRTUAL ,  -- Line gross amount
  "INLDISC" NUMBER(8,2), -- Line discount amount
  "INLTAXE" NUMBER(8,2), -- Line tax amount
  "INLNETA" NUMBER(8,2), -- Line net to pay amount
  CONSTRAINT "INL01_INLLIID_INLINID_PK" PRIMARY KEY ("INLLIID", "INLINID")
);

COMMENT ON TABLE "INL01" IS 'Invoice details table';
COMMENT ON COLUMN "INL01"."INLLIID" IS 'Part of the composite primary key of the INL01 table';
COMMENT ON COLUMN "INL01"."INLINID" IS 'Foreign key that reference the invoice headers (INV01) table, also primary key';
COMMENT ON COLUMN "INL01"."INLLQUA" IS 'Product quantity';
COMMENT ON COLUMN "INL01"."INLLPRI" IS 'Product price';
COMMENT ON COLUMN "INL01"."INLLUSR" IS 'Standart created by column';
COMMENT ON COLUMN "INL01"."INLLDAT" IS 'Standart created on column';
COMMENT ON COLUMN "INL01"."INLLIUS" IS 'Standart last updated by column';
COMMENT ON COLUMN "INL01"."INLLIDA" IS 'Standart last updated on column';
COMMENT ON COLUMN "INL01"."INLLPRO" IS 'Foreign key to the products table (PRO01)';
COMMENT ON COLUMN "INL01"."INLTAID" IS 'Foreign key to the products table (TAX01)';
COMMENT ON COLUMN "INL01"."INLLLTO" IS 'Line gross amount';
COMMENT ON COLUMN "INL01"."INLDISC" IS 'Line discount amount';
COMMENT ON COLUMN "INL01"."INLTAXE" IS 'Line tax amount';
COMMENT ON COLUMN "INL01"."INLNETA" IS 'Line net to pay amount';

/*Foreign keys*/
ALTER TABLE "QUO01" ADD  CONSTRAINT "QUO01_LEG01_FK" FOREIGN KEY("QUOLEGA")
REFERENCES "LEG01" ("LEGALID")
;
ALTER TABLE "QUO01" ADD  CONSTRAINT "QUO01_BPA01_FK" FOREIGN KEY("QUOBPAR")
REFERENCES "BPA01" ("BUSIPID")
;
ALTER TABLE "QUO01" ADD  CONSTRAINT "QUO01_PER01_FK" FOREIGN KEY("QUOPERI")
REFERENCES "PER01" ("PERIODI")
;
ALTER TABLE "QUO01" ADD  CONSTRAINT "QUO01_DOC01_FK" FOREIGN KEY("QUODOTY")
REFERENCES "DOC01" ("DOCTYID")
;
ALTER TABLE "QLI01" ADD  CONSTRAINT "QLI01_QUO01_FK" FOREIGN KEY("QLILIBI")
REFERENCES "QUO01" ("QUOTEID")
;
ALTER TABLE "QLI01" ADD  CONSTRAINT "QLI01_PRO01_FK" FOREIGN KEY("QLILPRO")
REFERENCES "PRO01" ("PRODUCD")
;
/*

ALTER TABLE "SOH01" ADD  CONSTRAINT "SOH01_ORG01_FK" FOREIGN KEY("SOHOLEG")
REFERENCES "LEG01" ("LEGALID")
;
ALTER TABLE "SOH01" ADD  CONSTRAINT "SOH01_CUS01_FK" FOREIGN KEY("SOHCUST")
REFERENCES "CUS01" ("CUSTSID")
;
*/
ALTER TABLE "SOR01" ADD  CONSTRAINT "SOR01_LEG01_FK" FOREIGN KEY("SORLEGA")
REFERENCES "LEG01" ("LEGALID")
;
ALTER TABLE "SOR01" ADD  CONSTRAINT "SOR01_BPA01_FK" FOREIGN KEY("SORBPAR")
REFERENCES "BPA01" ("BUSIPID")
;
ALTER TABLE "SOR01" ADD  CONSTRAINT "SOR01_PER01_FK" FOREIGN KEY("SORPERI")
REFERENCES "PER01" ("PERIODI")
;
ALTER TABLE "SOR01" ADD  CONSTRAINT "SOR01_DOC01_FK" FOREIGN KEY("SORDOTY")
REFERENCES "DOC01" ("DOCTYID")
;
ALTER TABLE "SOL01" ADD  CONSTRAINT "SOL01_SOR01_FK" FOREIGN KEY("SOLLISO")
REFERENCES "SOR01" ("SORDRID")
;
ALTER TABLE "SOL01" ADD  CONSTRAINT "SOL01_PRO01_FK" FOREIGN KEY("SOLLPRO")
REFERENCES "PRO01" ("PRODUCD")
;
ALTER TABLE "SHI01" ADD  CONSTRAINT "SHI01_LEG01_FK" FOREIGN KEY("SHILEGA")
REFERENCES "LEG01" ("LEGALID")
;
ALTER TABLE "SHI01" ADD  CONSTRAINT "SHI01_BPA01_FK" FOREIGN KEY("SHIBPAR")
REFERENCES "BPA01" ("BUSIPID")
;
ALTER TABLE "SHI01" ADD  CONSTRAINT "SHI01_PER01_FK" FOREIGN KEY("SHIPERI")
REFERENCES "PER01" ("PERIODI")
;
ALTER TABLE "SHI01" ADD  CONSTRAINT "SHI01_DOC01_FK" FOREIGN KEY("SHIDOTY")
REFERENCES "DOC01" ("DOCTYID")
;
ALTER TABLE "SHL01" ADD  CONSTRAINT "SHL01_SHI01_FK" FOREIGN KEY("SHLINID")
REFERENCES "SHI01" ("SHIPMID")
;
ALTER TABLE "SHL01" ADD  CONSTRAINT "SHL01_PRO01_FK" FOREIGN KEY("SHLLPRO")
REFERENCES "PRO01" ("PRODUCD")
;
ALTER TABLE "INV01" ADD  CONSTRAINT "INV01_LEG01_FK" FOREIGN KEY("INVLEGA")
REFERENCES "LEG01" ("LEGALID")
;
ALTER TABLE "INV01" ADD  CONSTRAINT "INV01_BPA01_FK" FOREIGN KEY("INVBPAR")
REFERENCES "BPA01" ("BUSIPID")
;
ALTER TABLE "INV01" ADD  CONSTRAINT "INV01_PER01_FK" FOREIGN KEY("INVPERI")
REFERENCES "PER01" ("PERIODI")
;
ALTER TABLE "INV01" ADD  CONSTRAINT "INV01_DOC01_FK" FOREIGN KEY("INVDOTY")
REFERENCES "DOC01" ("DOCTYID")
;
ALTER TABLE "INL01" ADD  CONSTRAINT "INL01_INV01_FK" FOREIGN KEY("INLINID")
REFERENCES "INV01" ("INVOIID")
;
ALTER TABLE "INL01" ADD  CONSTRAINT "INL01_PRO01_FK" FOREIGN KEY("INLLPRO")
REFERENCES "PRO01" ("PRODUCD")
;

/************************************************************
           CBA Common Schema Objects 
*************************************************************/

/*Sequences*/

CREATE SEQUENCE   "ACCOUNTS_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 6 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "ACGROUPS_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "ADDRESSES_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "BALANCE_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 5 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "BANKS_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "BUDGET_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "BUSINESS_PARTNERS_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "BP_ADDRESS_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "BILLS_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "CALENDAR_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 5 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "COA_SEQ"  MINVALUE 10 MAXVALUE 9223372036854775807 INCREMENT BY 10 START WITH 410 CACHE 20 NOORDER  NOCYCLE
/
CREATE SEQUENCE   "CURRENCY_SEQ"  MINVALUE 10 MAXVALUE 9223372036854775807 INCREMENT BY 10 START WITH 2610 CACHE 20 NOORDER  NOCYCLE
/
CREATE SEQUENCE   "GOODS_RECEIPT_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "INVOICE_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "JOURNALS_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 29 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "LEDGER_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 4 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "LEGAL_ENTITY_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 2 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "PERIOD_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 5 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "QUOTES_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "RATES_SEQ"  MINVALUE 10 MAXVALUE 9223372036854775807 INCREMENT BY 10 START WITH 120 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "RFQ_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "SEGMENTS_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 10 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "SHIPMENT_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 10 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "TAX_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "PRODFAM_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "PRODUCTS_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "PROSFAM_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "PURCHASES_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "VENDORS_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 2 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "CUSTOMERS_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "SALES_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE
/
CREATE SEQUENCE   "WAREHOUSES_SEQ"  MINVALUE 1 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE
/

/*Triggers*/

CREATE OR REPLACE TRIGGER  "BIU_ACC01" 
BEFORE INSERT OR UPDATE  ON  ACC01
FOR EACH ROW
BEGIN
IF INSERTING THEN
    IF :NEW.ACCNTCD IS NULL OR :NEW.ACCNTCD  < 0 THEN
         SELECT ACCOUNTS_SEQ.NEXTVAL
         INTO :NEW.ACCNTCD
     FROM DUAL;
   END IF;
:NEW.ACCNTDT := SYSDATE;
:NEW.ACCNTUS := nvl(v('APP_USER'),USER);
END IF;
IF UPDATING THEN
:NEW.ACCNTUD := SYSDATE;
:NEW.ACCNTUP := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_ACS01" 
BEFORE INSERT OR UPDATE  ON  ACS01
FOR EACH ROW
BEGIN
IF INSERTING THEN
    IF :NEW.ACSTSID IS NULL OR :NEW.ACSTSID < 0 THEN
       SELECT SEGMENTS_SEQ.NEXTVAL
       INTO :NEW.ACSTSID
     FROM DUAL;
   END IF;
:NEW.ACSDATE := SYSDATE;
:NEW.ACSNTUS := nvl(v('APP_USER'),USER);
END IF;
IF UPDATING THEN
:NEW.ACSNTUD := SYSDATE;
:NEW.ACSNTUP := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_ADD01" 
BEFORE INSERT OR UPDATE  ON  ADD01
FOR EACH ROW
BEGIN
IF INSERTING THEN
    IF :NEW.ADDREID IS NULL OR :NEW.ADDREID < 0 THEN
       SELECT ADDRESSES_SEQ.NEXTVAL
       INTO :NEW.ADDREID
     FROM DUAL;
   END IF;
:NEW.ADDRDAT := SYSDATE;
:NEW.ADDRUSR := nvl(v('APP_USER'),USER);
END IF;
IF UPDATING THEN
:NEW.ADDRUAT := SYSDATE;
:NEW.ADDRUUS := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_BUD01" 
BEFORE INSERT OR UPDATE  ON  BUD01
FOR EACH ROW
BEGIN
IF INSERTING THEN
    IF :NEW.BUDGETI IS NULL OR :NEW.BUDGETI  < 0 THEN
       SELECT BUDGET_SEQ.NEXTVAL
       INTO :NEW.BUDGETI
     FROM DUAL;
   END IF;
:NEW.BUDGETA := SYSDATE;
:NEW.BUDGETU := nvl(v('APP_USER'),USER);
END IF;
IF UPDATING THEN
:NEW.BUDGEUD := SYSDATE;
:NEW.BUDGEDU := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_BPA01" 
BEFORE INSERT OR UPDATE  ON  BPA01
FOR EACH ROW
BEGIN
IF INSERTING THEN
    IF :NEW.BUSIPID IS NULL OR :NEW.BUSIPID  < 0 THEN
       SELECT BUSINESS_PARTNERS_SEQ.NEXTVAL
       INTO :NEW.BUSIPID
     FROM DUAL;
   END IF;
:NEW.BUSIDAT := SYSDATE;
:NEW.BUSIOUS := nvl(v('APP_USER'),USER);
END IF;
IF UPDATING THEN
:NEW.BUSIUDO := SYSDATE;
:NEW.BUSIUDB := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_CUR01" 
BEFORE UPDATE  ON CUR01 
FOR EACH ROW
BEGIN
:NEW.CURRENB := SYSDATE;
:NEW.CURRENL := nvl(v('APP_USER'),USER);
END;
/

CREATE OR REPLACE TRIGGER  "BIU_CAL01" 
BEFORE INSERT OR UPDATE  ON  CAL01
FOR EACH ROW
BEGIN
IF INSERTING THEN
    IF :NEW.CALENID IS NULL OR :NEW.CALENID < 0 THEN
       SELECT CALENDAR_SEQ.NEXTVAL
       INTO :NEW.CALENID
     FROM DUAL;
   END IF;
:NEW.CALENDT := SYSDATE;
:NEW.CALENDU := nvl(v('APP_USER'),USER);
END IF;
IF UPDATING THEN
:NEW.CALENLU := SYSDATE;
:NEW.CALENDP := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_CHA01" 
BEFORE INSERT OR UPDATE  ON  CHA01
FOR EACH ROW
BEGIN
IF INSERTING THEN
    IF :NEW.COASIDS IS NULL OR :NEW.COASIDS < 0 THEN
       SELECT COA_SEQ.NEXTVAL
       INTO :NEW.COASIDS
     FROM DUAL;
   END IF;
:NEW.COADATE := SYSDATE;
:NEW.COAUSER := nvl(v('APP_USER'),USER);
END IF;
IF UPDATING THEN
:NEW.COAUPDD := SYSDATE;
:NEW.COAUPUS := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_JHE01" 
BEFORE INSERT OR UPDATE  ON  JHE01
FOR EACH ROW
BEGIN
IF INSERTING THEN
    IF :NEW.JOURNID IS NULL OR :NEW.JOURNID  < 0 THEN
      SELECT JOURNALS_SEQ.NEXTVAL
      INTO :NEW.JOURNID
     FROM DUAL;
   END IF;
:NEW.JOURNDA := SYSDATE;
:NEW.JOURNUS := nvl(v('APP_USER'),USER);
END IF;
IF UPDATING THEN
:NEW.JOURNUD := SYSDATE;
:NEW.JOURNUU := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_JLI01" 
BEFORE INSERT OR UPDATE  ON  JLI01
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.JRNLDAT := SYSDATE;
:NEW.JRNLUSR := nvl(v('APP_USER'),USER);
END IF;
IF UPDATING THEN
:NEW.JRNLIDA := SYSDATE;
:NEW.JRNLIUS := nvl(v('APP_USER'),USER);
END IF;
END;
/


CREATE OR REPLACE TRIGGER  "BIU_LEG01" 
BEFORE INSERT OR UPDATE  ON  LEG01
FOR EACH ROW
BEGIN
IF INSERTING THEN
    IF :NEW.LEGALID IS NULL OR :NEW.LEGALID < 0 THEN
       SELECT LEGAL_ENTITY_SEQ.NEXTVAL
       INTO :NEW.LEGALID
       FROM DUAL;
   END IF;
:NEW.LEGALAT := SYSDATE;
:NEW.LEGALSR := nvl(v('APP_USER'),USER);
END IF;
IF UPDATING THEN
:NEW.LEGALPD := SYSDATE;
:NEW.LEGALPU := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_PER01" 
BEFORE INSERT OR UPDATE  ON  PER01
FOR EACH ROW
BEGIN
IF INSERTING THEN
    IF :NEW.PERIODI IS NULL OR :NEW.PERIODI < 0 THEN
       SELECT PERIOD_SEQ.NEXTVAL
       INTO :NEW.PERIODI
     FROM DUAL;
   END IF;
:NEW.PERIODD := SYSDATE;
:NEW.PERIODU := nvl(v('APP_USER'),USER);
END IF;
IF UPDATING THEN
:NEW.PERIODM := SYSDATE;
:NEW.PERIODL := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_RAT01" 
BEFORE INSERT OR UPDATE  ON  RAT01
FOR EACH ROW
BEGIN
IF INSERTING THEN
    IF :NEW.RATEIDS IS NULL OR :NEW.RATEIDS < 0 THEN
       SELECT RATES_SEQ.NEXTVAL
       INTO :NEW.RATEIDS
     FROM DUAL;
   END IF;
:NEW.RATEDAT := SYSDATE;
:NEW.RATEUSR := nvl(v('APP_USER'),USER);
END IF;
IF UPDATING THEN
:NEW.RATEUPD := SYSDATE;
:NEW.RATEUPU := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_TAX01" 
BEFORE INSERT OR UPDATE  ON  TAX01
FOR EACH ROW
BEGIN
IF INSERTING THEN
    IF :NEW.TAXCODE IS NULL OR :NEW.TAXCODE < 0 THEN
       SELECT TAX_SEQ.NEXTVAL
       INTO :NEW.TAXCODE
     FROM DUAL;
   END IF;
:NEW.TAXDATE := SYSDATE;
:NEW.TAXUSER := nvl(v('APP_USER'),USER);
END IF;
IF UPDATING THEN
:NEW.TAXUATE := SYSDATE;
:NEW.TAXUUPD := nvl(v('APP_USER'),USER);
END IF;
END;
/


CREATE OR REPLACE TRIGGER  "BIU_PFA01" 
BEFORE INSERT OR UPDATE  ON  PFA01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
 IF :NEW.PFATSID IS NULL OR :NEW.PFATSID  < 0 THEN
   SELECT PRODFAM_SEQ.NEXTVAL
     INTO :NEW.PFATSID
     FROM DUAL;
   END IF;
:NEW.PFADATE := SYSDATE;
:NEW.PFANTUS := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.PFALUDO := SYSDATE;
:NEW.PFALUDB := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_PSF01" 
BEFORE INSERT OR UPDATE  ON  PSF01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
 IF :NEW.PSFTSID IS NULL OR :NEW.PSFTSID  < 0 THEN
   SELECT PROSFAM_SEQ.NEXTVAL
     INTO :NEW.PSFTSID
     FROM DUAL;
   END IF;
:NEW.PSFDATE := SYSDATE;
:NEW.PSFCBUS := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.PSFLUDO := SYSDATE;
:NEW.PSFLUDB := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_WAR01" 
BEFORE INSERT OR UPDATE  ON  WAR01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
 IF :NEW.WAREHID IS NULL OR :NEW.WAREHID  < 0 THEN
   SELECT WAREHOUSES_SEQ.NEXTVAL
     INTO :NEW.WAREHID
     FROM DUAL;
   END IF;
:NEW.WARDATE := SYSDATE;
:NEW.WAREHUS := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.WARLUDO := SYSDATE;
:NEW.WARLUDB := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_PRO01" 
BEFORE INSERT OR UPDATE  ON  PRO01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
 IF :NEW.PRODUCD IS NULL OR :NEW.PRODUCD  < 0 THEN
   SELECT PRODUCTS_SEQ.NEXTVAL
     INTO :NEW.PRODUCD
     FROM DUAL;
   END IF;
:NEW.PRODTDT  := SYSDATE;
:NEW.PRODTUS  := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.PRODTUD := SYSDATE;
:NEW.PRODTUP := nvl(v('APP_USER'),USER);
END IF;
END;
/
/*
CREATE OR REPLACE TRIGGER  "BIU_VEN01" 
BEFORE INSERT OR UPDATE  ON  VEN01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
 IF :NEW.VENDSID IS NULL OR :NEW.VENDSID  < 0 THEN
   SELECT VENDORS_SEQ.NEXTVAL
     INTO :NEW.VENDSID
     FROM DUAL;
   END IF;
:NEW.VENDATE := SYSDATE;
:NEW.VENCBUS := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.VENLUDB := nvl(v('APP_USER'),USER); 
:NEW.VENLUDO := SYSDATE;
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_POH01" 
BEFORE INSERT OR UPDATE  ON  POH01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
 IF :NEW.POHRNID IS NULL OR :NEW.POHRNID  < 0 THEN
   SELECT PURCHASES_SEQ.NEXTVAL
     INTO :NEW.POHRNID
     FROM DUAL;
   END IF;
:NEW.POHRNDA := SYSDATE;
:NEW.POHRNUS := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.POHRNUD := SYSDATE;
:NEW.POHRNUU := nvl(v('APP_USER'),USER);
END IF;
END;
/
*/

CREATE OR REPLACE TRIGGER  "BIU_RFQ" 
BEFORE INSERT OR UPDATE ON RFQ01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
 IF :NEW.RFQPKID IS NULL OR :NEW.RFQPKID  < 0 THEN
   SELECT RFQ_SEQ.NEXTVAL
     INTO :NEW.RFQPKID
     FROM DUAL;
   END IF;
:NEW.RFQRNDA := SYSDATE;
:NEW.RFQRNUS := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.RFQRNUD := SYSDATE;
:NEW.RFQRNUU := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_RFL01" 
BEFORE INSERT OR UPDATE  ON  RFL01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
:NEW.RFLLDAT := SYSDATE;
:NEW.RFLLUSR := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.RFLLIDA := SYSDATE;
:NEW.RFLLIUS := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_POR01" 
BEFORE INSERT OR UPDATE ON POR01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
 IF :NEW.PORRNID IS NULL OR :NEW.PORRNID  < 0 THEN
   SELECT PURCHASES_SEQ.NEXTVAL
     INTO :NEW.PORRNID
     FROM DUAL;
   END IF;
:NEW.PORRNDA := SYSDATE;
:NEW.PORRNUS := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.PORRNUD := SYSDATE;
:NEW.PORRNUU := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_POL01" 
BEFORE INSERT OR UPDATE  ON  POL01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
:NEW.POLLDAT := SYSDATE;
:NEW.POLLUSR := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.POLLIDA := SYSDATE;
:NEW.POLLIUS := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_GOR01" 
BEFORE INSERT OR UPDATE ON GOR01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
 IF :NEW.GORERID IS NULL OR :NEW.GORERID  < 0 THEN
   SELECT GOODS_RECEIPT_SEQ.NEXTVAL
     INTO :NEW.GORERID
     FROM DUAL;
   END IF;
:NEW.GORRNDA := SYSDATE;
:NEW.GORRNUS := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.GORRNUD := SYSDATE;
:NEW.GORRNUU := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_GRL01" 
BEFORE INSERT OR UPDATE  ON  GRL01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
:NEW.GRLLDAT := SYSDATE;
:NEW.GRLLUSR := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.GRLLIDA := SYSDATE;
:NEW.GRLLIUS := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_BIL01" 
BEFORE INSERT OR UPDATE ON BIL01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
 IF :NEW.BILLSID IS NULL OR :NEW.BILLSID  < 0 THEN
   SELECT BILLS_SEQ.NEXTVAL
     INTO :NEW.BILLSID
     FROM DUAL;
   END IF;
:NEW.BILRNDA := SYSDATE;
:NEW.BILRNUS := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.BILRNUD := SYSDATE;
:NEW.BILRNUU := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_BLI01" 
BEFORE INSERT OR UPDATE  ON  BLI01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
:NEW.BLILDAT := SYSDATE;
:NEW.BLILUSR := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.BLILIDA := SYSDATE;
:NEW.BLILIUS := nvl(v('APP_USER'),USER);
END IF;
END;
/
/*
CREATE OR REPLACE TRIGGER  "BIU_CUS01" 
BEFORE INSERT OR UPDATE  ON  CUS01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
 IF :NEW.CUSTSID IS NULL OR :NEW.CUSTSID  < 0 THEN
   SELECT CUSTOMERS_SEQ.NEXTVAL
     INTO :NEW.CUSTSID
     FROM DUAL;
   END IF;
:NEW.CUSTDAT  := SYSDATE;
:NEW.CUSTOUS  := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.CUSTUDO := SYSDATE;
:NEW.CUSTUDB := nvl(v('APP_USER'),USER);
END IF;
END;
/
*/

CREATE OR REPLACE TRIGGER  "BIU_QUO01" 
BEFORE INSERT OR UPDATE  ON  QUO01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
 IF :NEW.QUOTEID IS NULL OR :NEW.QUOTEID  < 0 THEN
   SELECT QUOTES_SEQ.NEXTVAL
     INTO :NEW.QUOTEID
     FROM DUAL;
   END IF;
:NEW.QUORNDA := SYSDATE;
:NEW.QUORNUS := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.QUORNUD := SYSDATE;
:NEW.QUORNUU := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_QLI01" 
BEFORE INSERT OR UPDATE  ON  QLI01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
:NEW.QLILDAT := SYSDATE;
:NEW.QLILUSR := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.QLILIDA := SYSDATE;
:NEW.QLILIUS := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_SOR01" 
BEFORE INSERT OR UPDATE  ON  SOR01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
 IF :NEW.SORDRID IS NULL OR :NEW.SORDRID  < 0 THEN
   SELECT SALES_SEQ.NEXTVAL
     INTO :NEW.SORDRID
     FROM DUAL;
   END IF;
:NEW.SORRNDA := SYSDATE;
:NEW.SORRNUS := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.SORRNUD := SYSDATE;
:NEW.SORRNUU := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_SOL01" 
BEFORE INSERT OR UPDATE  ON  SOL01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
:NEW.SOLLDAT := SYSDATE;
:NEW.SOLLUSR := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.SOLLIDA := SYSDATE;
:NEW.SOLLIUS := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_SHI01" 
BEFORE INSERT OR UPDATE  ON  SHI01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
 IF :NEW.SHIPMID IS NULL OR :NEW.SHIPMID  < 0 THEN
   SELECT SHIPMENT_SEQ.NEXTVAL
     INTO :NEW.SHIPMID
     FROM DUAL;
   END IF;
:NEW.SHIRNDA := SYSDATE;
:NEW.SHIRNUS := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.SHIRNUD := SYSDATE;
:NEW.SHIRNUU := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_SHL01" 
BEFORE INSERT OR UPDATE  ON  SHL01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
:NEW.SHLLDAT := SYSDATE;
:NEW.SHLLUSR := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.SHLLIDA := SYSDATE;
:NEW.SHLLIUS := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_INV01" 
BEFORE INSERT OR UPDATE  ON  INV01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
 IF :NEW.INVOIID IS NULL OR :NEW.INVOIID  < 0 THEN
   SELECT INVOICE_SEQ.NEXTVAL
     INTO :NEW.INVOIID
     FROM DUAL;
   END IF;
:NEW.INVRNDA := SYSDATE;
:NEW.INVRNUS := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.INVRNUD := SYSDATE;
:NEW.INVRNUU := nvl(v('APP_USER'),USER);
END IF;
END;
/

CREATE OR REPLACE TRIGGER  "BIU_INL01" 
BEFORE INSERT OR UPDATE  ON  INL01
FOR EACH ROW
BEGIN
IF INSERTING THEN
BEGIN
:NEW.INLLDAT := SYSDATE;
:NEW.INLLUSR := nvl(v('APP_USER'),USER);
END; 
END IF;
IF UPDATING THEN
:NEW.INLLIDA := SYSDATE;
:NEW.INLLIUS := nvl(v('APP_USER'),USER);
END IF;
END;
/

/* Functions */


CREATE OR REPLACE FUNCTION  "F_JOURNAL_TOTAL_DEBIT" (journal_id IN jhe01.journid%TYPE)
   RETURN jhe01.journtd%TYPE
IS
    v_journal_total_debit jhe01.journtd%type;
BEGIN
   SELECT SUM(jrnlide) 
      INTO v_journal_total_debit
      FROM jli01
      WHERE jrnliji = journal_id ;

    RETURN v_journal_total_debit;
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
       /* Return an empty record. */
       RETURN v_journal_total_debit;
END f_journal_total_debit;
/

CREATE OR REPLACE FUNCTION  "F_JOURNAL_TOTAL_CREDIT" (journal_id IN jhe01.journid%TYPE)
   RETURN jhe01.journtc%TYPE
IS
    v_journal_total_credit jhe01.journtc%type;
BEGIN
   SELECT SUM(jrnlicr) 
      INTO v_journal_total_credit
      FROM jli01
      WHERE jrnliji = journal_id;

    RETURN v_journal_total_credit;
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
       /* Return an empty record. */
       RETURN v_journal_total_credit;
END f_journal_total_credit;
/

CREATE OR REPLACE FUNCTION  "F_JOURNAL_COUNT_DEBIT" (jId IN jhe01.journid%TYPE)
   RETURN NUMBER
IS
    v_journal_count_debit NUMBER;
BEGIN
   SELECT COUNT(*) 
      INTO v_journal_count_debit
      FROM jli01 lines 
      WHERE lines.jrnliji = jId AND jrnlide IS NOT NULL;

    RETURN v_journal_count_debit;
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
       /* Return an empty record. */
       RETURN v_journal_count_debit;
END f_journal_count_debit;
/

CREATE OR REPLACE FUNCTION  "F_JOURNAL_COUNT_CREDIT" (jId IN jhe01.journid%TYPE)
   RETURN NUMBER
IS
    v_journal_count_credit NUMBER;
BEGIN
   SELECT COUNT(*) 
      INTO v_journal_count_credit
      FROM jli01 lines 
      WHERE lines.jrnliji = jId AND jrnlicr IS NOT NULL;

    RETURN v_journal_count_credit;
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
       /* Return an empty record. */
       RETURN v_journal_count_credit;
END  f_journal_count_credit;
/

CREATE OR REPLACE FUNCTION  "F_RFQ_NET_TOTAL" (rfq_id IN rfq01.rfqpkid%type)
   RETURN rfl01.rflllto%type
IS
    v_rfq_net_total rfl01.rflllto%type;
BEGIN
   SELECT SUM(rflllto) 
      INTO v_rfq_net_total
      FROM rfl01
      WHERE rflrfqi = rfq_id;

    RETURN v_rfq_net_total;
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
       /* Return an empty record. */
       RETURN v_rfq_net_total;
END f_rfq_net_total;
/


CREATE OR REPLACE FUNCTION  "F_PURCHASE_NET_TOTAL" (purchase_id IN por01.porrnid%type)
   RETURN pol01.polllto%type
IS
    v_purchase_net_total pol01.polllto%type;
BEGIN
   SELECT SUM(polllto) 
      INTO v_purchase_net_total
      FROM pol01
      WHERE pollipo = purchase_id;

    RETURN v_purchase_net_total;
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
       /* Return an empty record. */
       RETURN v_purchase_net_total;
END f_purchase_net_total;
/

CREATE OR REPLACE FUNCTION  "F_GOODS_RECEIPT_NET_TOTAL" (goods_receipt_id IN gor01.gorerid%type)
   RETURN grl01.grlllto%type
IS
    v_goods_receipt_net_total grl01.grlllto%type;
BEGIN
   SELECT SUM(grlllto) 
      INTO v_goods_receipt_net_total
      FROM grl01
      WHERE grlligr = goods_receipt_id;

    RETURN v_goods_receipt_net_total;
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
       /* Return an empty record. */
       RETURN v_goods_receipt_net_total;
END f_goods_receipt_net_total;
/

CREATE OR REPLACE FUNCTION  "F_BILL_NET_TOTAL" (bill_id IN bil01.billsid%type)
   RETURN bli01.blillto%type
IS
    v_bill_net_total bli01.blillto%type;
BEGIN
   SELECT SUM(blillto) 
      INTO v_bill_net_total
      FROM bli01
      WHERE blilibi = bill_id;

    RETURN v_bill_net_total;
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
       /* Return an empty record. */
       RETURN v_bill_net_total;
END f_bill_net_total;
/

CREATE OR REPLACE FUNCTION  "F_QUOTE_NET_TOTAL" (quote_id IN quo01.quoteid%type)
   RETURN qli01.qlillto%type
IS
    v_quote_net_total qli01.qlillto%type;
BEGIN
   SELECT SUM(qlillto) 
      INTO v_quote_net_total
      FROM qli01
      WHERE qlilibi = quote_id;
	RETURN v_quote_net_total;
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
       /* Return an empty record. */
       RETURN v_quote_net_total;
END f_quote_net_total;
/

CREATE OR REPLACE FUNCTION  "F_SALE_NET_TOTAL" (sale_id IN sor01.sordrid%type)
   RETURN sol01.solllto%type
IS
    v_sale_net_total sol01.solllto%type;
BEGIN
   SELECT SUM(solllto) 
      INTO v_sale_net_total
      FROM sol01
      WHERE solliso = sale_id;

    RETURN v_sale_net_total;
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
       /* Return an empty record. */
       RETURN v_sale_net_total;
END f_sale_net_total;
/

CREATE OR REPLACE FUNCTION  "F_SHIPMENT_NET_TOTAL" (shipment_id IN shi01.shipmid%type)
   RETURN shl01.shlllto%type
IS
    v_shipment_net_total shl01.shlllto%type;
BEGIN
   SELECT SUM(shlllto) 
      INTO v_shipment_net_total
      FROM SHL01
      WHERE shlinid = shipment_id;

    RETURN v_shipment_net_total;
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
       /* Return an empty record. */
       RETURN v_shipment_net_total;
END f_shipment_net_total;
/

CREATE OR REPLACE FUNCTION  "F_INVOICE_NET_TOTAL" (invoice_id IN inv01.invoiid%type)
   RETURN inl01.inlllto%type
IS
    v_invoice_net_total inl01.inlllto%type;
BEGIN
   SELECT SUM(inlllto) 
      INTO v_invoice_net_total
      FROM inl01
      WHERE inlinid = invoice_id;

    RETURN v_invoice_net_total;
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
       /* Return an empty record. */
       RETURN v_invoice_net_total;
END f_invoice_net_total;
/

/* Procedures */

CREATE OR REPLACE PROCEDURE  "JHE1_CHECK_DOUBLE_ENTRY" (jId IN jhe01.journid%TYPE)
IS
BEGIN
  IF (f_journal_count_debit (jId) < 1)  THEN
      RAISE_APPLICATION_ERROR(-20205 , 'Debit line is missing.Please enter at least one');
  ELSIF (f_journal_count_credit (jId) < 1) THEN
      RAISE_APPLICATION_ERROR(-20205 , 'Credit line is missing.Please enter at least one');
  END IF;
END;
/

CREATE OR REPLACE PROCEDURE  "JHE1_TOTAL_BALANCE_U" (journal_id IN jhe01.journid%TYPE)
 AS
  total_debit  jhe01.journtd%TYPE;
  total_credit jhe01.journtc%TYPE;
  balance jhe01.journbf%TYPE;
BEGIN
  total_debit := f_journal_total_debit (journal_id);
  total_credit := f_journal_total_credit (journal_id);
 IF(total_debit <> total_credit) THEN
  balance := 0;
 ELSE
   balance := 1;
 END IF;
 UPDATE jhe01 SET journtc = total_credit , journtd = total_debit , journbf = balance WHERE journid = journal_id;
END;
/

CREATE OR REPLACE PROCEDURE  "JHE1_POST_JOURNAL" (journalId IN jhe01.journid%TYPE)
AS
journal jli01.jrnliji%TYPE;
line jli01.jrnlili%TYPE;
account  jli01.jrnlacc%TYPE;
debit jli01.jrnlide%TYPE;
credit jli01.jrnlicr%TYPE;
status jhe01.journbf%TYPE;
currency jhe01.journcu%TYPE;
period jhe01.journpe%TYPE;
entity jhe01.journle%TYPE;
CURSOR c1 IS SELECT jli01.jrnliji as jrnliji, jli01.jrnlili as jrnlili, jli01.jrnlacc as jrnlacc, jli01.jrnlide as jrnlide,  jli01.jrnlicr as jrnlicr, jhe01.journcu as journcu, jhe01.journpe as journpe, jhe01.journle as journle
FROM jli01 JOIN jhe01 ON jli01.jrnliji=jhe01.journid WHERE jli01.jrnliji = journalId ; 
BEGIN
SELECT journbf INTO status FROM jhe01 WHERE journid = journalId;
IF (status > 0) THEN
OPEN c1;
LOOP
FETCH c1 INTO journal , line , account, debit, credit, currency, period, entity;
EXIT WHEN c1%NOTFOUND;
INSERT INTO bal01 (balanci,balanac,balancu,balanjl,balanji,balanpe,balanle,balanpd) values (balance_seq.nextval, account, currency, journal, line,  period, entity, debit);
INSERT INTO bal01 (balanci,balanac,balancu,balanjl,balanji,balanpe,balanle,balanpc) values (balance_seq.nextval, account, currency, journal, line,  period, entity, credit);
END LOOP;
CLOSE C1;
UPDATE jhe01 SET journst = 'P' WHERE journid = journalId;  
ELSE
RAISE_APPLICATION_ERROR(-20205 , 'Error while posting journal entry not balanced.');
END IF;
END;
/



/* Views */

CREATE OR REPLACE FORCE VIEW  "JHE01_VW" ("JOURNAL_ID", "CURRENCY", "ENTITY", "PERIOD", "STATUS", "SOURCE", "TOTAL_CREDIT", "TOTAL_DEBIT") AS 
SELECT  
T0.JOURNID "JOURNAL_ID",
T1.CURRENC "CURRENCY",
T2.LEGALNA "ENTITY",
T3.PERIODN "PERIOD",
DECODE (T0.JOURNST ,'U' , 'UNPOSTED' , 'P' , 'POSTED') "STATUS",
DECODE (T0.JOURNSO , 'M' , 'Manuel') "SOURCE",
T0.JOURNTC "TOTAL_CREDIT",
T0.JOURNTD "TOTAL_DEBIT"
FROM JHE01 T0 
LEFT OUTER JOIN CUR01 T1 ON T0.JOURNCU = T1.CURRENI
LEFT OUTER JOIN LEG01 T2 ON T0.JOURNLE = T2.LEGALID
LEFT OUTER JOIN PER01 T3 ON T0.JOURNPE = T3.PERIODI
ORDER BY T0.JOURNDA DESC
/

CREATE OR REPLACE FORCE VIEW  "BUD01_VW" ("BUDGET_ID", "NAME", "DESCRIPTION", "ENTITY", "CALENDAR", "STATUS") AS 
SELECT   
T0.BUDGETI "BUDGET_ID",
T0.BUDGETN "NAME",
T0.BUDGETD "DESCRIPTION",
T1.LEGALNA "ENTITY",
T2.CALENDN "CALENDAR",
DECODE (T0.BUDGETS ,'E' , 'ENABLED' , 'D' , 'DISABLED') "STATUS"
FROM BUD01 T0 
LEFT OUTER JOIN LEG01 T1 on T0.BUDGETL = T1.LEGALID
LEFT OUTER JOIN CAL01 T2 on T0.BUDGECA = T2.CALENID
ORDER BY T0.BUDGETA DESC
/

CREATE OR REPLACE FORCE VIEW  "TBA01_VW" ("CODE", "NAME", "TOTAL_DEBIT", "TOTAL_CREDIT", "BALANCE") AS 
SELECT DISTINCT ACC01.ACCNTNB AS "CODE",
    ACC01.ACCNTNM AS "NAME",
    NVL(SUM(BAL01.BALANPD) , 0) AS "TOTAL_DEBIT",
    NVL(SUM(BAL01.BALANPC) , 0) AS "TOTAL_CREDIT",
    NVL(SUM(BAL01.BALANPD) , 0) - NVL(SUM(BAL01.BALANPC) , 0) AS "BALANCE" 
 FROM PER01 PER01,
    LEG01 LEG01,
    BAL01 BAL01,
    ACC01 ACC01 
 WHERE ACC01.ACCNTCD=BAL01.BALANAC
    AND BAL01.BALANLE=LEG01.LEGALID
    AND BAL01.BALANPE=PER01.PERIODI
GROUP BY ACC01.ACCNTNB , ACC01.ACCNTNM
/

CREATE OR REPLACE FORCE VIEW  "RFQ01_VW" ("REQUEST_FOR_QUOTE_ID", "STATUS", "BUSINESS PARTNER", "ENTITY", "NET TOTAL") AS 
SELECT     
T0.RFQPKID "REQUEST_FOR_QUOTE_ID",
DECODE (T0.RFQSTAT,'C','CLOSED','O','OPEN') "STATUS",
T1.BUSINAM "BUSINESS PARTNER",
T2.LEGALNA "ENTITY",
F_RFQ_NET_TOTAL (T0.RFQPKID) "TOTAL NET"
FROM RFQ01 T0 
LEFT OUTER JOIN BPA01 T1 on T0.RFQBPAR = T1.BUSIPID
LEFT OUTER JOIN LEG01 T2 on T0.RFQLEGA = T2.LEGALID
ORDER BY T0.RFQRNUD DESC
/

CREATE OR REPLACE FORCE VIEW  "POV01_VW" ("PURCHASE_ORDER_ID", "STATUS", "BUSINESS PARTNER", "ENTITY", "NET TOTAL") AS 
SELECT     
T0.PORRNID "PURCHASE_ORDER_ID",
DECODE (T0.PORSTAT,'C','CLOSED','O','OPEN') "STATUS",
T1.BUSINAM "BUSINESS PARTNER",
T2.LEGALNA "ENTITY",
F_PURCHASE_NET_TOTAL (T0.PORRNID) "TOTAL NET"
FROM POR01 T0 
LEFT OUTER JOIN BPA01 T1 on T0.PORBPAR = T1.BUSIPID
LEFT OUTER JOIN LEG01 T2 on T0.PORLEGA = T2.LEGALID
ORDER BY T0.PORRNDA DESC
/

CREATE OR REPLACE FORCE VIEW  "GOR01_VW" ("GOODS_RECEIPTS_ID", "STATUS", "BUSINESS PARTNER", "ENTITY", "NET TOTAL") AS 
SELECT     
T0.GORERID "GOODS_RECEIPTS_ID",
DECODE (T0.GORSTAT,'C','CLOSED','O','OPEN') "STATUS",
T1.BUSINAM "BUSINESS PARTNER",
T2.LEGALNA "ENTITY",
F_GOODS_RECEIPT_NET_TOTAL (T0.GORERID) "TOTAL NET"
FROM GOR01 T0 
LEFT OUTER JOIN BPA01 T1 on T0.GORBPAR = T1.BUSIPID
LEFT OUTER JOIN LEG01 T2 on T0.GORLEGA = T2.LEGALID
ORDER BY T0.GORRNUD DESC
/

CREATE OR REPLACE FORCE VIEW  "BIL01_VW" ("BILL_ID", "STATUS", "BUSINESS PARTNER", "ENTITY", "NET TOTAL") AS 
SELECT     
T0.BILLSID "BILL_ID",
DECODE (T0.BILSTAT,'C','CLOSED','O','OPEN') "STATUS",
T1.BUSINAM "BUSINESS PARTNER",
T2.LEGALNA "ENTITY",
F_BILL_NET_TOTAL (T0.BILLSID) "TOTAL NET"
FROM BIL01 T0 
LEFT OUTER JOIN BPA01 T1 on T0.BILBPAR = T1.BUSIPID
LEFT OUTER JOIN LEG01 T2 on T0.BILLEGA = T2.LEGALID
ORDER BY T0.BILRNUD DESC
/

CREATE OR REPLACE FORCE VIEW  "QUO01_VW" ("QUOTE_ID", "STATUS", "BUSINESS PARTNER", "ENTITY", "NET TOTAL") AS 
SELECT     
T0.QUOTEID "QUOTE_ID",
DECODE (T0.QUOSTAT,'C','CLOSED','O','OPEN') "STATUS",
T1.BUSINAM "BUSINESS PARTNER",
T2.LEGALNA "ENTITY",
F_QUOTE_NET_TOTAL (T0.QUOTEID) "TOTAL NET"
FROM QUO01 T0 
LEFT OUTER JOIN BPA01 T1 on T0.QUOBPAR = T1.BUSIPID
LEFT OUTER JOIN LEG01 T2 on T0.QUOLEGA = T2.LEGALID
ORDER BY T0.QUORNUD DESC
/

CREATE OR REPLACE FORCE VIEW  "SOR01_VW" ("SALE_ORDER_ID", "STATUS", "BUSINESS PARTNER", "ENTITY", "NET TOTAL") AS 
SELECT     
T0.SORDRID "SALE_ORDER_ID",
DECODE (T0.SORSTAT,'C','CLOSED','O','OPEN') "STATUS",
T1.BUSINAM "BUSINESS PARTNER",
T2.LEGALNA "ENTITY",
F_SALE_NET_TOTAL (T0.SORDRID) "TOTAL NET"
FROM SOR01 T0 
LEFT OUTER JOIN BPA01 T1 on T0.SORBPAR = T1.BUSIPID
LEFT OUTER JOIN LEG01 T2 on T0.SORLEGA = T2.LEGALID
ORDER BY T0.SORRNUD DESC
/

CREATE OR REPLACE FORCE VIEW  "SHI01_VW" ("SHIPMENT_ID", "STATUS", "BUSINESS PARTNER", "ENTITY", "NET TOTAL") AS 
SELECT     
T0.SHIPMID "SHIPMENT_ID",
DECODE (T0.SHISTAT,'C','CLOSED','O','OPEN') "STATUS",
T1.BUSINAM "BUSINESS PARTNER",
T2.LEGALNA "ENTITY",
F_SHIPMENT_NET_TOTAL (T0.SHIPMID) "TOTAL NET"
FROM SHI01 T0 
LEFT OUTER JOIN BPA01 T1 on T0.SHIBPAR = T1.BUSIPID
LEFT OUTER JOIN LEG01 T2 on T0.SHILEGA = T2.LEGALID
ORDER BY T0.SHIRNUU DESC
/

CREATE OR REPLACE FORCE VIEW  "INV01_VW" ("INVOICE_ID", "STATUS", "BUSINESS PARTNER", "ENTITY", "NET TOTAL") AS 
SELECT     
T0.INVOIID "INVOICE_ID",
DECODE (T0.INVSTAT,'C','CLOSED','O','OPEN') "STATUS",
T1.BUSINAM "BUSINESS PARTNER",
T2.LEGALNA "ENTITY",
F_INVOICE_NET_TOTAL (T0.INVOIID) "TOTAL NET"
FROM INV01 T0 
LEFT OUTER JOIN BPA01 T1 on T0.INVBPAR = T1.BUSIPID
LEFT OUTER JOIN LEG01 T2 on T0.INVLEGA = T2.LEGALID
ORDER BY T0.INVRNUD DESC
/

/*
CREATE OR REPLACE FORCE VIEW  "SOV01_VW" ("SALE_ORDER_ID", "STATUS", "CUSTOMER", "ENTITY", "NET TOTAL") AS 
SELECT     
T0.SOHRNID "SALE_ORDER_ID",
DECODE (T0.SOHSTAT,'C','CLOSED','O','OPEN') "STATUS",
T1.CUSTNAM "CUSTOMER",
T2.LEGALNA "ENTITY",
F_SALE_NET_TOTAL (T0.SOHRNID) "TOTAL NET"
FROM SOH01 T0 
LEFT OUTER JOIN CUS01 T1 on T0.SOHCUST = T1.CUSTSID
LEFT OUTER JOIN LEG01 T2 on T0.SOHOLEG = T2.LEGALID
ORDER BY T0.SOHRNDA DESC
*/ 

