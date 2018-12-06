/* -------------- creat tables -------------- */
CREATE TABLE auto
(
    SERIEN_NR INTEGER NOT NULL PRIMARY KEY,
    marke VARCHAR2(32 CHAR) NOT NULL,
    typ VARCHAR2(32 CHAR) NOT NULL
);

CREATE TABLE kunde
(
    KUNDN_NR INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR2(32 CHAR) NOT NULL,
    adresse VARCHAR2(32 CHAR) NOT NULL
);

CREATE TABLE verkaeufer
(
    NAME VARCHAR2(32 CHAR) NOT NULL PRIMARY KEY
);

CREATE TABLE kaufvertrag 
(
    vertrags_nr INTEGER NOT NULL PRIMARY KEY,
    datum VARCHAR2(32 CHAR) NOT NULL,
    Kunde_KUNDEN_NR INTEGER NOT NULL REFERENCES KUNDE (KUNDEN_NR),
    Verkaeufer_NAME VARCHAR2(32 CHAR) NOT NULL REFERENCES VERKAEUFER (NAME),
    Auto_SERIEN_NR INTEGER UNIQUE NOT NULL REFERENCES AUTO (SERIEN_NR)
);

/* -------------- insert datas -------------- */

INSERT INTO auto 
VALUES (123456, 'VW', 'Golf');
INSERT INTO auto
VALUES (345678, 'Opel', 'Astra');
INSERT INTO auto
VALUES (388721, 'VW', 'Golf');
INSERT INTO auto
VALUES (222245, 'VW', 'Polo');
INSERT INTO auto
VALUES (122154, 'Audi', 'A4');
INSERT INTO auto
VALUES (445321, 'Opel', 'Monza');

INSERT INTO kunde
VALUES (778007, 'Meier', 'Planetenweg 7');
INSERT INTO kunde
VALUES (776512, 'Müller', 'Altstadt 12');
INSERT INTO kunde
VALUES (837107, 'Steffen', 'Gartenstr. 7');
INSERT INTO kunde
VALUES (836512, 'Steffen', 'Augasse 12');

INSERT INTO verkaeufer
VALUES ('Schmid');
INSERT INTO verkaeufer
VALUES ('Plüss');
INSERT INTO verkaeufer
VALUES ('Frey');
INSERT INTO verkaeufer
VALUES ('Schenk');

INSERT INTO kaufvertrag
VALUES ( 778316, 20040423, 778007, 'Schmid', 123456);
INSERT INTO kaufvertrag
VALUES ( 778038, 20040807, 778007, 'Plüss', 345678);
INSERT INTO kaufvertrag
VALUES ( 727031, 20040617, 776512, 'Frey', 388721);
INSERT INTO kaufvertrag
VALUES ( 878325, 20040715, 837107, 'Schmid', 222245);
INSERT INTO kaufvertrag
VALUES ( 827014, 20041113, 836512, 'Frey', 122154);

/* -------------- creat VW tables -------------- */
CREATE TABLE VW
(
    SERIEN_NR INTEGER NOT NULL PRIMARY KEY,
    marke VARCHAR2(32 CHAR) NOT NULL,
    typ VARCHAR2(32 CHAR) NOT NULL
);

/* -------------- insert data into VW -------------- */
INSERT INTO VW (SERIEN_NR, marke, typ)
SELECT SERIEN_NR, marke, typ
FROM auto
WHERE auto.marke = 'VW'; 
/* -------------- update data in auto -------------- */
UPDATE auto 
SET serien_nr = 987654 
WHERE serien_nr = 445321;