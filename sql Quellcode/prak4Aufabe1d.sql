/* -------------- creat tables -------------- */
CREATE TABLE funktion
(
    FunktionsNr INTEGER NOT NULL PRIMARY KEY
);

CREATE TABLE person
(
	PersonalNr INTEGER NOT NULL PRIMARY KEY,
	Vorname VARCHAR2(32 CHAR) NOT NULL,
	Name VARCHAR2(32 CHAR) NOT NULL,
	Lohnstufe VARCHAR2(32 CHAR) NOT NULL,
	FunktionsNr INTEGER NOT NULL REFERENCES funktion (FunktionsNr)
);

CREATE TABLE kursthema 
(
	ThemenNr INTEGER NOT NULL PRIMARY KEY
);

CREATE TABLE kurs
(
	KursNr INTEGER NOT NULL PRIMARY KEY,
	Bezeichnung VARCHAR2(32 CHAR) NOT NULL,
	Ort VARCHAR2(32 CHAR) NOT NULL,
	ThemenNr INTEGER NOT NULL REFERENCES kursthema (ThemenNr)
);

CREATE TABLE fuer
(
	KursNr INTEGER NOT NULL PRIMARY KEY REFERENCES kurs (KursNr),
	FunktionsNr INTEGER NOT NULL REFERENCES funktion (FunktionsNr)
);

CREATE TABLE kursleiter
(
	KursleiterNr INTEGER NOT NULL PRIMARY KEY,
	Fachgebiet VARCHAR2(32 CHAR) NOT NULL
);

CREATE TABLE internerkursleiter
(
	KursleiterNr INTEGER NOT NULL PRIMARY KEY REFERENCES kursleiter (KursleiterNr),
	PersonalNr INTEGER NOT NULL UNIQUE REFERENCES person (PersonalNr),
	Dienstjahre INTEGER NOT NULL
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
	Kursdatum INTEGER NOT NULL
);