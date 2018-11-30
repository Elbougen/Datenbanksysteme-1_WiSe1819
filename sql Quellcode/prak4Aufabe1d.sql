/* -------------- creat tables -------------- */
CREATE TABLE person
(
    PersonalNr INTEGER NOT NULL PRIMARY KEY,
    Vorname VARCHAR2(32 CHAR) NOT NULL,
    Name VARCHAR2(32 CHAR) NOT NULL,
	Lohnstufe VARCHAR2(32 CHAR) NOT NULL,
	FunktionsNr INTEGER NOT NULL REFERENCES funktion (FunktionsNr)
);

CREATE TABLE funktion
(
    FunktionsNr INTEGER NOT NULL PRIMARY KEY
);

CREATE TABLE kurs
(
    KursNr INTEGER NOT NULL PRIMARY KEY,
	Bezeichnung VARCHAR2(32 CHAR) NOT NULL,
	Ort VARCHAR2(32 CHAR) NOT NULL,
	ThemenNr INTEGER NOT NULL REFERENCES ThemenNr (ThemenNr)
);

CREATE TABLE kursthema 
(
    ThemenNr INTEGER NOT NULL PRIMARY KEY
);
CREATE TABLE fuer
(
    KursNr INTEGER NOT NULL PRIMARY KEY,
	FunktionsNr INTEGER NOT NULL REFERENCES funktion (FunktionsNr)
);
CREATE TABLE internerkursleiter
(
    PersonalNr INTEGER NOT NULL PRIMARY KEY,
	Dienstjahre INTEGER NOT NULL,
	KursleiterNr INTEGER NOT NULL PRIMARY KEY REFERENCES kursleiter (KursleiterNr)
);
CREATE TABLE kursleiter
(
    KursleiterNr INTEGER NOT NULL PRIMARY KEY,
	Fachgebiet VARCHAR2(32 CHAR) NOT NULL
);
CREATE TABLE externerKursleiter
(
    KursleiterNr INTEGER NOT NULL PRIMARY KEY REFERENCES kursleiter (KursleiterNr),
	Vorname VARCHAR2(32 CHAR) NOT NULL,
	Name VARCHAR2(32 CHAR) NOT NULL,
	Firmenname VARCHAR2(32 CHAR) NOT NULL
);
CREATE TABLE kursteilnahme
(
    PersonalNr INTEGER NOT NULL PRIMARY KEY REFERENCES person (PersonalNr),
	KursleiterNr INTEGER NOT NULL PRIMARY KEY REFERENCES kursleiter (KursleiterNr),
	KursNr INTEGER NOT NULL PRIMARY KEY REFERENCES kurs (KursNr)
);
