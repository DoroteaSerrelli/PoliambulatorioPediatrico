drop schema if exists PoliambulatorioPediatrico;
create schema PoliambulatorioPediatrico;
use PoliambulatorioPediatrico;

create table DittaDiSanificazione(
PartitaIVA char(11) NOT NULL,
CHECK (PartitaIVA >= '00000000000' AND PartitaIVA <= '99999999999'),
TelefonoDitta varchar(13) NOT NULL,

PRIMARY KEY(PartitaIVA)
)ENGINE = InnoDB;

create table Ambulatorio(
CodiceAmbulatorio smallint NOT NULL,
Piano int	NOT NULL,

PRIMARY KEY (CodiceAmbulatorio)
)ENGINE = InnoDB;

create table Sanificazione(
CodiceAmbulatorio smallint NOT NULL,
PartitaIVA char(11) NOT NULL,
Ora time,
DataS Date NOT NULL,

PRIMARY KEY(DataS, CodiceAmbulatorio, PartitaIVA),
FOREIGN KEY(CodiceAmbulatorio) REFERENCES Ambulatorio(CodiceAmbulatorio) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(PartitaIVA) REFERENCES DittaDiSanificazione(PartitaIVA) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE = InnoDB;

create table Paziente(
CodiceFiscale char(16) NOT NULL,
Padre varchar(50) NOT NULL,
Madre varchar(50) NOT NULL,
Nome varchar(20) NOT NULL,
Cognome varchar(20) NOT NULL,
Sesso enum('M','F') NOT NULL,
LuogoNascita varchar(30) NOT NULL,
DataNascita date NOT NULL,

PRIMARY KEY(CodiceFiscale)
)ENGINE = InnoDB;

create table PersonaleDellaStruttura(
NumeroTesserino int NOT NULL, 
Nome varchar(20) NOT NULL,
Cognome varchar(20) NOT NULL,
Età smallint NOT NULL,
CHECK(Età >= 35 AND Età <= 67),
TipoContratto enum('Indeterminato','Parziale') NOT NULL,

PRIMARY KEY(NumeroTesserino)
)ENGINE = InnoDB;

create table Specialista(
NumeroTesserinoSp int NOT NULL,
Specializzazione varchar(50) NOT NULL,
AnniServizio smallint NOT NULL,
Email varchar(64) NOT NULL,
CHECK(Email LIKE '%.%@poliambulatoriopediatrico.it'),
TelefonoSpecialista char(16) NOT NULL,
CHECK(TelefonoSpecialista LIKE '+39 ___ ___ ____'),
CodiceAmbulatorio smallint NOT NULL,

PRIMARY KEY (NumeroTesserinoSp),
FOREIGN KEY (NumeroTesserinoSp) REFERENCES PersonaleDellaStruttura(NumeroTesserino)
								ON DELETE CASCADE	ON UPDATE CASCADE,
FOREIGN KEY (CodiceAmbulatorio) REFERENCES Ambulatorio(CodiceAmbulatorio) 
								ON DELETE CASCADE	ON UPDATE CASCADE
)ENGINE = InnoDB;

create table Collaboratore(
NumeroTesserinoCo int NOT NULL,
Numero_macchinari smallint NOT NULL,
Specializzazione varchar(50) NOT NULL,

PRIMARY KEY(NumeroTesserinoCo),
FOREIGN KEY (NumeroTesserinoCo) REFERENCES PersonaleDellaStruttura(NumeroTesserino) 
								ON DELETE CASCADE	ON UPDATE CASCADE
)ENGINE = InnoDB;

create table Visita(
Ora TIME NOT NULL,
Tipo varchar(50) NOT NULL,
DataV date NOT NULL,
CodiceFiscale char(16) NOT NULL,
NumeroTesserinoSp int NOT NULL,

PRIMARY KEY(Ora, DataV, CodiceFiscale, NumeroTesserinoSp),
FOREIGN KEY (CodiceFiscale) REFERENCES Paziente(CodiceFiscale) 
							ON UPDATE CASCADE	ON DELETE CASCADE,
FOREIGN KEY (NumeroTesserinoSp) REFERENCES Specialista(NumeroTesserinoSp) 
							ON UPDATE CASCADE	ON DELETE CASCADE                            
)ENGINE = InnoDB;

create table Ecografia(
CodiceEcografia int NOT NULL,
NomeEcografia varchar(50) NOT NULL,
Descrizione varchar(200),
CodiceFiscale char(16) NOT NULL,
NumeroTesserinoSp int NOT NULL,

PRIMARY KEY(CodiceEcografia, CodiceFiscale, NumeroTesserinoSp),
FOREIGN KEY (CodiceFiscale) REFERENCES Paziente(CodiceFiscale)
							ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (NumeroTesserinoSp) REFERENCES Specialista(NumeroTesserinoSp) 
								ON UPDATE CASCADE ON DELETE CASCADE
                                
)ENGINE = InnoDB; 

create table Terapia(
DataInizio date NOT NULL,
DataFine date NOT NULL,
Malattia varchar(50),
CodiceFiscale char(16) NOT NULL,
NumeroTesserinoSp int NOT NULL,

PRIMARY KEY(DataInizio, DataFine, CodiceFiscale, NumeroTesserinoSp),
FOREIGN KEY (CodiceFiscale) REFERENCES Paziente(CodiceFiscale) 
							ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (NumeroTesserinoSp) REFERENCES Specialista(NumeroTesserinoSp) 
								ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE = InnoDB;

create table Farmaco(
CodiceFarmaco char(9) NOT NULL,
CHECK (CodiceFarmaco >= '000000000' AND CodiceFarmaco <= '999999999'),
Nome varchar(50) NOT NULL,
CasaFarmaceutica varchar(50) NOT NULL,

PRIMARY KEY(CodiceFarmaco)
)ENGINE = InnoDB;

create table MacchinarioDiDiagnostica(
NumeroSerie int NOT NULL,
DataInstallazione date NOT NULL,
Modello varchar(50),
Fornitore varchar(50) NOT NULL,
Descrizione varchar(200),

PRIMARY KEY(NumeroSerie)
)ENGINE = InnoDB;

create table TelefonoInterno(
Numero varchar(13) NOT NULL,
CodiceAmbulatorio smallint NOT NULL,

PRIMARY KEY(Numero, CodiceAmbulatorio),
FOREIGN KEY (CodiceAmbulatorio) REFERENCES Ambulatorio(CodiceAmbulatorio)
								ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE = InnoDB; 

create table Costituita(
DataInizio date NOT NULL,
DataFine date NOT NULL,
CodiceFiscale char(16) NOT NULL,
NumeroTesserinoSp int NOT NULL,
CodiceFarmaco char(9) NOT NULL,

PRIMARY KEY(DataInizio, DataFine, CodiceFiscale, NumeroTesserinoSp, CodiceFarmaco),
FOREIGN KEY (CodiceFiscale) REFERENCES Paziente(CodiceFiscale)
							ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (NumeroTesserinoSp) REFERENCES Specialista(NumeroTesserinoSp)
								ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (CodiceFarmaco) REFERENCES Farmaco(CodiceFarmaco)
							ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (DataInizio, DataFine) REFERENCES Terapia(DataInizio,DataFine)
									ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE = InnoDB;

create table Assistito(
NumeroTesserinoCo int NOT NULL,
NumeroTesserinoSp int NOT NULL,
NumeroOre smallint NOT  NULL,
AnnoCollaborazione int NOT NULL,

PRIMARY KEY(NumeroTesserinoSp, NumeroTesserinoCo),
FOREIGN KEY (NumeroTesserinoSp) REFERENCES Specialista(NumeroTesserinoSp)
								ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (NumeroTesserinoCo) REFERENCES Collaboratore(NumeroTesserinoCo)
								ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE = InnoDB;

create table Responsabile(
NumeroTesserinoCo int NOT NULL,
NumeroSerie int NOT NULL,

PRIMARY KEY(NumeroTesserinoCo, NumeroSerie),
FOREIGN KEY (NumeroTesserinoCo) REFERENCES Collaboratore(NumeroTesserinoCo)
								ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (NumeroSerie) REFERENCES MacchinarioDiDiagnostica(NumeroSerie)
							ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE = InnoDB;

create table Contiene(
CodiceAmbulatorio smallint NOT NULL,
NumeroSerie int NOT NULL,

PRIMARY KEY(CodiceAmbulatorio, NumeroSerie),
FOREIGN KEY(CodiceAmbulatorio) REFERENCES Ambulatorio(CodiceAmbulatorio) 
								ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(NumeroSerie) REFERENCES MacchinarioDiDiagnostica(NumeroSerie)
								ON UPDATE CASCADE ON DELETE CASCADE

)ENGINE = InnoDB;