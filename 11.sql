CREATE TABLE DEPARTAMENTE
(ID_DEPARTAMENT NUMBER(4),
NUME_DEPARTAMENT VARCHAR(30),
ID_DIRECTOR NUMBER(4),
ID_CLUB NUMBER(4),

PRIMARY KEY(ID_DEPARTAMENT));

CREATE TABLE MEMBRI_ACTIVI
(ID_MEMBRU NUMBER(4),
NUME VARCHAR(20) NOT NULL,
PRENUME VARCHAR(20),
EMAIL CHAR(30),
NR_TEL VARCHAR(15),
DATA_ADERARE DATE DEFAULT SYSDATE,
ID_DEPARTAMENT NUMBER(4),

PRIMARY KEY(ID_MEMBRU),
CONSTRAINT FK_ID_DEPARTAMENT FOREIGN KEY(ID_DEPARTAMENT)
REFERENCES DEPARTAMENTE(ID_DEPARTAMENT),
CONSTRAINT U_NUME_PRENUME UNIQUE(NUME, PRENUME),
CONSTRAINT U_EMAIL UNIQUE(EMAIL));

CREATE TABLE PROIECT
(ID_PROIECT NUMBER(4),
TITLU_PROIECT VARCHAR(30),
SCOP VARCHAR(20),
DATA_DESFASURARE DATE,
REPREZENTANT_PROIECTE NUMBER(4),
REPREZENTANT_PR NUMBER(4),
REPREZENTANT_HR NUMBER(4),
REPREZENTANT_MK NUMBER(4),

PRIMARY KEY(ID_PROIECT),
CONSTRAINT FK_REPREZENTANT_PROIECTE FOREIGN KEY(REPREZENTANT_PROIECTE)
REFERENCES MEMBRI_ACTIVI(ID_MEMBRU),
CONSTRAINT FK_REPREZENTANT_PR FOREIGN KEY(REPREZENTANT_PR)
REFERENCES MEMBRI_ACTIVI(ID_MEMBRU),
CONSTRAINT FK_REPREZENTANT_HR FOREIGN KEY(REPREZENTANT_HR)
REFERENCES MEMBRI_ACTIVI(ID_MEMBRU),
CONSTRAINT FK_REPREZENTANT_MK FOREIGN KEY(REPREZENTANT_MK)
REFERENCES MEMBRI_ACTIVI(ID_MEMBRU));

CREATE TABLE TASK 
(ID_TASK NUMBER(4),
TITLU_TASK VARCHAR(30) NOT NULL,
STATUS VARCHAR(20),
DEADLINE DATE,
ID_PROIECT NUMBER(4),
ID_MEMBRU NUMBER(4),

PRIMARY KEY(ID_TASK),
CONSTRAINT FK_ID_PROIECT FOREIGN KEY(ID_PROIECT)
REFERENCES PROIECT(ID_PROIECT),
CONSTRAINT FK_ID_MEMBRU FOREIGN KEY(ID_MEMBRU)
REFERENCES MEMBRI_ACTIVI(ID_MEMBRU)
);

CREATE TABLE PACHET_DE_FINANTARE
(ID_PACHET NUMBER(2),
NUME_PACHET VARCHAR(20),
PROMOVARE_ONLINE VARCHAR(5),
AFISARE_SIGLA VARCHAR(5),
ROLL_UP VARCHAR(5),
DISTRIBUIRE_FLYERE VARCHAR(5),
COMUNICAT_PRESA VARCHAR(5),
PROMOVARE_SITE VARCHAR(5),
INVITARE_REPREZENTANT VARCHAR(5),
ALEGE_PROIECT VARCHAR(5),

PRIMARY KEY(ID_PACHET),
CONSTRAINT U_NUME_PACHET UNIQUE(NUME_PACHET));

INSERT INTO PACHET_DE_FINANTARE(ID_PACHET, NUME_PACHET, PROMOVARE_ONLINE,
                                AFISARE_SIGLA, ROLL_UP)
VALUES(1, 'Sponsor', 'Da', 'Da', 'Da');

INSERT INTO PACHET_DE_FINANTARE(ID_PACHET, NUME_PACHET, PROMOVARE_ONLINE,
                                AFISARE_SIGLA, ROLL_UP, DISTRIBUIRE_FLYERE,
                                COMUNICAT_PRESA, PROMOVARE_SITE)
VALUES(2, 'Partener', 'Da', 'Da', 'Da', 'Da', 'Da', 'Da');

INSERT INTO PACHET_DE_FINANTARE
VALUES(3, 'Premium', 'Da', 'Da', 'Da', 'Da', 'Da', 'Da', 'Da', 'Da');

CREATE TABLE SPONSORI
(ID_SPONSOR NUMBER(4),
NUME_SPONSOR VARCHAR(30),
ID_PACHET NUMBER(2),
SUMA NUMBER(5),
ID_PROIECT NUMBER(4),

PRIMARY KEY(ID_SPONSOR),
CONSTRAINT FK_ID_PACHET FOREIGN KEY(ID_PACHET)
REFERENCES PACHET_DE_FINANTARE(ID_PACHET),
CONSTRAINT CK_SUMA CHECK(SUMA > 0),
CONSTRAINT FK_ID_PROIECT_SPONSORI FOREIGN KEY(ID_PROIECT)
REFERENCES PROIECT(ID_PROIECT));

CREATE TABLE FILIALE
(ID_FILIALA NUMBER(4),
NUME_FILIALA VARCHAR(30),

PRIMARY KEY(ID_FILIALA),
CONSTRAINT U_NUME_FILIALA UNIQUE(NUME_FILIALA));

CREATE TABLE CLUBURI
(ID_CLUB NUMBER(4),
NUME_CLUB VARCHAR(20),
ID_FILIALA NUMBER(4),

PRIMARY KEY(ID_CLUB),
CONSTRAINT U_NUME_CLUB UNIQUE(NUME_CLUB));

CREATE TABLE MEMBRI_ALUMNI
(ID_MEMBRU NUMBER(4),
NUME VARCHAR(20) NOT NULL,
PRENUME VARCHAR(20),
EMAIL CHAR(30),
NR_TEL VARCHAR(15),
DATA_ADERARE DATE,
DATA_RETRAGERE DATE,

PRIMARY KEY(ID_MEMBRU),
CONSTRAINT U_NUME_PRENUME_ALUMNI UNIQUE(NUME, PRENUME),
CONSTRAINT U_EMAIL_ALUMNI UNIQUE(EMAIL));

ALTER TABLE DEPARTAMENTE
ADD CONSTRAINT FK_CLUB_ID  FOREIGN KEY(ID_CLUB) 
REFERENCES CLUBURI(ID_CLUB);

INSERT INTO FILIALE
VALUES(SEQ.NEXTVAL, 'Iasi');

INSERT INTO CLUBURI
VALUES(SEQ.NEXTVAL, 'Iasi', 1);

INSERT INTO CLUBURI
VALUES(SEQ.NEXTVAL, 'Vaslui', 1);

INSERT INTO CLUBURI
VALUES(SEQ.NEXTVAL, 'Roman', 1);

INSERT INTO DEPARTAMENTE
VALUES(SEQ.NEXTVAL, 'Scriere de Proiecte', 10, 2);

INSERT INTO DEPARTAMENTE
VALUES(SEQ.NEXTVAL, 'Relatii Publice', 11, 2);

INSERT INTO DEPARTAMENTE
VALUES(SEQ.NEXTVAL, 'Resurse Umane', 12, 2);

INSERT INTO DEPARTAMENTE
VALUES(SEQ.NEXTVAL, 'Marketing', 13, 2);

INSERT INTO DEPARTAMENTE
VALUES(SEQ.NEXTVAL, 'Consiliu Executiv', 14, 2);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Baciu', 'Marius', '13-JUN-21', 5);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Craciun', 'Dana', '16-MAR-22', 6);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Cirlan', 'Denisa', '22-JAN-21', 7);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Ion', 'Marian', '17-MAR-22', 8);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Popescu', 'Sara', '10-MAY-21', 9);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Vlad', 'Andreea', '16-APR-23', 5);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Dinu', 'Tudor', '22-JUN-23', 6);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Pinzaru', 'Alex', '23-JUL-23', 7);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Gologan', 'Ianis', '13-DEC-22', 8);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Grigore', 'Teodora', '19-MAY-20', 9);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Valeanu', 'Teodora', '22-JAN-23', 5);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Penisoara', 'Tudor', '18-MAY-19', 6);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Pinzaru', 'Andreea', '23-JUL-23', 7);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Negara', 'Daniel', '12-JUL-22', 8);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Florea', 'Dragos', '22-MAR-20', 9);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Maftei', 'Ernest', '22-JAN-23', 5);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Iordan', 'Tristana', '18-MAY-19', 6);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Perju', 'Andreea', '23-JUL-23', 7);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Gheorghe', 'Flavia', '12-JUL-22', 8);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Feraru', 'Catalina', '22-MAR-20', 9);

INSERT INTO MEMBRI_ALUMNI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, DATA_RETRAGERE)
VALUES(SEQ.NEXTVAL, 'Anton', 'Florin', '14-APR-19', '16-SEP-22');

INSERT INTO MEMBRI_ALUMNI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, DATA_RETRAGERE)
VALUES(SEQ.NEXTVAL, 'Gheorghe', 'Andrei', '14-MAY-18', '17-OCT-21');

INSERT INTO MEMBRI_ALUMNI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, DATA_RETRAGERE)
VALUES(SEQ.NEXTVAL, 'Penisoara', 'Gelu', '19-APR-19', '20-OCT-22');

INSERT INTO MEMBRI_ALUMNI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, DATA_RETRAGERE)
VALUES(SEQ.NEXTVAL, 'Dan', 'Gicu', '4-Feb-20', '28-SEP-22');

INSERT INTO MEMBRI_ALUMNI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, DATA_RETRAGERE)
VALUES(SEQ.NEXTVAL, 'Alexe', 'Mihai', '14-APR-20', '8-MAY-22');

INSERT INTO PROIECT
VALUES(SEQ.NEXTVAL, 'ISMUN', 'Academic', '16-AUG-23', 15, 16, 17, 18);

INSERT INTO PROIECT
VALUES(SEQ.NEXTVAL, 'Viata pe Bune', 'Informativ', '6-JUL-23', 21, 22, 23, 24);

INSERT INTO PROIECT
VALUES(SEQ.NEXTVAL, 'Shelter Stories', 'Caritabil', '23-MAR-23', 26, 27, 28, 29);

INSERT INTO DEPARTAMENTE
VALUES(SEQ.NEXTVAL, 'Scriere de Proiecte', 89, 3);

INSERT INTO DEPARTAMENTE
VALUES(SEQ.NEXTVAL, 'Relatii Publice', 90, 3);

INSERT INTO DEPARTAMENTE
VALUES(SEQ.NEXTVAL, 'Resurse Umane', 91, 3);

INSERT INTO DEPARTAMENTE
VALUES(SEQ.NEXTVAL, 'Marketing', 92, 3);

INSERT INTO DEPARTAMENTE
VALUES(SEQ.NEXTVAL, 'Consiliu Executiv', 93, 3);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Mocanu', 'Andrei', '14-Apr-21', 84);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Mocanu', 'Matei', '12-JAN-22', 85);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Praslea', 'Edesia', '12-JAN-21', 86);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Paslaru', 'Marisa', '3-MAR-22', 87);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Spuma', 'Ioana', '10-NOV-21', 88);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Boicu', 'Ionut', '16-APR-20', 84);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Amaritei', 'Irina', '22-JUN-21', 85);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Arhire', 'Anemona', '23-DEC-23', 86);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Popa', 'Denis', '13-DEC-22', 87);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Mihalcea', 'Mihai', '10-MAY-20', 88);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Alexe', 'Alex', '18-JAN-23', 84);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Badac', 'Maria', '2-MAY-19', 85);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Streja', 'Sandica', '23-JUL-23', 86);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Bradea', 'Codrin', '12-JUL-22', 87);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Badea', 'Ovidiu', '4-MAR-20', 88);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Balu', 'Roberta', '12-JAN-21', 84);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Bumbu', 'Raluca', '13-MAY-19', 85);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Nimirceag', 'Loredana', '22-APR-23', 86);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Gheorghe', 'Lucian', '12-OCT-22', 87);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Lungu', 'Rares', '19-MAR-21', 88);

INSERT INTO PROIECT
VALUES(SEQ.NEXTVAL, 'Christmas Groove', 'Caritabil', '20-DEC-23', 94, 95, 96, 97);

INSERT INTO PROIECT
VALUES(SEQ.NEXTVAL, 'Bonding Time', 'Social', '19-SEP-23', 99, 100, 101, 102);

INSERT INTO PROIECT
VALUES(SEQ.NEXTVAL, 'Movie Night', 'Caritabil', '19-JUN-23', 104, 105, 106, 107);

INSERT INTO DEPARTAMENTE
VALUES(SEQ.NEXTVAL, 'Scriere de Proiecte', 117, 4);

INSERT INTO DEPARTAMENTE
VALUES(SEQ.NEXTVAL, 'Relatii Publice', 118, 4);

INSERT INTO DEPARTAMENTE
VALUES(SEQ.NEXTVAL, 'Resurse Umane', 119, 4);

INSERT INTO DEPARTAMENTE
VALUES(SEQ.NEXTVAL, 'Marketing', 120, 4);

INSERT INTO DEPARTAMENTE
VALUES(SEQ.NEXTVAL, 'Consiliu Executiv', 121, 4);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Boicu', 'Marius', '4-MAY-21', 112);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Mititelu', 'Maria', '11-FEB-22', 113);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Turcu', 'Raisa', '12-JAN-20', 114);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Rusu', 'Maria', '23-MAR-22', 115);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Cirlan', 'Andreea', '19-NOV-21', 116);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Mandru', 'Ioana', '6-MAR-20', 112);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Mandache', 'Tudor', '23-JUL-21', 113);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Munteanu', 'Alex', '23-SEP-23', 114);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Munteanu', 'Tudor', '12-DEC-22', 115);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Hulubei', 'Gabriel', '9-MAY-20', 116);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Ciuraru', 'Cosmin', '18-JAN-23', 112);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Mihaila', 'Cosmin', '12-MAY-19', 113);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Rosu', 'Paul', '23-JUL-23', 114);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Bot', 'George', '13-JUL-22', 115);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Ciovnicu', 'Gina', '4-APR-20', 116);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Carp', 'Rafael', '14-JAN-21', 112);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Miron', 'Andra', '13-MAY-19', 113);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Enache', 'Alexandra', '22-APR-23', 114);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Turcu', 'Edi', '12-OCT-22', 115);

INSERT INTO MEMBRI_ACTIVI(ID_MEMBRU, NUME, PRENUME, DATA_ADERARE, ID_DEPARTAMENT)
VALUES(SEQ.NEXTVAL, 'Iosub', 'Rares', '19-MAR-21', 116);

INSERT INTO PROIECT
VALUES(SEQ.NEXTVAL, 'Cariere', 'Informativ', '22-OCT-23', 117, 118, 119, 120);

INSERT INTO PROIECT
VALUES(SEQ.NEXTVAL, 'Job Almanac', 'Informativ', '23-APR-23', 122, 123, 124, 125);

INSERT INTO PROIECT
VALUES(SEQ.NEXTVAL, 'Arta n Dar', 'Caritabil', '20-DEC-23', 127, 128, 129, 130);

INSERT INTO PROIECT
VALUES(SEQ.NEXTVAL, 'RomanMUN', 'Academic', '6-AUG-23', 132, 133, 134, 141);

INSERT INTO SPONSORI
VALUES(SEQ.NEXTVAL, 'FabLab Iasi', 3, 3000, 61);

INSERT INTO SPONSORI
VALUES(SEQ.NEXTVAL, 'Plantagro', 3, 2000, 146);

INSERT INTO SPONSORI
VALUES(SEQ.NEXTVAL, 'Adobe', 2, 2000, 143);

INSERT INTO SPONSORI
VALUES(SEQ.NEXTVAL, 'Bitdefender', 2, 1500, 143);

INSERT INTO SPONSORI
VALUES(SEQ.NEXTVAL, 'Hiccup', 3, 3000, 83);

INSERT INTO SPONSORI
VALUES(SEQ.NEXTVAL, 'Miaunel', 1, 500, 82);

INSERT INTO SPONSORI
VALUES(SEQ.NEXTVAL, 'Blanca', 1, 300, 82);

INSERT INTO SPONSORI
VALUES(SEQ.NEXTVAL, 'Centrul de Afaceri', 3, 4000, 109);

INSERT INTO SPONSORI
VALUES(SEQ.NEXTVAL, 'Rotaru', 2, 3000, 145);

INSERT INTO SPONSORI
VALUES(SEQ.NEXTVAL, 'Hiccup', 2, 2000, 111);

INSERT INTO SPONSORI
VALUES(SEQ.NEXTVAL, 'OpportuniTool', 3, 2500, 144);

INSERT INTO TASK
VALUES(SEQ.NEXTVAL, 'Formular Inscriere', 'Realizat', '5-AUG-23', 61, 17);

INSERT INTO TASK
VALUES(SEQ.NEXTVAL, 'Cautat Joculete', 'In curs', '5-SEP-23', 110, 101);

INSERT INTO TASK
VALUES(SEQ.NEXTVAL, 'Contactat Speakeri', 'Realizat', '5-JUL-23', 82, 24);

INSERT INTO TASK
VALUES(SEQ.NEXTVAL, 'Contactat Speakeri', 'Realizat', '5-MAR-23', 83, 29);

INSERT INTO TASK
VALUES(SEQ.NEXTVAL, 'Cautat Sala', 'Neinceput', '5-DEC-23', 109, 97);

INSERT INTO TASK
VALUES(SEQ.NEXTVAL, 'Cautat Film', 'Realizat', '5-JUN-23', 111, 104);

INSERT INTO TASK
VALUES(SEQ.NEXTVAL, 'Mapa de Proiect', 'Realizat', '5-OCT-23', 143, 117);

INSERT INTO TASK
VALUES(SEQ.NEXTVAL, 'Cautat Speakeri', 'Realizat', '5-APR-23', 144, 122);

INSERT INTO TASK
VALUES(SEQ.NEXTVAL, 'Cautat Colinde', 'Neinceput', '5-DEC-23', 145, 127);

INSERT INTO TASK
VALUES(SEQ.NEXTVAL, 'Contactat Scoala', 'Realizat', '5-AUG-23', 146, 141);

INSERT INTO TASK
VALUES(192, 'Formular Chairs', 'Neinceput', '07-AUG-23', 61, NULL);

INSERT INTO TASK
VALUES(193, 'Contact Locatii', 'Neinceput', '08-AUG-23', 61, NULL);

INSERT INTO TASK
VALUES(194, 'Diplome', 'Neinceput', '09-AUG-23', 61, NULL);

INSERT INTO TASK
VALUES(195, 'Contact Brunch', 'Neinceput', '10-AUG-23', 61, NULL);

INSERT INTO TASK
VALUES(196, 'Formular Chairs', 'Neinceput', '07-AUG-23', 61, 407);

INSERT INTO TASK
VALUES(197, 'Formular Chairs', 'Neinceput', '07-AUG-23', 61, 407);

INSERT INTO TASK
VALUES(198, 'Formular Chairs', 'Neinceput', '07-AUG-23', 61, 407);

