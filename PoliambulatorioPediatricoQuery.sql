#Inserimento dei dati di un nuovo paziente
INSERT INTO paziente VALUES('', '', '', '', '', '', '', '');
/*Quando viene registrato un nuovo paziente, si deve inserire i dati relativi alla visita
che ha sostenuto*/
INSERT INTO visita VALUES('', '', '', '', );

#Inserimento dei dati di un nuovo dipendente della struttura
INSERT INTO personaledellastruttura VALUES( , '', '', , '');

#Inserimento dei dati di un nuovo specialista
INSERT INTO personaledellastruttura VALUES( , '', '', , '');
INSERT INTO specialista VALUES( , '', , '', '', );
/*Quando viene inserito un nuovo specialista si registrano i suoi collaboratori*/
INSERT INTO assistito VALUES( , , , );

#Registrazione della visita sostenuta da un paziente presso uno specialista
INSERT INTO visita VALUES('', '', '', '', );

#Inserimento dei dati di un assistente medico sanitario
INSERT INTO personaledellastruttura VALUES( , '', '', , '');
INSERT INTO collaboratore VALUES( , , '');
/*L'inserimento dei dati di un collaboratore prevede anche l'inserimento dello
specialista che assiste*/
INSERT INTO assistito VALUES( , , , );
/*L'inserimento di un nuovo collaboratore prevede anche l'assegnazione della responsabilità
d'uso di un macchinario di diagnostica*/
INSERT INTO responsabile VALUES( , );

#Registrazione dell’acquisto di un macchinario di diagnostica
INSERT INTO macchinariodidiagnostica VALUES( , '', '', '', '');
/*Se si inserisce un nuovo macchinario di diagnostica si deve inserire
anche l'ambulatorio che lo contiene*/
INSERT INTO contiene VALUES( , );

#Registrazione dell’avvenuta sanificazione di un ambulatorio
INSERT INTO sanificazione VALUES( , '', '', '');

/*Assegnazione della responsabilità di un macchinario di diagnostica 
(già presente nella struttura)*/
INSERT INTO responsabile VALUES( , );
/*È necessario aggiornare l'attributo Numero_macchinari al collaboratore
inserito in 'responsabile'*/
UPDATE collaboratore 
SET Numero_macchinari = Numero_macchinari+1
WHERE collaboratore.NumeroTesserinoCo = NumeroTesserinoCo_daAggiornare;

/*Inserimento di una terapia farmacologica prescritta 
da uno specialista ad un paziente*/
INSERT INTO terapia VALUES('', '', '', '', );
/*La prescrizione di una terapia farmacologica prevede il collegamento
logico tra la terapia e i farmaci*/
INSERT INTO costituita VALUES('', '', '', '', '');

#Immissione dei dati dell’ecografia prescritta ad un paziente dallo specialista
INSERT INTO ecografia VALUES( , '', '', '', );

/*Elencare le informazioni memorizzate per ogni specialista,
compreso l’ambulatorio in cui opera*/
SELECT *
FROM Specialista INNER JOIN PersonaleDellaStruttura ON NumeroTesserinoSp = NumeroTesserino;

/*Elencare il nome ed il cognome dei pazienti di sesso femminile che hanno avuto 
una prescrizione di una terapia farmacologica contro una determinata malattia.*/
SELECT Nome, Cognome
FROM Paziente, Terapia
WHERE Sesso = 'F' AND Paziente.CodiceFiscale = Terapia.CodiceFiscale AND Malattia = 'nomeMalattia';

/*Elencare le informazioni memorizzate per ogni collaboratore,
compreso il numero dei macchinari di diagnostica di cui è responsabile*/
SELECT *
FROM Collaboratore, PersonaleDellaStruttura
WHERE Collaboratore.NumeroTesserinoCo = PersonaleDellaStruttura.NumeroTesserino;

#Rimuovere i dipendenti della struttura in età pensionabile
DELETE FROM PersonaleDellaStruttura WHERE Età = 67;
#P.S.: USARE QUESTO COMANDO PER EVITARE ERROR CODE: 1175--> SET SQL_SAFE_UPDATES = 0;
#Alternativa
DELETE FROM PersonaleDellaStruttura
WHERE NumeroTesserino IN(SELECT * FROM(SELECT PS.NumeroTesserino
										FROM PersonaleDellaStruttura AS PS
										WHERE PS.Età = 67)TempTlb);

/*Visualizzazione nome, cognome e recapito telefonico degli specialisti in ordine crescente 
rispetto alla loro specializzazione*/
SELECT Nome, Cognome, TelefonoSpecialista
FROM PersonaleDellaStruttura, Specialista
WHERE PersonaleDellaStruttura.NumeroTesserino = Specialista.NumeroTesserinoSp
ORDER BY Specializzazione ASC;

/*Elenco delle terapie prescritte al paziente Mario Rossi dal pediatra Giovanni Bianchi*/
SELECT DataInizio, DataFine, Malattia
FROM PersonaleDellaStruttura, Specialista, Paziente, Terapia
WHERE PersonaleDellaStruttura.nome = 'Giovanni' AND PersonaleDellaStruttura.cognome = 'Bianchi' 
		AND Paziente.Nome = 'Mario' AND Paziente.Cognome = 'Rossi'
        AND Specializzazione = 'Pediatria'
        AND PersonaleDellaStruttura.NumeroTesserino = Specialista.NumeroTesserinoSp
        AND Terapia.CodiceFiscale = Paziente.CodiceFiscale
        AND Terapia.NumeroTesserinoSp = Specialista.NumeroTesserinoSp;


#Elenco delle ecografie prescritte dal cardiologo Giuseppe Neri
SELECT CodiceEcografia, NomeEcografia, Descrizione, Ecografia.CodiceFiscale AS Paziente
FROM PersonaleDellaStruttura, 
	  Ecografia INNER JOIN Specialista ON Ecografia.NumeroTesserinoSp = Specialista.NumeroTesserinoSp
WHERE PersonaleDellaStruttura.NumeroTesserino = Specialista.NumeroTesserinoSp
		AND Nome = 'Giuseppe'
		AND Cognome = 'Neri' AND Specializzazione = 'Cardiologia';
        
/*Elencare, per ogni ambulatorio, le caratteristiche dei macchinari di diagnostica disponibili*/
SELECT CodiceAmbulatorio, NumeroSerie, DataInstallazione, Modello, Fornitore, Descrizione
FROM (Contiene NATURAL JOIN Ambulatorio) NATURAL JOIN MacchinarioDiDiagnostica
GROUP BY CodiceAmbulatorio, NumeroSerie
ORDER BY CodiceAmbulatorio;

/*Elencare le informazioni dei pazienti di sesso maschile che hanno sostenuto almeno una visita dal neonatologo 
Virgilio Rossi e nessuna visita dal pediatra Giulio Verdi*/
SELECT Paziente.CodiceFiscale, Paziente.Nome, Paziente.Cognome, Paziente.Padre, Paziente.Madre, Paziente.LuogoNascita, Paziente.DataNascita
FROM Paziente, Visita, PersonaleDellaStruttura, Specialista
WHERE Paziente.CodiceFiscale = Visita.CodiceFiscale AND Visita.NumeroTesserinoSp = PersonaleDellaStruttura.NumeroTesserino
		 AND Specialista.NumeroTesserinoSp = PersonaleDellaStruttura.NumeroTesserino AND Sesso = 'M' 
         AND PersonaleDellaStruttura.Nome = 'Virgilio' AND PersonaleDellaStruttura.Cognome = 'Rossi'
         AND Specializzazione = 'Neonatologia' 
         AND NOT EXISTS(SELECT *
						FROM Visita AS V, PersonaleDellaStruttura AS PS, Specialista AS S
						WHERE V.NumeroTesserinoSp = PS.NumeroTesserino AND S.NumeroTesserinoSp = PS.NumeroTesserino
							AND V.CodiceFiscale = Paziente.CodiceFiscale AND S.specializzazione = 'Pediatria'
							AND PS.Nome = 'Giulio' AND PS.Cognome = 'Verdi'
						);

#Stampare le informazioni degli specialisti che hanno visitato gli stessi pazienti del diabetologo Paolo Bianchi
SELECT DISTINCT PersonaleDellaStruttura.*, Specialista.*
FROM PersonaleDellaStruttura INNER JOIN (Visita NATURAL JOIN Specialista) 
								ON PersonaleDellaStruttura.NumeroTesserino = Visita.NumeroTesserinoSp
WHERE (PersonaleDellaStruttura.Nome, PersonaleDellaStruttura.Cognome) != ('Paolo', 'Bianchi')
		AND Visita.NumeroTesserinoSp NOT IN(SELECT Visita.NumeroTesserinoSp
											FROM Visita
											WHERE Visita.CodiceFiscale NOT IN (
																	SELECT V2.CodiceFiscale
																	FROM Visita AS V2, PersonaleDellaStruttura AS PS2, Specialista AS S
                                                                    WHERE PS2.NumeroTesserino = V2.NumeroTesserinoSp
																		  AND S.NumeroTesserinoSp = PS2.NumeroTesserino
                                                                          AND S.specializzazione = 'Diabetologia'
																		  AND PS2.Nome = 'Paolo' AND PS2.Cognome = 'Bianchi'
																	)
											);

/*Visualizzare le terapie che comprendono farmaci prodotti dalla casa farmaceutica Menarini o dalla casa farmaceutica Novartis*/
SELECT T.DataInizio, T.DataFine, T.CodiceFiscale, T.NumeroTesserinoSp
FROM Terapia AS T, Costituita, Farmaco AS F
WHERE T.DataInizio = Costituita.DataInizio AND T.DataFine = Costituita.DataFine AND T.CodiceFiscale = Costituita.CodiceFiscale 
		AND T.NumeroTesserinoSp = Costituita.NumeroTesserinoSp
		AND F.CodiceFarmaco = Costituita.CodiceFarmaco AND F.CasaFarmaceutica = 'Menarini'
	UNION (
		SELECT T2.DataInizio, T2.DataFine, T2.CodiceFiscale, T2.NumeroTesserinoSp
		FROM Terapia AS T2, Costituita AS C2, Farmaco AS F2
		WHERE T2.DataInizio = C2.DataInizio AND T2.DataFine = C2.DataFine AND T2.CodiceFiscale = C2.CodiceFiscale 
				AND T2.NumeroTesserinoSp = C2.NumeroTesserinoSp
                AND F2.CodiceFarmaco = C2.CodiceFarmaco AND F2.CasaFarmaceutica = 'Novartis'
    );
