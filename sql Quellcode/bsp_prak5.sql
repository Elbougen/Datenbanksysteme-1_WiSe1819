DROP TABLE Kursbesuche;
DROP TABLE Kurskontrolle;
DROP TABLE Personen;
DROP TABLE Kurse;
DROP TABLE Kursthemen;
DROP TABLE Kursleiter;
DROP TABLE Funktionen;

CREATE TABLE KURSLEITER
 (KLNR  NUMBER(3) NOT NULL
 ,STATUS  VARCHAR2(1) NOT NULL
 ,PNR  NUMBER(6)
 ,NAME  VARCHAR2(20) NOT NULL
 ,VORNAME  VARCHAR2(15) NOT NULL
 ,FIRMA  VARCHAR2(20)
 ,KURSERFAHRUNG  NUMBER(2)
 );

CREATE TABLE KURSTHEMEN
 (TNR  NUMBER(2) NOT NULL
 ,THEMENGEBIET  VARCHAR2(40) NOT NULL
 );

CREATE TABLE PERSONEN
 (PNR  NUMBER(6) NOT NULL
 ,NAME  VARCHAR2(20) NOT NULL
 ,VORNAME  VARCHAR2(15) NOT NULL
 ,FNR  NUMBER(2) NOT NULL
 ,LOHNSTUFE  NUMBER(1) NOT NULL
 );

CREATE TABLE FUNKTIONEN
 (FNR  NUMBER(2) NOT NULL
 ,FUNKTION  VARCHAR2(25) NOT NULL
 );

CREATE TABLE KURSBESUCHE
 (PNR  NUMBER(6) NOT NULL
 ,KNR  NUMBER(3) NOT NULL
 ,KLNR  NUMBER(3) NOT NULL
 ,DATUM  DATE NOT NULL
 );

CREATE TABLE KURSKONTROLLE
 (KNR  NUMBER(3) NOT NULL
 ,FNR  NUMBER(2) NOT NULL
 );

CREATE TABLE KURSE
 (KNR  NUMBER(3) NOT NULL
 ,KURSBEZEICHNUNG  VARCHAR2(40) NOT NULL
 ,KURSORT  VARCHAR2(10) NOT NULL
 ,TNR  NUMBER(2) NOT NULL
 );

CREATE  UNIQUE INDEX IX_KURSTHEMEN_THEMENGEBIET ON KURSTHEMEN
 (THEMENGEBIET);

CREATE  INDEX IX_BEZ_01 ON PERSONEN
 (FNR);

CREATE  UNIQUE INDEX IX_FUNKTIONEN_FUNKTION ON FUNKTIONEN
 (FUNKTION);

CREATE  INDEX IX_BEZ_04 ON KURSBESUCHE
 (KNR);

CREATE  INDEX IX_BEZ_05 ON KURSBESUCHE
 (PNR);

CREATE  INDEX IX_BEZ_06 ON KURSBESUCHE
 (KLNR);

CREATE  INDEX IX_BEZ_02 ON KURSKONTROLLE
 (FNR);

CREATE  INDEX IX_BEZ_07 ON KURSKONTROLLE
 (KNR);

CREATE  INDEX IX_BEZ_03 ON KURSE
 (TNR);

ALTER TABLE KURSLEITER
 ADD CONSTRAINT ID_KURSLEITER PRIMARY KEY 
  (KLNR) ;

ALTER TABLE KURSTHEMEN
 ADD CONSTRAINT ID_KURSTHEMEN PRIMARY KEY 
  (TNR) ;

ALTER TABLE PERSONEN
 ADD CONSTRAINT ID_PERSONEN PRIMARY KEY 
  (PNR) ;

ALTER TABLE FUNKTIONEN
 ADD CONSTRAINT ID_FUNKTIONEN PRIMARY KEY 
  (FNR) ;

ALTER TABLE KURSBESUCHE
 ADD CONSTRAINT ID_KURSBESUCHE PRIMARY KEY 
  (PNR
  ,KNR
  ,KLNR) ;

ALTER TABLE KURSKONTROLLE
 ADD CONSTRAINT ID_KURSKONTROLLE PRIMARY KEY 
  (KNR
  ,FNR) ;

ALTER TABLE KURSE
 ADD CONSTRAINT ID_KURSE PRIMARY KEY 
  (KNR) ;
       
ALTER TABLE PERSONEN
 ADD CONSTRAINT BEZ_01
 FOREIGN KEY 
  (FNR)
 REFERENCES FUNKTIONEN
  (FNR)
;

ALTER TABLE KURSBESUCHE
 ADD CONSTRAINT BEZ_06
 FOREIGN KEY 
  (KLNR)
 REFERENCES KURSLEITER
  (KLNR)
 ADD CONSTRAINT BEZ_05
 FOREIGN KEY 
  (PNR)
 REFERENCES PERSONEN
  (PNR)
 ADD CONSTRAINT BEZ_04
 FOREIGN KEY 
  (KNR)
 REFERENCES KURSE
  (KNR)
;

ALTER TABLE KURSKONTROLLE
 ADD CONSTRAINT BEZ_02
 FOREIGN KEY 
  (FNR)
 REFERENCES FUNKTIONEN
  (FNR)
 ADD CONSTRAINT BEZ_07
 FOREIGN KEY 
  (KNR)
 REFERENCES KURSE
  (KNR)
;

ALTER TABLE KURSE
 ADD CONSTRAINT BEZ_03
 FOREIGN KEY 
  (TNR)
 REFERENCES KURSTHEMEN
  (TNR)
;

INSERT INTO Funktionen (FNr,Funktion)
VALUES (1,'Vorarbeiter');
INSERT INTO Funktionen (FNr,Funktion)
VALUES (2,'Meister');
INSERT INTO Funktionen (FNr,Funktion)
VALUES (3,'Chemiker');
INSERT INTO Funktionen (FNr,Funktion)
VALUES (4,'Bereichsleiter');
INSERT INTO Funktionen (FNr,Funktion)
VALUES (5,'Informatiker');

INSERT INTO Kursleiter (KlNr,Status,PNr,Name,Vorname,Firma,Kurserfahrung)
VALUES (1,'I',345727,'Maier','Josef',NULL,3);
INSERT INTO Kursleiter (KlNr,Status,PNr,Name,Vorname,Firma,Kurserfahrung)
VALUES (3,'I',232452,'Müller','Hugo',NULL,1);
INSERT INTO Kursleiter (KlNr,Status,PNr,Name,Vorname,Firma,Kurserfahrung)
VALUES (4,'I',233456,'Müller','Franz',NULL,4);
INSERT INTO Kursleiter (KlNr,Status,PNr,Name,Vorname,Firma,Kurserfahrung)
VALUES (2,'E',NULL,'Suter','Rolf','GigaSoft',NULL);
INSERT INTO Kursleiter (KlNr,Status,PNr,Name,Vorname,Firma,Kurserfahrung)
VALUES (5,'E',NULL,'Vogt','Peter','Quasar',NULL);
INSERT INTO Kursleiter (KlNr,Status,PNr,Name,Vorname,Firma,Kurserfahrung)
VALUES (6,'I',845622,'Huber','Walter',NULL,3);
INSERT INTO Kursleiter (KlNr,Status,PNr,Name,Vorname,Firma,Kurserfahrung)
VALUES (7,'E',NULL,'Krieg','Stefan','Funkenflug',NULL);
INSERT INTO Kursleiter (KlNr,Status,PNr,Name,Vorname,Firma,Kurserfahrung)
VALUES (8,'E',NULL,'Freundlich','Andreas','Harmonie',NULL);

INSERT INTO Kursthemen (TNr,Themengebiet)
VALUES (1,'Sicherheit und Umweltschutz');
INSERT INTO Kursthemen (TNr,Themengebiet)
VALUES (2,'Führung und Zusammenarbeit');
INSERT INTO Kursthemen (TNr,Themengebiet)
VALUES (3,'PC-Kurse');
INSERT INTO Kursthemen (TNr,Themengebiet)
VALUES (4,'Arbeitstechnik');
INSERT INTO Kursthemen (TNr,Themengebiet)
VALUES (5,'Projekte');
INSERT INTO Kursthemen (TNr,Themengebiet)
VALUES (6,'Schulung');

INSERT INTO Kurse (KNr,Kursbezeichnung,Kursort,TNr)
VALUES (123,'Arbeitshygiene','2510.EG.25',1);
INSERT INTO Kurse (KNr,Kursbezeichnung,Kursort,TNr)
VALUES (562,'Führen einer Gruppe','1010.4.08',2);
INSERT INTO Kurse (KNr,Kursbezeichnung,Kursort,TNr)
VALUES (234,'Präsentationstechnik','1010.4.08',4);
INSERT INTO Kurse (KNr,Kursbezeichnung,Kursort,TNr)
VALUES (341,'Textverarbeitung','2015.1.10',3);
INSERT INTO Kurse (KNr,Kursbezeichnung,Kursort,TNr)
VALUES (245,'Kostenschätzung','1010.2.05',5);
INSERT INTO Kurse (KNr,Kursbezeichnung,Kursort,TNr)
VALUES (412,'Tabellenkalkulation','2015.1.10',3);
INSERT INTO Kurse (KNr,Kursbezeichnung,Kursort,TNr)
VALUES (454,'Elektrostatische Aufladung','4001.EG.20',1);
INSERT INTO Kurse (KNr,Kursbezeichnung,Kursort,TNr)
VALUES (255,'Datenbanken','2015.2.05',3);
INSERT INTO Kurse (KNr,Kursbezeichnung,Kursort,TNr)
VALUES (455,'Terminplanung','1010.4.08',5);
INSERT INTO Kurse (KNr,Kursbezeichnung,Kursort,TNr)
VALUES (345,'Schwierige Gespräche führen','1010.2.05',2);
INSERT INTO Kurse (KNr,Kursbezeichnung,Kursort,TNr)
VALUES (283,'Abfallentsorgung','4001.EG.20',1);
INSERT INTO Kurse (KNr,Kursbezeichnung,Kursort,TNr)
VALUES (776,'Wartung von Anlagen','1010.2.05',4);

INSERT INTO Personen (PNr,Name,Vorname,FNr,Lohnstufe)
VALUES(100001,'Steffen','Felix',3,5);
INSERT INTO Personen (PNr,Name,Vorname,FNr,Lohnstufe)
VALUES(232452,'Müller','Hugo',1,1);
INSERT INTO Personen (PNr,Name,Vorname,FNr,Lohnstufe)
VALUES(334643,'Meier','Hans',2,5);
INSERT INTO Personen (PNr,Name,Vorname,FNr,Lohnstufe)
VALUES(567231,'Schmid','Beat',3,4);
INSERT INTO Personen (PNr,Name,Vorname,FNr,Lohnstufe)
VALUES(345727,'Steiner','René',5,5);
INSERT INTO Personen (PNr,Name,Vorname,FNr,Lohnstufe)
VALUES(233456,'Müller','Franz',4,7);
INSERT INTO Personen (PNr,Name,Vorname,FNr,Lohnstufe)
VALUES(132442,'Osswald','Kurt',1,2);
INSERT INTO Personen (PNr,Name,Vorname,FNr,Lohnstufe)
VALUES(345678,'Metzger','Paul',1,1);
INSERT INTO Personen (PNr,Name,Vorname,FNr,Lohnstufe)
VALUES(344556,'Scherrer','Daniel',2,4);
INSERT INTO Personen (PNr,Name,Vorname,FNr,Lohnstufe)
VALUES(845622,'Huber','Walter',4,8);
INSERT INTO Personen (PNr,Name,Vorname,FNr,Lohnstufe)
VALUES(625342,'Gerber','Roland',3,4);

INSERT INTO Kurskontrolle (FNr,KNr) VALUES (1,123);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (2,123);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (3,123);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (4,123);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (2,562);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (3,562);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (4,562);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (3,234);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (5,234);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (3,341);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (3,245);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (4,245);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (2,412);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (3,412);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (1,454);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (2,454);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (3,454);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (4,454);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (3,255);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (3,455);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (4,455);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (4,345);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (1,283);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (2,283);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (3,283);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (1,776);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (2,776);
INSERT INTO Kurskontrolle (FNr,KNr) VALUES (5,245);

INSERT INTO Kursbesuche (PNr,KNr,KlNr,Datum)
VALUES (100001,245,4,'23-Jun-12');
INSERT INTO Kursbesuche (PNr,KNr,KlNr,Datum)
VALUES (100001,412,2,'7-Aug-10');
INSERT INTO Kursbesuche (PNr,KNr,KlNr,Datum)
VALUES (100001,454,7,'12-Jan-11');
INSERT INTO Kursbesuche (PNr,KNr,KlNr,Datum)
VALUES (345678,123,6,'3-Feb-11');
INSERT INTO Kursbesuche (PNr,KNr,KlNr,Datum)
VALUES (345678,776,3,'15-Apr-12');
INSERT INTO Kursbesuche (PNr,KNr,KlNr,Datum)
VALUES (344556,412,2,'10-Jun-11');
INSERT INTO Kursbesuche (PNr,KNr,KlNr,Datum)
VALUES (334643,412,2,'7-Aug-10');
INSERT INTO Kursbesuche (PNr,KNr,KlNr,Datum)
VALUES (625342,255,1,'21-Jul-12');
INSERT INTO Kursbesuche (PNr,KNr,KlNr,Datum)
VALUES (845622,345,8,'11-Nov-11');
INSERT INTO Kursbesuche (PNr,KNr,KlNr,Datum)
VALUES (100001,255,1,'21-Jul-12');
INSERT INTO Kursbesuche (PNr,KNr,KlNr,Datum)
VALUES (232452,454,7,'17-Sep-11');
INSERT INTO Kursbesuche (PNr,KNr,KlNr,Datum)
VALUES (132442,454,7,'17-Sep-11');
INSERT INTO Kursbesuche (PNr,KNr,KlNr,Datum)
VALUES (345678,454,7,'17-Sep-11');
INSERT INTO Kursbesuche (PNr,KNr,KlNr,Datum)
VALUES (345678,123,4,'25-Aug-12');

COMMIT;
