create SHEMA IF NOT EXIST praktikum4;
use praktikum4;

/* -------------- creat tables -------------- */
CREATE TABLE funktion
(
    FunktionsNr INTEGER NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXIST person
(
	PersonalNr INTEGER NOT NULL PRIMARY KEY,
	Vorname VARCHAR2(32 CHAR) NOT NULL,
	Name VARCHAR2(32 CHAR) NOT NULL,
	Lohnstufe VARCHAR2(32 CHAR) NOT NULL,
	FunktionsNr INTEGER NOT NULL REFERENCES funktion (FunktionsNr)
);

CREATE TABLE IF NOT EXIST kursthema 
(
	ThemenNr INTEGER NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXIST kurs
(
	KursNr INTEGER NOT NULL PRIMARY KEY,
	Bezeichnung VARCHAR2(32 CHAR) NOT NULL,
	Ort VARCHAR2(32 CHAR) NOT NULL,
	ThemenNr INTEGER NOT NULL REFERENCES kursthema (ThemenNr)
);

CREATE TABLE IF NOT EXIST fuer
(
	KursNr INTEGER NOT NULL PRIMARY KEY REFERENCES kurs (KursNr),
	FunktionsNr INTEGER NOT NULL REFERENCES funktion (FunktionsNr)
);

CREATE TABLE IF NOT EXIST kursleiter
(
	KursleiterNr INTEGER NOT NULL PRIMARY KEY,
	Fachgebiet VARCHAR2(32 CHAR) NOT NULL
);

CREATE TABLE IF NOT EXIST internerkursleiter
(
	KursleiterNr INTEGER NOT NULL PRIMARY KEY REFERENCES kursleiter (KursleiterNr),
	PersonalNr INTEGER NOT NULL UNIQUE REFERENCES person (PersonalNr),
	Dienstjahre INTEGER NOT NULL
);

CREATE TABLE IF NOT EXIST externerKursleiter
(
	KursleiterNr INTEGER NOT NULL PRIMARY KEY REFERENCES kursleiter (KursleiterNr),
	Vorname VARCHAR2(32 CHAR) NOT NULL,
	Name VARCHAR2(32 CHAR) NOT NULL,
	Firmenname VARCHAR2(32 CHAR) NOT NULL
);

CREATE TABLE IF NOT EXIST kursteilnahme
(
	PersonalNr INTEGER NOT NULL,
	KursleiterNr INTEGER NOT NULL,
	KursNr INTEGER NOT NULL,
	Kursdatum INTEGER NOT NULL,
	PRIMARY KEY (PersonalNr, KursleiterNr, KursNr),
	FOREIGN KEY (PersonalNr) REFERENCES person (PersonalNr),
	FOREIGN KEY (KursleiterNr) REFERENCES kursleiter (KursleiterNr),
	FOREIGN KEY (KursNr) REFERENCES kurs (KursNr)
);