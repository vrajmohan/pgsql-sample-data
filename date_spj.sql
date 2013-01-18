-- This is the Suppliers-Parts-Projects example from C. J. Date, "An Introduction to Database Systems", 7th Edition.
-- The schema and data have been reproduced exactly, with the only difference being that invalid names 
-- like s#, p#,... have been replaced by snum, pnum,....

  CREATE TABLE s
  (
	snum CHAR(5) PRIMARY KEY,
	sname CHAR(20) NOT NULL,
	status INTEGER NOT NULL,
	city CHAR(15) NOT NULL
  );

  CREATE TABLE p
  (
	pnum CHAR(6) PRIMARY KEY,
	pname CHAR(20) NOT NULL,
	color CHAR(6) NOT NULL,
	weight NUMERIC(5,1) NOT NULL,
	city CHAR(15) NOT NULL
  );

  CREATE TABLE sp
  (
	snum CHAR(5) REFERENCES s,
	pnum CHAR(6) REFERENCES p,
	qty INTEGER NOT NULL,
	PRIMARY KEY (snum, pnum)
  );

  INSERT INTO s VALUES ('S1', 'Smith', 20, 'London');
  INSERT INTO s VALUES ('S2', 'Jones', 10, 'Paris');
  INSERT INTO s VALUES ('S3', 'Blake', 30, 'Paris');
  INSERT INTO s VALUES ('S4', 'Clark', 20, 'London');
  INSERT INTO s VALUES ('S5', 'Adams', 30, 'Athens');

  INSERT INTO p VALUES ('P1', 'Nut', 'Red', 12, 'London');
  INSERT INTO p VALUES ('P2', 'Bolt', 'Green', 17, 'Paris');
  INSERT INTO p VALUES ('P3', 'Screw', 'Blue', 17, 'Oslo');
  INSERT INTO p VALUES ('P4', 'Screw', 'Red', 14, 'London');
  INSERT INTO p VALUES ('P5', 'Cam', 'Blue', 12, 'Paris');
  INSERT INTO p VALUES ('P6', 'Cog', 'Red', 19, 'London');

  INSERT INTO sp VALUES ('S1', 'P1', 300);
  INSERT INTO sp VALUES ('S1', 'P2', 200);
  INSERT INTO sp VALUES ('S1', 'P3', 400);
  INSERT INTO sp VALUES ('S1', 'P4', 200);
  INSERT INTO sp VALUES ('S1', 'P5', 100);
  INSERT INTO sp VALUES ('S1', 'P6', 100);
  INSERT INTO sp VALUES ('S2', 'P1', 300);
  INSERT INTO sp VALUES ('S2', 'P2', 400);
  INSERT INTO sp VALUES ('S3', 'P2', 200);
  INSERT INTO sp VALUES ('S4', 'P2', 200);
  INSERT INTO sp VALUES ('S4', 'P4', 300);
  INSERT INTO sp VALUES ('S4', 'P5', 400);


  CREATE TABLE j
  (
	jnum CHAR(5) PRIMARY KEY,
	jname CHAR(20) NOT NULL,
	city CHAR(15) NOT NULL
  );

  CREATE TABLE spj
  (
	snum CHAR(5) REFERENCES s,
	pnum CHAR(6) REFERENCES p,
	jnum CHAR(5) REFERENCES j,
	qty INTEGER NOT NULL,
	PRIMARY KEY (snum, pnum, jnum)
  );

  INSERT INTO j VALUES('J1', 'Sorter', 'Paris');
  INSERT INTO j VALUES('J2', 'Display', 'Rome');
  INSERT INTO j VALUES('J3', 'OCR', 'Athens');
  INSERT INTO j VALUES('J4', 'Console', 'Athens');
  INSERT INTO j VALUES('J5', 'RAID', 'London');
  INSERT INTO j VALUES('J6', 'EDS', 'Oslo');
  INSERT INTO j VALUES('J7', 'Tape', 'London');

  INSERT INTO spj VALUES ('S1',  'P1',  'J1',  200);
  INSERT INTO spj VALUES ('S1',  'P1',  'J4',  700);
  INSERT INTO spj VALUES ('S2',  'P3',  'J1',  400);
  INSERT INTO spj VALUES ('S2',  'P3',  'J2',  200);
  INSERT INTO spj VALUES ('S2',  'P3',  'J3',  200);
  INSERT INTO spj VALUES ('S2',  'P3',  'J4',  500);
  INSERT INTO spj VALUES ('S2',  'P3',  'J5',  600);
  INSERT INTO spj VALUES ('S2',  'P3',  'J6',  400);
  INSERT INTO spj VALUES ('S2',  'P3',  'J7',  800);
  INSERT INTO spj VALUES ('S2',  'P5',  'J2',  100);
  INSERT INTO spj VALUES ('S3',  'P3',  'J1',  200);
  INSERT INTO spj VALUES ('S3',  'P4',  'J2',  500);
  INSERT INTO spj VALUES ('S4',  'P6',  'J3',  300);
  INSERT INTO spj VALUES ('S4',  'P6',  'J7',  300);
  INSERT INTO spj VALUES ('S5',  'P2',  'J2',  200);
  INSERT INTO spj VALUES ('S5',  'P2',  'J4',  100);
  INSERT INTO spj VALUES ('S5',  'P5',  'J5',  500);
  INSERT INTO spj VALUES ('S5',  'P5',  'J7',  100);
  INSERT INTO spj VALUES ('S5',  'P6',  'J2',  200);
  INSERT INTO spj VALUES ('S5',  'P1',  'J4',  100);
  INSERT INTO spj VALUES ('S5',  'P3',  'J4',  200);
  INSERT INTO spj VALUES ('S5',  'P4',  'J4',  800);
  INSERT INTO spj VALUES ('S5',  'P5',  'J4',  400);
  INSERT INTO spj VALUES ('S5',  'P6',  'J4',  500);
