--status
INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (nextval('status_seq'), 'Budžet', 'B');
INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (nextval('status_seq'), 'Samofinansiranje', 'SF');

--fakultet
INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (nextval('fakultet_seq'), 'Fakultet tehničkih nauka', 'Novi Sad');
INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (nextval('fakultet_seq'), 'Filozofski fakultet', 'Novi Sad');
INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (nextval('fakultet_seq'), 'Prirodno-matematički fakultet', 'Niš');
INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (nextval('fakultet_seq'), 'Fakultet organizacionih nauka', 'Beograd');
INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (nextval('fakultet_seq'), 'Fakultet političkih nauka', 'Beograd');

--departman
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Departman za industrijsko inženjerstvo i menadžment', 'IIM', 1);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Departman za energetiku, elektroniku i telekomunikacije', 'EET', 1);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Departman za saobraćaj', 'S', 1);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Departman za računarstvo i automatiku', 'RA', 1);

INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Odsek za srpsku književnost', 'OSK', 2);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Odsek za srpski jezik i lingvistiku', 'OSJL', 2);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Odsek za sociologiju', 'OS', 2);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Odsek za psihologiju', 'OP', 2);

INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Departman za matematiku', 'DM', 3);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Departman za računarske nauke', 'DRN', 3);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Departman za geografiju', 'DG', 3);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Departman za biologiju i ekologiju', 'DBE', 3);

INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Informacioni sistemi i tehnologije', 'IST', 4);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Menadžment i organizacija', 'MO', 4);

INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Politikologija', 'P', 5);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Novinarstvo', 'N', 5);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Međunarodne studije', 'MS', 5);

--student
INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 1, 1, 'Marijana', 'Lazarević', 'IT10/2017');
INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 1, 2, 'Marija', 'Mandić', 'IT13/2017');
INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 1, 1, 'Anđela', 'Bulajić', 'IT11/2017');

INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 2, 1, 'Anđela', 'Mandić', 'ET11/2016');
INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 2, 2, 'Marija', 'Bulajić', 'ET13/2016');

INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 3, 1, 'Katarina', 'Kokić', 'SS1/2018');
INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 3, 2, 'Jelena', 'Stević', 'SS2/2018');

INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 4, 2, 'Mitar', 'Mitrović', 'RA38/2016');
INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 4, 2, 'Marko', 'Marković', 'RA70/2016');

INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 5, 1, 'Milan', 'Petrović', 'SK11/2019');
INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 6, 2, 'Žarko', 'Laušević', 'SJL55/2019');
INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 7, 1, 'Janko', 'Janković', 'S22/2019');
INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 8, 2, 'Filip', 'Filipović', 'P66/2019');

INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 9, 2, 'Ana', 'Mandić', 'DM100/2018');
INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 10, 1, 'Jana', 'Hristić', 'RN14/2018');
INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 11, 2, 'Sanja', 'Mikić', 'G102/2018');
INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 12, 1, 'Vanja', 'Krstić', 'BE18/2018');

INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 13, 1, 'Miloš', 'Milovanović', 'IST5/2017');
INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 14, 1, 'Milica', 'Franić', 'MO10/2017');

INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 15, 2, 'Marina', 'Marinković', 'P66/2019');
INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 16, 2, 'Ivan', 'Teodorović', 'N77/2019');
INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (nextval('student_seq'), 17, 2, 'Sofija', 'Mirković', 'MS88/2019');

--test
INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (-100, 'nazivtest', 'oznakatest');

INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (-100, 'naziv test', 'sediste test');

INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (-100, 'naziv test', 'oznakatest', 1);

INSERT INTO "student"("id", "departman", "status", "ime", "prezime", "broj_indeksa")
VALUES (-100, 17, 2, 'test', 'test', 'test');