use poliambulatoriopediatrico;

#----Query inserimento ditta di sanificazione----#
INSERT INTO dittadisanificazione VALUES('92381678812','089 345671');
INSERT INTO dittadisanificazione VALUES('58382674582','3115436756');
INSERT INTO dittadisanificazione VALUES('12345678910','081 343138');

#----Query inserimento ambulatorio----#
INSERT INTO ambulatorio VALUES(1, 0);
INSERT INTO ambulatorio VALUES(2, 0);
INSERT INTO ambulatorio VALUES(3, 0);
INSERT INTO ambulatorio VALUES(10, 1);
INSERT INTO ambulatorio VALUES(12, 1);
INSERT INTO ambulatorio VALUES(14, 1);
INSERT INTO ambulatorio VALUES(8, 0);
INSERT INTO ambulatorio VALUES(6, 0);
INSERT INTO ambulatorio VALUES(18, 2);

#----Query inserimento sanificazione ----#
INSERT INTO sanificazione VALUES(1, '92381678812', '16:40:00', '2023-01-01');
INSERT INTO sanificazione VALUES(2, '58382674582', '15:23:00', '2023-01-01');
INSERT INTO sanificazione VALUES(3, '92381678812', '18:50:00', '2023-01-01');
INSERT INTO sanificazione VALUES(10, '12345678910', '15:45:13', '2023-01-01');
INSERT INTO sanificazione VALUES(12, '12345678910', '17:50:05', '2023-01-01');
INSERT INTO sanificazione VALUES(14, '58382674582', '16:30:05', '2023-01-01');
INSERT INTO sanificazione VALUES(8, '12345678910', '16:00:27', '2023-01-01');
INSERT INTO sanificazione VALUES(6, '58382674582', '19:06:45', '2023-01-01');
INSERT INTO sanificazione VALUES(18, '58382674582', '17:03:12', '2023-01-01');
INSERT INTO sanificazione VALUES(18, '58382674582', '17:03:12', '2023-01-02');
INSERT INTO sanificazione VALUES(6, '58382674582', '19:06:45', '2023-01-02');
INSERT INTO sanificazione VALUES(1, '92381678812', '16:40:00', '2023-01-02');
INSERT INTO sanificazione VALUES(2, '58382674582', '15:23:00', '2023-01-02');
INSERT INTO sanificazione VALUES(3, '92381678812', '18:50:00', '2023-01-02');
INSERT INTO sanificazione VALUES(10, '12345678910', '15:45:13', '2023-01-02');
INSERT INTO sanificazione VALUES(12, '12345678910', '17:50:05', '2023-01-02');
INSERT INTO sanificazione VALUES(14, '58382674582', '16:30:05', '2023-01-02');
INSERT INTO sanificazione VALUES(8, '12345678910', '16:00:27', '2023-01-02');

#----Query inserimento paziente----#
INSERT INTO paziente VALUES('RSSMRA07R09B354Z', 'Mimmo Rossi', 'Maria Mizzecca', 'Mario', 'Rossi', 'M', 'Cagliari', '2007-10-01');
INSERT INTO paziente VALUES('BLDNRC07A01H703D', 'Nino Ubaldo', 'Gina Ginestra', 'Enrico', 'Ubaldo', 'M', 'Salerno', '2007-01-01');
INSERT INTO paziente VALUES('RSSMRA11H08G224N', 'Arcangelo Rossi', 'Elena Pio', 'Mario', 'Rossi', 'M', 'Padova', '2011-06-08');
INSERT INTO paziente VALUES('DPEBLD12H48G224Y', 'Arcangelo Depio', 'Giuseppina Aldi', 'Ubalda', 'Depio', 'F', 'Padova', '2012-09-08');
INSERT INTO paziente VALUES('DPENLT13M41G224K', 'Arcangelo Depio', 'Giuseppina Aldi', 'Nicoletta', 'Depio', 'F', 'Padova', '2013-08-01');
INSERT INTO paziente VALUES('STLLRZ15H47F839O', 'Stefano Sfera', 'Sonia Stella', 'Lucrezia', 'Stella', 'F', 'Napoli', '2015-06-07');
INSERT INTO paziente VALUES('STLLNR20D55G478Y', 'Biagio Stella', 'Amanda Ripa', 'Eleonora', 'Stella', 'F', 'Perugia', '2020-04-15');
INSERT INTO paziente VALUES('STLPRZ22C22G478N', 'Biagio Stella', 'Amanda Ripa', 'Patrizio', 'Stella', 'M', 'Perugia', '2022-03-22');

#-----Query inserimento personale della struttura----#
#--------dipendenti (no collaboratori, no specialisti)
INSERT INTO personaledellastruttura VALUES(1, 'Elena', 'Bianchetti', 65, 'Indeterminato');
INSERT INTO personaledellastruttura VALUES(2, 'Samuele', 'Rossetti', 57, 'Indeterminato');
INSERT INTO personaledellastruttura VALUES(3, 'Marianna', 'Gialletti', 53, 'Parziale');
#-------specialisti
#specialista (che andrà in pensione)
INSERT INTO personaledellastruttura VALUES(4, 'Antonio', 'Biondo', 66, 'Indeterminato');
INSERT INTO specialista VALUES(4, 'Diabetologia', 26, 'antonio.biondo12@poliambulatoriopediatrico.it', '+39 123 234 5678', 1);
UPDATE personaledellastruttura SET Età = 67 WHERE personaledellastruttura.NumeroTesserino = 4;
#altri specialisti
INSERT INTO personaledellastruttura VALUES(5,'Paolo','Bianchi',40,'Indeterminato');
INSERT INTO specialista VALUES(5,'Diabetologia',5,'paolo.bianchi@poliambulatoriopediatrico.it','+39 658 456 9046',2);
INSERT INTO personaledellastruttura VALUES(6,'Gennaro','Verdi',35,'Parziale');
INSERT INTO specialista VALUES(6,'Logopedia',1,'gennaro.verdi@poliambulatoriopediatrico.it','+39 123 632 7346',3);
INSERT INTO personaledellastruttura VALUES(7,'Gino','Rossi',66,'Indeterminato');
INSERT INTO specialista VALUES(7,'Neonatologia',30,'gino.rossi@poliambulatoriopediatrico.it','+39 234 956 3456',6);
INSERT INTO personaledellastruttura VALUES(8,'Virgilio','Rossi',45,'Parziale');
INSERT INTO specialista VALUES(8,'Neonatologia',7,'virgilio.rossi@poliambulatoriopediatrico.it','+39 900 678 4566',8);
INSERT INTO personaledellastruttura VALUES(9,'Giulio','Verdi',47,'Indeterminato');
INSERT INTO specialista VALUES(9,'Pediatria',10,'giulio.verdi@poliambulatoriopediatrico.it','+39 333 056 8886',10);
INSERT INTO personaledellastruttura VALUES(10,'Giovanni','Bianchi',59,'Indeterminato');
INSERT INTO specialista VALUES(10,'Pediatria',18,'giovanni.bianchi@poliambulatoriopediatrico.it','+39 339 154 7786',12);
INSERT INTO personaledellastruttura VALUES(11,'Giuseppe','Neri',36,'Parziale');
INSERT INTO specialista VALUES(11,'Cardiologia',1,'giuseppe.neri@poliambulatoriopediatrico.it','+39 309 138 2716',14);
#collaboratori
INSERT INTO personaledellastruttura VALUES(16,'Ettore','Salto',38,'Parziale');
INSERT INTO collaboratore VALUES(16, 1,'Scienze infermieristiche');
INSERT INTO personaledellastruttura VALUES(17,'Lorenzo','Chieri',43,'Parziale');
INSERT INTO collaboratore VALUES(17,2,'Endocrinologia');
INSERT INTO personaledellastruttura VALUES(18,'Pino','Mirino',56,'Indeterminato');
INSERT INTO collaboratore VALUES(18,2,'Pediatria');
INSERT INTO personaledellastruttura VALUES(19,'Pino','Mino',56,'Parziale');
INSERT INTO collaboratore VALUES(19,1,'Neurologia');

#----Query inserimento visite specialistiche----#
INSERT INTO visita VALUES('09:24:00', 'visita neonatologica', '2022-04-22', 'STLPRZ22C22G478N',8);
INSERT INTO visita VALUES('18:30:00', 'visita neonatologica', '2020-06-15','STLLNR20D55G478Y',8);
INSERT INTO visita VALUES('10:30:00', 'visita di controllo', '2020-07-15','STLLNR20D55G478Y',8);
INSERT INTO visita VALUES('17:00:00', 'visita neonatologica', '2011-07-17','RSSMRA11H08G224N',8);
INSERT INTO visita VALUES('15:00:00', 'visita pediatrica', '2016-05-10','RSSMRA11H08G224N',9);
INSERT INTO visita VALUES('17:00:00', 'visita pediatrica', '2018-07-17','DPEBLD12H48G224Y',9);
INSERT INTO visita VALUES('16:05:00', 'visita pediatrica', '2018-02-11','DPENLT13M41G224K',9);
INSERT INTO visita VALUES('17:00:00', 'visita di controllo', '2016-09-01','RSSMRA11H08G224N',9);
INSERT INTO visita VALUES('09:05:00', 'visita diabetologica', '2016-04-02','DPEBLD12H48G224Y', 5);
INSERT INTO visita VALUES('10:25:00', 'visita diabetologica', '2017-02-16','DPENLT13M41G224K', 5);
INSERT INTO visita VALUES('11:23:00', 'visita diabetologica', '2018-03-10','RSSMRA11H08G224N', 5);
INSERT INTO visita VALUES('15:23:00', 'visita cardiologica', '2013-03-10','DPEBLD12H48G224Y', 11);
INSERT INTO visita VALUES('16:00:00', 'visita cardiologica', '2014-01-18','DPENLT13M41G224K', 11);
INSERT INTO visita VALUES('16:30:00', 'visita cardiologica', '2013-10-01','RSSMRA11H08G224N', 11);
INSERT INTO visita VALUES('09:00:00', 'visita pediatrica', '2018-03-10','DPEBLD12H48G224Y', 10);
INSERT INTO visita VALUES('10:00:00', 'visita pediatrica', '2017-01-10','DPENLT13M41G224K', 10);
INSERT INTO visita VALUES('09:45:00', 'visita pediatrica', '2018-12-03','RSSMRA11H08G224N', 10);
INSERT INTO visita VALUES('16:30:45', 'visita logopedica', '2011-04-23' , 'BLDNRC07A01H703D', 6);
INSERT INTO visita VALUES('17:13:27', 'visita logopedica', '2010-03-12', 'RSSMRA07R09B354Z', 6);
INSERT INTO visita VALUES('15:12:23', 'visita diabetologica', '2018-02-11','STLLRZ15H47F839O',4);

#----Query di inserimento di alcune ecografie----#
INSERT INTO ecografia VALUES('1', 'ecografia transfontanellare', 'Osservazione e studio dei tessuti cerebrali e dei ventricoli al fine di rilevare nel feto la presenza di idrocefalo congenito o acquisito.', 'STLLNR20D55G478Y',8);
INSERT INTO ecografia VALUES('2', 'ecocardiogramma transtoracico', 'Gli ultrasuoni sono utilizzarti per visualizzarne l\'interno del cuore e il flusso del sangue all\'interno delle valvole','DPEBLD12H48G224Y',11);
INSERT INTO ecografia VALUES('3', 'ecocardiogramma transesofageo', 'Consente lo studio morfologico e funzionale del cuore e viene eseguito attraverso l\'uso di una sonda detta transduttore','RSSMRA11H08G224N',11);

#----Query inserimento di alcune terapie ----#
INSERT INTO terapia VALUES('2018-12-04', '2018-12-24', 'raffreddore', 'RSSMRA11H08G224N', 10);
INSERT INTO terapia VALUES('2017-01-10', '2017-01-30', 'influenza', 'DPENLT13M41G224K', 10);
INSERT INTO terapia VALUES('2016-05-10', '2016-06-01', 'infezione batterica', 'RSSMRA11H08G224N', 9);

#----Query inserimento farmaci per terapie ----#
INSERT INTO farmaco VALUES('123456798', 'Aricodiltosse', 'Menarini'); #terapia raffredore
INSERT INTO farmaco VALUES('123456897', 'Acqua di Sirmione', 'Menarini'); #terapia raffreddore
INSERT INTO farmaco VALUES('409403484', 'TachifluTask', 'Angelini'); #influenza
INSERT INTO farmaco VALUES('322442757', 'Narhinel', 'Novartis'); #terapia raffreddore
INSERT INTO farmaco VALUES('111112321', 'Amoxicillina', 'Hexal'); #antibiotico

#----Query inserimento macchinari di diagnostica ----#
INSERT INTO macchinariodidiagnostica VALUES(1,'2017-12-28','MiniSpir New','MIR','Lo spirometro viene utilizzato per ilt test di spirometria utile per intercettare l\'asma e la broncopneumopatia cronica ostruttiva (BCPO).');
INSERT INTO macchinariodidiagnostica VALUES(2,'2016-08-23','EmodialisiDigital','MedicalExpo','Un generatore di emodialisi è una macchina che consente l\'estrazione, la depurazione e la reiniezione automatica del sangue.');
INSERT INTO macchinariodidiagnostica VALUES(8,'2021-05-06','SmartLab Gli10415','Pic','Il misuratore di glicemia, o glucometro, consente la misurazione del glucosio nel sangue con una buona approssimazione del 90%');
INSERT INTO macchinariodidiagnostica VALUES(3,'2017-05-06','Multi DopX','Magaldi Life','L\'elettrocardiogramma serve per monitorare la funzione cardiaca dei pazienti, rilevando la presenza di sofferenza coronarica sia negli stati acuti (infarto)  sia negli stati cronici.');
INSERT INTO macchinariodidiagnostica VALUES(4,'2017-05-06','PressureControl A1234','Medigas','Lo sfigmomanometro è usato per misurare la pressione arteriosa.');
INSERT INTO macchinariodidiagnostica VALUES(5, '2019-02-17', 'NeuroDigital2000', 'Magaldi Life', 'L\'elettroencefalogramma registra e monitora l\'attività cerebrale del paziente in modo non invasivo.');

#----Query inserimento macchinario contenuto in ambulatorio ----#
INSERT INTO contiene VALUES(10, 1);
INSERT INTO contiene VALUES(2, 1);
INSERT INTO contiene VALUES(2,2);
INSERT INTO contiene VALUES(14, 3);
INSERT INTO contiene VALUES(14, 4);
INSERT INTO contiene VALUES(18, 5);
INSERT INTO contiene VALUES(2, 8);


#---- Query inserimento telefono interno per gli ambulatori ----#
INSERT INTO telefonointerno VALUES('081 1123', 2);
INSERT INTO telefonointerno VALUES('081 1124', 2);
INSERT INTO telefonointerno VALUES('083 1234', 3);
INSERT INTO telefonointerno VALUES('086 2345', 6);
INSERT INTO telefonointerno VALUES('085 1456', 8);


#---- Query inserimento costituita, relazione tra Farmaco e Terapia----#
INSERT INTO Costituita VALUES('2018-12-04', '2018-12-24','RSSMRA11H08G224N', 10, '322442757');
INSERT INTO Costituita VALUES('2018-12-04', '2018-12-24','RSSMRA11H08G224N', 10, '123456897');
INSERT INTO Costituita VALUES('2017-01-10', '2017-01-30', 'DPENLT13M41G224K', 10,'123456798');
INSERT INTO Costituita VALUES('2017-01-10', '2017-01-30', 'DPENLT13M41G224K', 10,'409403484');
INSERT INTO Costituita VALUES('2016-05-10', '2016-06-01', 'RSSMRA11H08G224N', 9, '111112321');

#---- Query inserimento assistito, relazione tra specialista e collaboratore----#
INSERT INTO assistito values(17, 5, 20, 2008);
INSERT INTO assistito values(16, 5, 18, 2010);
INSERT INTO assistito values(18, 6, 16, 2020);
INSERT INTO assistito values(18, 9, 25, 2022);
INSERT INTO assistito values(18, 10, 16, 2023);
INSERT INTO assistito values(19, 6, 18, 2015);

#---- Query inserimento responsabile, relazione tra collaboratore e macchinario----#
INSERT INTO responsabile VALUES(17,1);
INSERT INTO responsabile VALUES(17,2);
INSERT INTO responsabile VALUES(16,2);
INSERT INTO responsabile VALUES(18,2);
INSERT INTO responsabile VALUES(18,1);
INSERT INTO responsabile VALUES(19, 5);
