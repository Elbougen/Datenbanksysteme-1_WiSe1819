/* a) ---------------------------------------- */
SELECT * 
FROM kursthemen
ORDER BY tnr

/* b) ---------------------------------------- */
SELECT pnr, name, vorname, (lohnstufe - 1)*10000 + 50000 AS Gehalt
FROM personen
ORDER BY Gehalt

/* c) ---------------------------------------- */
SELECT name, vorname, funktion
FROM personen join funktionen using (fnr)
ORDER BY funktion

/* d) ---------------------------------------- */
SELECT knr, COUNT(pnr) AS Anzahl_Kursbesucher, MIN(datum) AS Frühester_Kursbegin, MAX(datum) AS Spätester_Kursbegin
FROM kursbesuche
GROUP BY knr
ORDER BY knr

/* e) ---------------------------------------- */
SELECT COUNT(DISTINCT knr)
FROM kursbesuche

/* f) ---------------------------------------- */
SELECT pnr, name, vorname
FROM personen
WHERE fnr = 1
ORDER BY pnr

/* g) ---------------------------------------- */
SELECT pnr, name, vorname
FROM personen P
WHERE name != 'Steffen' AND 
        (
            lohnstufe > 4 OR
            fnr = (SELECT fnr FROM funktionen WHERE funktion = 'Meister') OR
            fnr = (SELECT fnr FROM funktionen WHERE funktion = 'Meister')
        )
ORDER BY pnr
        
/* h) ---------------------------------------- */
SELECT funktion
FROM funktionen
ORDER BY funktion asc   /*aufsteigen*/

SELECT funktion
FROM funktionen
ORDER BY funktion desc  /*abfsteigen*/

/* i) ---------------------------------------- */
SELECT pnr, knr, datum
FROM kursbesuche
ORDER BY pnr asc, knr asc, datum desc

/* j) ---------------------------------------- */
SELECT avg((lohnstufe - 1)*10000 + 50000) AS Durchschnittsgehalt, fnr, COUNT(pnr) AS Anzahl_Personen
FROM personen
GROUP BY fnr
ORDER BY Durchschnittsgehalt

/* k) ---------------------------------------- */
SELECT pnr, COUNT(knr)
FROM kursbesuche
WHERE datum > '01.10.1991'
GROUP BY pnr
HAVING COUNT(knr)>1
ORDER BY pnr

/* l) ---------------------------------------- */

/* m) ---------------------------------------- */

/* 3. ---------------------------------------- */
SELECT pnr, name, vorname, COUNT(knr)
FROM kurskontrolle A, personen P
WHERE(pnr, knr) NOT IN
        (SELECT pnr, knr FROM kursbesuche)
    AND A.fnr = P.fnr
GROUP BY pnr, name, vorname
HAVING COUNT(knr)>3
ORDER BY pnr