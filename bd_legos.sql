DROP SCHEMA IF EXISTS legos CASCADE;
CREATE SCHEMA IF NOT EXISTS legos;
SET SEARCH_PATH TO legos;

CREATE TABLE Brique(
   idBrique SMALLINT,
   largeur INT NOT NULL,
   longueur INT,
   hauteur FLOAT,
   couleur VARCHAR(50),
   PRIMARY KEY(idBrique)
);

CREATE TABLE Joueuses(
   idJoueuses INT,
   prenom VARCHAR(50),
   dateInscription DATE,
   avatar INT,
   PRIMARY KEY(idJoueuses)
);

CREATE TABLE Paramètres(
   idParametre INT,
   propriété VARCHAR(50),
   valeur REAL,
   PRIMARY KEY(idParametre)
);

CREATE TABLE Usine(
   idUsine INT,
   pays VARCHAR(50),
   ville VARCHAR(50),
   PRIMARY KEY(idUsine)
);

CREATE TABLE Constructions(
   idConstruction INT,
   nom VARCHAR(50),
   theme VARCHAR(50),
   description VARCHAR(100),
   anneeSortie INT,
   dimensions SMALLINT,
   type VARCHAR(50),
   PRIMARY KEY(idConstruction)
);

CREATE TABLE Officielles(
   codeRef INT,
   nom VARCHAR(50),
   prix REAL,
   ageRecommande INT,
   idConstruction INT NOT NULL,
   PRIMARY KEY(codeRef),
   UNIQUE(idConstruction),
   FOREIGN KEY(idConstruction) REFERENCES Constructions(idConstruction)
);

CREATE TABLE Fans(
   idConstruction INT,
   nomCreateur VARCHAR(50),
   licence VARCHAR(50),
   PRIMARY KEY(idConstruction),
   FOREIGN KEY(idConstruction) REFERENCES Constructions(idConstruction)
);

CREATE TABLE Etapes(
   idConstruction INT NOT NULL,
   numEtape INT,
   image INT,
   instructions VARCHAR(50),
   PRIMARY KEY(idConstruction),
   FOREIGN KEY(idConstruction) REFERENCES Constructions(idConstruction)
);

CREATE TABLE Critères(
   idCritere INT,
   nom VARCHAR(50),
   commentaire VARCHAR(100),
   PRIMARY KEY(idCritere)
);

CREATE TABLE Photos(
   idPhoto INT,
   titre VARCHAR(50),
   desciption VARCHAR(100),
   cheminVersFichier VARCHAR(50),
   idBrique SMALLINT NOT NULL,
   idConstruction INT NOT NULL,
   PRIMARY KEY(idPhoto),
   FOREIGN KEY(idBrique) REFERENCES Brique(idBrique),
   FOREIGN KEY(idConstruction) REFERENCES Constructions(idConstruction)
);

CREATE TABLE Actions(
   idAction INT,
   typeAction VARCHAR(50),
   idBrique SMALLINT NOT NULL,
   PRIMARY KEY(idAction),
   UNIQUE(idBrique),
   FOREIGN KEY(idBrique) REFERENCES Brique(idBrique)
);

CREATE TABLE Partie(
   idPartie INT,
   debutPartie DATE,
   finPartie DATE,
   scoreG SMALLINT,
   idGagnant INT,
   idParametre INT NOT NULL,
   PRIMARY KEY(idPartie),
   FOREIGN KEY(idParametre) REFERENCES Paramètres(idParametre)
);

CREATE TABLE Substitution(
   idSub INT,
   idCritere INT NOT NULL,
   PRIMARY KEY(idSub),
   FOREIGN KEY(idCritere) REFERENCES Critères(idCritere)
);

CREATE TABLE Scores(
   idJoueuses INT,
   idPartie INT,
   score INT,
   PRIMARY KEY(idJoueuses, idPartie),
   FOREIGN KEY(idPartie) REFERENCES Partie(idPartie),
   FOREIGN KEY(idJoueuses) REFERENCES Joueuses(idJoueuses)
);


CREATE TABLE CONTENIR(
   idBrique SMALLINT,
   idPartie INT,
   PRIMARY KEY(idBrique, idPartie),
   FOREIGN KEY(idBrique) REFERENCES Brique(idBrique),
   FOREIGN KEY(idPartie) REFERENCES Partie(idPartie)
);


CREATE TABLE PRODUIRE(
   idBrique SMALLINT,
   idUsine INT,
   dateProduction DATE,
   quantitéProduction SMALLINT,
   PRIMARY KEY(idBrique, idUsine),
   FOREIGN KEY(idBrique) REFERENCES Brique(idBrique),
   FOREIGN KEY(idUsine) REFERENCES Usine(idUsine)
);

CREATE TABLE CONSTRUIRE(
   idBrique SMALLINT,
   idConstruction INT,
   PRIMARY KEY(idBrique, idConstruction),
   FOREIGN KEY(idBrique) REFERENCES Brique(idBrique),
   FOREIGN KEY(idConstruction) REFERENCES Constructions(idConstruction)
);

CREATE TABLE CHANGER(
   idBrique SMALLINT,
   idSub INT,
   PRIMARY KEY(idBrique, idSub),
   FOREIGN KEY(idBrique) REFERENCES Brique(idBrique),
   FOREIGN KEY(idSub) REFERENCES Substitution(idSub)
);

CREATE TABLE COMPTER(
   idAction INT,
   numTour INT,
   idJoueuses INT NOT NULL,
   PRIMARY KEY(idAction),
   FOREIGN KEY(idAction) REFERENCES Actions(idAction),
   FOREIGN KEY(idJoueuses) REFERENCES Joueuses(idJoueuses)
);


INSERT INTO legos.brique VALUES (1, 1, 1, 1, '#000000');
INSERT INTO legos.brique VALUES (2, 2, 1, 1, '#000000');
INSERT INTO legos.brique VALUES (3, 3, 1, 1, '#000000');
INSERT INTO legos.brique VALUES (4, 4, 1, 1, '#000000');
INSERT INTO legos.brique VALUES (5, 6, 1, 1, '#000000');
INSERT INTO legos.brique VALUES (6, 8, 1, 1, '#000000');
INSERT INTO legos.brique VALUES (7, 10, 1, 1, '#000000');
INSERT INTO legos.brique VALUES (8, 12, 1, 1, '#000000');
INSERT INTO legos.brique VALUES (9, 1, 2, 1, '#000000');
INSERT INTO legos.brique VALUES (10, 2, 2, 1, '#000000');
INSERT INTO legos.brique VALUES (11, 3, 2, 1, '#000000');
INSERT INTO legos.brique VALUES (12, 4, 2, 1, '#000000');
INSERT INTO legos.brique VALUES (13, 6, 2, 1, '#000000');
INSERT INTO legos.brique VALUES (14, 8, 2, 1, '#000000');
INSERT INTO legos.brique VALUES (15, 10, 2, 1, '#000000');
INSERT INTO legos.brique VALUES (16, 12, 2, 1, '#000000');
INSERT INTO legos.brique VALUES (17, 1, 3, 1, '#000000');
INSERT INTO legos.brique VALUES (18, 2, 3, 1, '#000000');
INSERT INTO legos.brique VALUES (19, 3, 3, 1, '#000000');
INSERT INTO legos.brique VALUES (20, 4, 3, 1, '#000000');
INSERT INTO legos.brique VALUES (21, 6, 3, 1, '#000000');
INSERT INTO legos.brique VALUES (22, 8, 3, 1, '#000000');
INSERT INTO legos.brique VALUES (23, 10, 3, 1, '#000000');
INSERT INTO legos.brique VALUES (24, 12, 3, 1, '#000000');
INSERT INTO legos.brique VALUES (25, 1, 4, 1, '#000000');
INSERT INTO legos.brique VALUES (26, 2, 4, 1, '#000000');
INSERT INTO legos.brique VALUES (27, 3, 4, 1, '#000000');
INSERT INTO legos.brique VALUES (28, 4, 4, 1, '#000000');
INSERT INTO legos.brique VALUES (29, 6, 4, 1, '#000000');
INSERT INTO legos.brique VALUES (30, 8, 4, 1, '#000000');
INSERT INTO legos.brique VALUES (31, 10, 4, 1, '#000000');
INSERT INTO legos.brique VALUES (32, 12, 4, 1, '#000000');
INSERT INTO legos.brique VALUES (33, 1, 6, 1, '#000000');
INSERT INTO legos.brique VALUES (34, 2, 6, 1, '#000000');
INSERT INTO legos.brique VALUES (35, 3, 6, 1, '#000000');
INSERT INTO legos.brique VALUES (36, 4, 6, 1, '#000000');
INSERT INTO legos.brique VALUES (37, 6, 6, 1, '#000000');
INSERT INTO legos.brique VALUES (38, 8, 6, 1, '#000000');
INSERT INTO legos.brique VALUES (39, 10, 6, 1, '#000000');
INSERT INTO legos.brique VALUES (40, 12, 6, 1, '#000000');
INSERT INTO legos.brique VALUES (41, 1, 8, 1, '#000000');
INSERT INTO legos.brique VALUES (42, 2, 8, 1, '#000000');
INSERT INTO legos.brique VALUES (43, 3, 8, 1, '#000000');
INSERT INTO legos.brique VALUES (44, 4, 8, 1, '#000000');
INSERT INTO legos.brique VALUES (45, 6, 8, 1, '#000000');
INSERT INTO legos.brique VALUES (46, 8, 8, 1, '#000000');
INSERT INTO legos.brique VALUES (47, 10, 8, 1, '#000000');
INSERT INTO legos.brique VALUES (48, 12, 8, 1, '#000000');
INSERT INTO legos.brique VALUES (49, 1, 10, 1, '#000000');
INSERT INTO legos.brique VALUES (50, 2, 10, 1, '#000000');
INSERT INTO legos.brique VALUES (51, 3, 10, 1, '#000000');
INSERT INTO legos.brique VALUES (52, 4, 10, 1, '#000000');
INSERT INTO legos.brique VALUES (53, 6, 10, 1, '#000000');
INSERT INTO legos.brique VALUES (54, 8, 10, 1, '#000000');
INSERT INTO legos.brique VALUES (55, 10, 10, 1, '#000000');
INSERT INTO legos.brique VALUES (56, 12, 10, 1, '#000000');
INSERT INTO legos.brique VALUES (57, 1, 12, 1, '#000000');
INSERT INTO legos.brique VALUES (58, 2, 12, 1, '#000000');
INSERT INTO legos.brique VALUES (59, 3, 12, 1, '#000000');
INSERT INTO legos.brique VALUES (60, 4, 12, 1, '#000000');
INSERT INTO legos.brique VALUES (61, 6, 12, 1, '#000000');
INSERT INTO legos.brique VALUES (62, 8, 12, 1, '#000000');
INSERT INTO legos.brique VALUES (63, 10, 12, 1, '#000000');
INSERT INTO legos.brique VALUES (64, 12, 12, 1, '#000000');
INSERT INTO legos.brique VALUES (65, 1, 1, 0.33, '#000000');
INSERT INTO legos.brique VALUES (66, 2, 1, 0.33, '#000000');
INSERT INTO legos.brique VALUES (67, 3, 1, 0.33, '#000000');
INSERT INTO legos.brique VALUES (68, 4, 1, 0.33, '#000000');
INSERT INTO legos.brique VALUES (69, 6, 1, 0.33, '#000000');
INSERT INTO legos.brique VALUES (70, 8, 1, 0.33, '#000000');
INSERT INTO legos.brique VALUES (71, 10, 1, 0.33, '#000000');
INSERT INTO legos.brique VALUES (72, 12, 1, 0.33, '#000000');
INSERT INTO legos.brique VALUES (73, 1, 2, 0.33, '#000000');
INSERT INTO legos.brique VALUES (74, 2, 2, 0.33, '#000000');
INSERT INTO legos.brique VALUES (75, 3, 2, 0.33, '#000000');
INSERT INTO legos.brique VALUES (76, 4, 2, 0.33, '#000000');
INSERT INTO legos.brique VALUES (77, 6, 2, 0.33, '#000000');
INSERT INTO legos.brique VALUES (78, 8, 2, 0.33, '#000000');
INSERT INTO legos.brique VALUES (79, 10, 2, 0.33, '#000000');
INSERT INTO legos.brique VALUES (80, 12, 2, 0.33, '#000000');
INSERT INTO legos.brique VALUES (81, 1, 3, 0.33, '#000000');
INSERT INTO legos.brique VALUES (82, 2, 3, 0.33, '#000000');
INSERT INTO legos.brique VALUES (83, 3, 3, 0.33, '#000000');
INSERT INTO legos.brique VALUES (84, 4, 3, 0.33, '#000000');
INSERT INTO legos.brique VALUES (85, 6, 3, 0.33, '#000000');
INSERT INTO legos.brique VALUES (86, 8, 3, 0.33, '#000000');
INSERT INTO legos.brique VALUES (87, 10, 3, 0.33, '#000000');
INSERT INTO legos.brique VALUES (88, 12, 3, 0.33, '#000000');
INSERT INTO legos.brique VALUES (89, 1, 4, 0.33, '#000000');
INSERT INTO legos.brique VALUES (90, 2, 4, 0.33, '#000000');
INSERT INTO legos.brique VALUES (91, 3, 4, 0.33, '#000000');
INSERT INTO legos.brique VALUES (92, 4, 4, 0.33, '#000000');
INSERT INTO legos.brique VALUES (93, 6, 4, 0.33, '#000000');
INSERT INTO legos.brique VALUES (94, 8, 4, 0.33, '#000000');
INSERT INTO legos.brique VALUES (95, 10, 4, 0.33, '#000000');
INSERT INTO legos.brique VALUES (96, 12, 4, 0.33, '#000000');
INSERT INTO legos.brique VALUES (97, 1, 6, 0.33, '#000000');
INSERT INTO legos.brique VALUES (98, 2, 6, 0.33, '#000000');
INSERT INTO legos.brique VALUES (99, 3, 6, 0.33, '#000000');
INSERT INTO legos.brique VALUES (100, 4, 6, 0.33, '#000000');
INSERT INTO legos.brique VALUES (101, 6, 6, 0.33, '#000000');
INSERT INTO legos.brique VALUES (102, 8, 6, 0.33, '#000000');
INSERT INTO legos.brique VALUES (103, 10, 6, 0.33, '#000000');
INSERT INTO legos.brique VALUES (104, 12, 6, 0.33, '#000000');
INSERT INTO legos.brique VALUES (105, 1, 8, 0.33, '#000000');
INSERT INTO legos.brique VALUES (106, 2, 8, 0.33, '#000000');
INSERT INTO legos.brique VALUES (107, 3, 8, 0.33, '#000000');
INSERT INTO legos.brique VALUES (108, 4, 8, 0.33, '#000000');
INSERT INTO legos.brique VALUES (109, 6, 8, 0.33, '#000000');
INSERT INTO legos.brique VALUES (110, 8, 8, 0.33, '#000000');
INSERT INTO legos.brique VALUES (111, 10, 8, 0.33, '#000000');
INSERT INTO legos.brique VALUES (112, 12, 8, 0.33, '#000000');
INSERT INTO legos.brique VALUES (113, 1, 10, 0.33, '#000000');
INSERT INTO legos.brique VALUES (114, 2, 10, 0.33, '#000000');
INSERT INTO legos.brique VALUES (115, 3, 10, 0.33, '#000000');
INSERT INTO legos.brique VALUES (116, 4, 10, 0.33, '#000000');
INSERT INTO legos.brique VALUES (117, 6, 10, 0.33, '#000000');
INSERT INTO legos.brique VALUES (118, 8, 10, 0.33, '#000000');
INSERT INTO legos.brique VALUES (119, 10, 10, 0.33, '#000000');
INSERT INTO legos.brique VALUES (120, 12, 10, 0.33, '#000000');
INSERT INTO legos.brique VALUES (121, 1, 12, 0.33, '#000000');
INSERT INTO legos.brique VALUES (122, 2, 12, 0.33, '#000000');
INSERT INTO legos.brique VALUES (123, 3, 12, 0.33, '#000000');
INSERT INTO legos.brique VALUES (124, 4, 12, 0.33, '#000000');
INSERT INTO legos.brique VALUES (125, 6, 12, 0.33, '#000000');
INSERT INTO legos.brique VALUES (126, 8, 12, 0.33, '#000000');
INSERT INTO legos.brique VALUES (127, 10, 12, 0.33, '#000000');
INSERT INTO legos.brique VALUES (128, 12, 12, 0.33, '#000000');
INSERT INTO legos.brique VALUES (129, 1, 1, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (130, 2, 1, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (131, 3, 1, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (132, 4, 1, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (133, 6, 1, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (134, 8, 1, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (135, 10, 1, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (136, 12, 1, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (137, 1, 2, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (138, 2, 2, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (139, 3, 2, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (140, 4, 2, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (141, 6, 2, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (142, 8, 2, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (143, 10, 2, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (144, 12, 2, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (145, 1, 3, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (146, 2, 3, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (147, 3, 3, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (148, 4, 3, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (149, 6, 3, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (150, 8, 3, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (151, 10, 3, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (152, 12, 3, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (153, 1, 4, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (154, 2, 4, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (155, 3, 4, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (156, 4, 4, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (157, 6, 4, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (158, 8, 4, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (159, 10, 4, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (160, 12, 4, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (161, 1, 6, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (162, 2, 6, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (163, 3, 6, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (164, 4, 6, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (165, 6, 6, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (166, 8, 6, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (167, 10, 6, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (168, 12, 6, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (169, 1, 8, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (170, 2, 8, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (171, 3, 8, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (172, 4, 8, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (173, 6, 8, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (174, 8, 8, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (175, 10, 8, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (176, 12, 8, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (177, 1, 10, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (178, 2, 10, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (179, 3, 10, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (180, 4, 10, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (181, 6, 10, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (182, 8, 10, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (183, 10, 10, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (184, 12, 10, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (185, 1, 12, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (186, 2, 12, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (187, 3, 12, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (188, 4, 12, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (189, 6, 12, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (190, 8, 12, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (191, 10, 12, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (192, 12, 12, 1, '#c0c0c0');
INSERT INTO legos.brique VALUES (193, 1, 1, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (194, 2, 1, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (195, 3, 1, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (196, 4, 1, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (197, 6, 1, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (198, 8, 1, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (199, 10, 1, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (200, 12, 1, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (201, 1, 2, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (202, 2, 2, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (203, 3, 2, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (204, 4, 2, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (205, 6, 2, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (206, 8, 2, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (207, 10, 2, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (208, 12, 2, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (209, 1, 3, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (210, 2, 3, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (211, 3, 3, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (212, 4, 3, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (213, 6, 3, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (214, 8, 3, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (215, 10, 3, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (216, 12, 3, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (217, 1, 4, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (218, 2, 4, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (219, 3, 4, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (220, 4, 4, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (221, 6, 4, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (222, 8, 4, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (223, 10, 4, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (224, 12, 4, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (225, 1, 6, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (226, 2, 6, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (227, 3, 6, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (228, 4, 6, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (229, 6, 6, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (230, 8, 6, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (231, 10, 6, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (232, 12, 6, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (233, 1, 8, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (234, 2, 8, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (235, 3, 8, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (236, 4, 8, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (237, 6, 8, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (238, 8, 8, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (239, 10, 8, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (240, 12, 8, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (241, 1, 10, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (242, 2, 10, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (243, 3, 10, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (244, 4, 10, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (245, 6, 10, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (246, 8, 10, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (247, 10, 10, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (248, 12, 10, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (249, 1, 12, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (250, 2, 12, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (251, 3, 12, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (252, 4, 12, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (253, 6, 12, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (254, 8, 12, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (255, 10, 12, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (256, 12, 12, 0.33, '#c0c0c0');
INSERT INTO legos.brique VALUES (257, 1, 1, 1, '#ffffff');
INSERT INTO legos.brique VALUES (258, 2, 1, 1, '#ffffff');
INSERT INTO legos.brique VALUES (259, 3, 1, 1, '#ffffff');
INSERT INTO legos.brique VALUES (260, 4, 1, 1, '#ffffff');
INSERT INTO legos.brique VALUES (261, 6, 1, 1, '#ffffff');
INSERT INTO legos.brique VALUES (262, 8, 1, 1, '#ffffff');
INSERT INTO legos.brique VALUES (263, 10, 1, 1, '#ffffff');
INSERT INTO legos.brique VALUES (264, 12, 1, 1, '#ffffff');
INSERT INTO legos.brique VALUES (265, 1, 2, 1, '#ffffff');
INSERT INTO legos.brique VALUES (266, 2, 2, 1, '#ffffff');
INSERT INTO legos.brique VALUES (267, 3, 2, 1, '#ffffff');
INSERT INTO legos.brique VALUES (268, 4, 2, 1, '#ffffff');
INSERT INTO legos.brique VALUES (269, 6, 2, 1, '#ffffff');
INSERT INTO legos.brique VALUES (270, 8, 2, 1, '#ffffff');
INSERT INTO legos.brique VALUES (271, 10, 2, 1, '#ffffff');
INSERT INTO legos.brique VALUES (272, 12, 2, 1, '#ffffff');
INSERT INTO legos.brique VALUES (273, 1, 3, 1, '#ffffff');
INSERT INTO legos.brique VALUES (274, 2, 3, 1, '#ffffff');
INSERT INTO legos.brique VALUES (275, 3, 3, 1, '#ffffff');
INSERT INTO legos.brique VALUES (276, 4, 3, 1, '#ffffff');
INSERT INTO legos.brique VALUES (277, 6, 3, 1, '#ffffff');
INSERT INTO legos.brique VALUES (278, 8, 3, 1, '#ffffff');
INSERT INTO legos.brique VALUES (279, 10, 3, 1, '#ffffff');
INSERT INTO legos.brique VALUES (280, 12, 3, 1, '#ffffff');
INSERT INTO legos.brique VALUES (281, 1, 4, 1, '#ffffff');
INSERT INTO legos.brique VALUES (282, 2, 4, 1, '#ffffff');
INSERT INTO legos.brique VALUES (283, 3, 4, 1, '#ffffff');
INSERT INTO legos.brique VALUES (284, 4, 4, 1, '#ffffff');
INSERT INTO legos.brique VALUES (285, 6, 4, 1, '#ffffff');
INSERT INTO legos.brique VALUES (286, 8, 4, 1, '#ffffff');
INSERT INTO legos.brique VALUES (287, 10, 4, 1, '#ffffff');
INSERT INTO legos.brique VALUES (288, 12, 4, 1, '#ffffff');
INSERT INTO legos.brique VALUES (289, 1, 6, 1, '#ffffff');
INSERT INTO legos.brique VALUES (290, 2, 6, 1, '#ffffff');
INSERT INTO legos.brique VALUES (291, 3, 6, 1, '#ffffff');
INSERT INTO legos.brique VALUES (292, 4, 6, 1, '#ffffff');
INSERT INTO legos.brique VALUES (293, 6, 6, 1, '#ffffff');
INSERT INTO legos.brique VALUES (294, 8, 6, 1, '#ffffff');
INSERT INTO legos.brique VALUES (295, 10, 6, 1, '#ffffff');
INSERT INTO legos.brique VALUES (296, 12, 6, 1, '#ffffff');
INSERT INTO legos.brique VALUES (297, 1, 8, 1, '#ffffff');
INSERT INTO legos.brique VALUES (298, 2, 8, 1, '#ffffff');
INSERT INTO legos.brique VALUES (299, 3, 8, 1, '#ffffff');
INSERT INTO legos.brique VALUES (300, 4, 8, 1, '#ffffff');
INSERT INTO legos.brique VALUES (301, 6, 8, 1, '#ffffff');
INSERT INTO legos.brique VALUES (302, 8, 8, 1, '#ffffff');
INSERT INTO legos.brique VALUES (303, 10, 8, 1, '#ffffff');
INSERT INTO legos.brique VALUES (304, 12, 8, 1, '#ffffff');
INSERT INTO legos.brique VALUES (305, 1, 10, 1, '#ffffff');
INSERT INTO legos.brique VALUES (306, 2, 10, 1, '#ffffff');
INSERT INTO legos.brique VALUES (307, 3, 10, 1, '#ffffff');
INSERT INTO legos.brique VALUES (308, 4, 10, 1, '#ffffff');
INSERT INTO legos.brique VALUES (309, 6, 10, 1, '#ffffff');
INSERT INTO legos.brique VALUES (310, 8, 10, 1, '#ffffff');
INSERT INTO legos.brique VALUES (311, 10, 10, 1, '#ffffff');
INSERT INTO legos.brique VALUES (312, 12, 10, 1, '#ffffff');
INSERT INTO legos.brique VALUES (313, 1, 12, 1, '#ffffff');
INSERT INTO legos.brique VALUES (314, 2, 12, 1, '#ffffff');
INSERT INTO legos.brique VALUES (315, 3, 12, 1, '#ffffff');
INSERT INTO legos.brique VALUES (316, 4, 12, 1, '#ffffff');
INSERT INTO legos.brique VALUES (317, 6, 12, 1, '#ffffff');
INSERT INTO legos.brique VALUES (318, 8, 12, 1, '#ffffff');
INSERT INTO legos.brique VALUES (319, 10, 12, 1, '#ffffff');
INSERT INTO legos.brique VALUES (320, 12, 12, 1, '#ffffff');
INSERT INTO legos.brique VALUES (321, 1, 1, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (322, 2, 1, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (323, 3, 1, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (324, 4, 1, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (325, 6, 1, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (326, 8, 1, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (327, 10, 1, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (328, 12, 1, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (329, 1, 2, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (330, 2, 2, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (331, 3, 2, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (332, 4, 2, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (333, 6, 2, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (334, 8, 2, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (335, 10, 2, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (336, 12, 2, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (337, 1, 3, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (338, 2, 3, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (339, 3, 3, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (340, 4, 3, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (341, 6, 3, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (342, 8, 3, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (343, 10, 3, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (344, 12, 3, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (345, 1, 4, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (346, 2, 4, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (347, 3, 4, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (348, 4, 4, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (349, 6, 4, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (350, 8, 4, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (351, 10, 4, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (352, 12, 4, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (353, 1, 6, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (354, 2, 6, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (355, 3, 6, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (356, 4, 6, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (357, 6, 6, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (358, 8, 6, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (359, 10, 6, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (360, 12, 6, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (361, 1, 8, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (362, 2, 8, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (363, 3, 8, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (364, 4, 8, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (365, 6, 8, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (366, 8, 8, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (367, 10, 8, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (368, 12, 8, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (369, 1, 10, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (370, 2, 10, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (371, 3, 10, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (372, 4, 10, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (373, 6, 10, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (374, 8, 10, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (375, 10, 10, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (376, 12, 10, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (377, 1, 12, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (378, 2, 12, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (379, 3, 12, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (380, 4, 12, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (381, 6, 12, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (382, 8, 12, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (383, 10, 12, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (384, 12, 12, 0.33, '#ffffff');
INSERT INTO legos.brique VALUES (385, 1, 1, 1, '#8b4513');
INSERT INTO legos.brique VALUES (386, 2, 1, 1, '#8b4513');
INSERT INTO legos.brique VALUES (387, 3, 1, 1, '#8b4513');
INSERT INTO legos.brique VALUES (388, 4, 1, 1, '#8b4513');
INSERT INTO legos.brique VALUES (389, 6, 1, 1, '#8b4513');
INSERT INTO legos.brique VALUES (390, 8, 1, 1, '#8b4513');
INSERT INTO legos.brique VALUES (391, 10, 1, 1, '#8b4513');
INSERT INTO legos.brique VALUES (392, 12, 1, 1, '#8b4513');
INSERT INTO legos.brique VALUES (393, 1, 2, 1, '#8b4513');
INSERT INTO legos.brique VALUES (394, 2, 2, 1, '#8b4513');
INSERT INTO legos.brique VALUES (395, 3, 2, 1, '#8b4513');
INSERT INTO legos.brique VALUES (396, 4, 2, 1, '#8b4513');
INSERT INTO legos.brique VALUES (397, 6, 2, 1, '#8b4513');
INSERT INTO legos.brique VALUES (398, 8, 2, 1, '#8b4513');
INSERT INTO legos.brique VALUES (399, 10, 2, 1, '#8b4513');
INSERT INTO legos.brique VALUES (400, 12, 2, 1, '#8b4513');
INSERT INTO legos.brique VALUES (401, 1, 3, 1, '#8b4513');
INSERT INTO legos.brique VALUES (402, 2, 3, 1, '#8b4513');
INSERT INTO legos.brique VALUES (403, 3, 3, 1, '#8b4513');
INSERT INTO legos.brique VALUES (404, 4, 3, 1, '#8b4513');
INSERT INTO legos.brique VALUES (405, 6, 3, 1, '#8b4513');
INSERT INTO legos.brique VALUES (406, 8, 3, 1, '#8b4513');
INSERT INTO legos.brique VALUES (407, 10, 3, 1, '#8b4513');
INSERT INTO legos.brique VALUES (408, 12, 3, 1, '#8b4513');
INSERT INTO legos.brique VALUES (409, 1, 4, 1, '#8b4513');
INSERT INTO legos.brique VALUES (410, 2, 4, 1, '#8b4513');
INSERT INTO legos.brique VALUES (411, 3, 4, 1, '#8b4513');
INSERT INTO legos.brique VALUES (412, 4, 4, 1, '#8b4513');
INSERT INTO legos.brique VALUES (413, 6, 4, 1, '#8b4513');
INSERT INTO legos.brique VALUES (414, 8, 4, 1, '#8b4513');
INSERT INTO legos.brique VALUES (415, 10, 4, 1, '#8b4513');
INSERT INTO legos.brique VALUES (416, 12, 4, 1, '#8b4513');
INSERT INTO legos.brique VALUES (417, 1, 6, 1, '#8b4513');
INSERT INTO legos.brique VALUES (418, 2, 6, 1, '#8b4513');
INSERT INTO legos.brique VALUES (419, 3, 6, 1, '#8b4513');
INSERT INTO legos.brique VALUES (420, 4, 6, 1, '#8b4513');
INSERT INTO legos.brique VALUES (421, 6, 6, 1, '#8b4513');
INSERT INTO legos.brique VALUES (422, 8, 6, 1, '#8b4513');
INSERT INTO legos.brique VALUES (423, 10, 6, 1, '#8b4513');
INSERT INTO legos.brique VALUES (424, 12, 6, 1, '#8b4513');
INSERT INTO legos.brique VALUES (425, 1, 8, 1, '#8b4513');
INSERT INTO legos.brique VALUES (426, 2, 8, 1, '#8b4513');
INSERT INTO legos.brique VALUES (427, 3, 8, 1, '#8b4513');
INSERT INTO legos.brique VALUES (428, 4, 8, 1, '#8b4513');
INSERT INTO legos.brique VALUES (429, 6, 8, 1, '#8b4513');
INSERT INTO legos.brique VALUES (430, 8, 8, 1, '#8b4513');
INSERT INTO legos.brique VALUES (431, 10, 8, 1, '#8b4513');
INSERT INTO legos.brique VALUES (432, 12, 8, 1, '#8b4513');
INSERT INTO legos.brique VALUES (433, 1, 10, 1, '#8b4513');
INSERT INTO legos.brique VALUES (434, 2, 10, 1, '#8b4513');
INSERT INTO legos.brique VALUES (435, 3, 10, 1, '#8b4513');
INSERT INTO legos.brique VALUES (436, 4, 10, 1, '#8b4513');
INSERT INTO legos.brique VALUES (437, 6, 10, 1, '#8b4513');
INSERT INTO legos.brique VALUES (438, 8, 10, 1, '#8b4513');
INSERT INTO legos.brique VALUES (439, 10, 10, 1, '#8b4513');
INSERT INTO legos.brique VALUES (440, 12, 10, 1, '#8b4513');
INSERT INTO legos.brique VALUES (441, 1, 12, 1, '#8b4513');
INSERT INTO legos.brique VALUES (442, 2, 12, 1, '#8b4513');
INSERT INTO legos.brique VALUES (443, 3, 12, 1, '#8b4513');
INSERT INTO legos.brique VALUES (444, 4, 12, 1, '#8b4513');
INSERT INTO legos.brique VALUES (445, 6, 12, 1, '#8b4513');
INSERT INTO legos.brique VALUES (446, 8, 12, 1, '#8b4513');
INSERT INTO legos.brique VALUES (447, 10, 12, 1, '#8b4513');
INSERT INTO legos.brique VALUES (448, 12, 12, 1, '#8b4513');
INSERT INTO legos.brique VALUES (449, 1, 1, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (450, 2, 1, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (451, 3, 1, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (452, 4, 1, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (453, 6, 1, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (454, 8, 1, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (455, 10, 1, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (456, 12, 1, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (457, 1, 2, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (458, 2, 2, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (459, 3, 2, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (460, 4, 2, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (461, 6, 2, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (462, 8, 2, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (463, 10, 2, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (464, 12, 2, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (465, 1, 3, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (466, 2, 3, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (467, 3, 3, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (468, 4, 3, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (469, 6, 3, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (470, 8, 3, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (471, 10, 3, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (472, 12, 3, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (473, 1, 4, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (474, 2, 4, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (475, 3, 4, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (476, 4, 4, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (477, 6, 4, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (478, 8, 4, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (479, 10, 4, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (480, 12, 4, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (481, 1, 6, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (482, 2, 6, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (483, 3, 6, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (484, 4, 6, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (485, 6, 6, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (486, 8, 6, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (487, 10, 6, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (488, 12, 6, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (489, 1, 8, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (490, 2, 8, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (491, 3, 8, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (492, 4, 8, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (493, 6, 8, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (494, 8, 8, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (495, 10, 8, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (496, 12, 8, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (497, 1, 10, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (498, 2, 10, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (499, 3, 10, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (500, 4, 10, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (501, 6, 10, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (502, 8, 10, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (503, 10, 10, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (504, 12, 10, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (505, 1, 12, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (506, 2, 12, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (507, 3, 12, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (508, 4, 12, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (509, 6, 12, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (510, 8, 12, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (511, 10, 12, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (512, 12, 12, 0.33, '#8b4513');
INSERT INTO legos.brique VALUES (513, 1, 1, 1, '#00bfff');
INSERT INTO legos.brique VALUES (514, 2, 1, 1, '#00bfff');
INSERT INTO legos.brique VALUES (515, 3, 1, 1, '#00bfff');
INSERT INTO legos.brique VALUES (516, 4, 1, 1, '#00bfff');
INSERT INTO legos.brique VALUES (517, 6, 1, 1, '#00bfff');
INSERT INTO legos.brique VALUES (518, 8, 1, 1, '#00bfff');
INSERT INTO legos.brique VALUES (519, 10, 1, 1, '#00bfff');
INSERT INTO legos.brique VALUES (520, 12, 1, 1, '#00bfff');
INSERT INTO legos.brique VALUES (521, 1, 2, 1, '#00bfff');
INSERT INTO legos.brique VALUES (522, 2, 2, 1, '#00bfff');
INSERT INTO legos.brique VALUES (523, 3, 2, 1, '#00bfff');
INSERT INTO legos.brique VALUES (524, 4, 2, 1, '#00bfff');
INSERT INTO legos.brique VALUES (525, 6, 2, 1, '#00bfff');
INSERT INTO legos.brique VALUES (526, 8, 2, 1, '#00bfff');
INSERT INTO legos.brique VALUES (527, 10, 2, 1, '#00bfff');
INSERT INTO legos.brique VALUES (528, 12, 2, 1, '#00bfff');
INSERT INTO legos.brique VALUES (529, 1, 3, 1, '#00bfff');
INSERT INTO legos.brique VALUES (530, 2, 3, 1, '#00bfff');
INSERT INTO legos.brique VALUES (531, 3, 3, 1, '#00bfff');
INSERT INTO legos.brique VALUES (532, 4, 3, 1, '#00bfff');
INSERT INTO legos.brique VALUES (533, 6, 3, 1, '#00bfff');
INSERT INTO legos.brique VALUES (534, 8, 3, 1, '#00bfff');
INSERT INTO legos.brique VALUES (535, 10, 3, 1, '#00bfff');
INSERT INTO legos.brique VALUES (536, 12, 3, 1, '#00bfff');
INSERT INTO legos.brique VALUES (537, 1, 4, 1, '#00bfff');
INSERT INTO legos.brique VALUES (538, 2, 4, 1, '#00bfff');
INSERT INTO legos.brique VALUES (539, 3, 4, 1, '#00bfff');
INSERT INTO legos.brique VALUES (540, 4, 4, 1, '#00bfff');
INSERT INTO legos.brique VALUES (541, 6, 4, 1, '#00bfff');
INSERT INTO legos.brique VALUES (542, 8, 4, 1, '#00bfff');
INSERT INTO legos.brique VALUES (543, 10, 4, 1, '#00bfff');
INSERT INTO legos.brique VALUES (544, 12, 4, 1, '#00bfff');
INSERT INTO legos.brique VALUES (545, 1, 6, 1, '#00bfff');
INSERT INTO legos.brique VALUES (546, 2, 6, 1, '#00bfff');
INSERT INTO legos.brique VALUES (547, 3, 6, 1, '#00bfff');
INSERT INTO legos.brique VALUES (548, 4, 6, 1, '#00bfff');
INSERT INTO legos.brique VALUES (549, 6, 6, 1, '#00bfff');
INSERT INTO legos.brique VALUES (550, 8, 6, 1, '#00bfff');
INSERT INTO legos.brique VALUES (551, 10, 6, 1, '#00bfff');
INSERT INTO legos.brique VALUES (552, 12, 6, 1, '#00bfff');
INSERT INTO legos.brique VALUES (553, 1, 8, 1, '#00bfff');
INSERT INTO legos.brique VALUES (554, 2, 8, 1, '#00bfff');
INSERT INTO legos.brique VALUES (555, 3, 8, 1, '#00bfff');
INSERT INTO legos.brique VALUES (556, 4, 8, 1, '#00bfff');
INSERT INTO legos.brique VALUES (557, 6, 8, 1, '#00bfff');
INSERT INTO legos.brique VALUES (558, 8, 8, 1, '#00bfff');
INSERT INTO legos.brique VALUES (559, 10, 8, 1, '#00bfff');
INSERT INTO legos.brique VALUES (560, 12, 8, 1, '#00bfff');
INSERT INTO legos.brique VALUES (561, 1, 10, 1, '#00bfff');
INSERT INTO legos.brique VALUES (562, 2, 10, 1, '#00bfff');
INSERT INTO legos.brique VALUES (563, 3, 10, 1, '#00bfff');
INSERT INTO legos.brique VALUES (564, 4, 10, 1, '#00bfff');
INSERT INTO legos.brique VALUES (565, 6, 10, 1, '#00bfff');
INSERT INTO legos.brique VALUES (566, 8, 10, 1, '#00bfff');
INSERT INTO legos.brique VALUES (567, 10, 10, 1, '#00bfff');
INSERT INTO legos.brique VALUES (568, 12, 10, 1, '#00bfff');
INSERT INTO legos.brique VALUES (569, 1, 12, 1, '#00bfff');
INSERT INTO legos.brique VALUES (570, 2, 12, 1, '#00bfff');
INSERT INTO legos.brique VALUES (571, 3, 12, 1, '#00bfff');
INSERT INTO legos.brique VALUES (572, 4, 12, 1, '#00bfff');
INSERT INTO legos.brique VALUES (573, 6, 12, 1, '#00bfff');
INSERT INTO legos.brique VALUES (574, 8, 12, 1, '#00bfff');
INSERT INTO legos.brique VALUES (575, 10, 12, 1, '#00bfff');
INSERT INTO legos.brique VALUES (576, 12, 12, 1, '#00bfff');
INSERT INTO legos.brique VALUES (577, 1, 1, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (578, 2, 1, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (579, 3, 1, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (580, 4, 1, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (581, 6, 1, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (582, 8, 1, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (583, 10, 1, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (584, 12, 1, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (585, 1, 2, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (586, 2, 2, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (587, 3, 2, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (588, 4, 2, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (589, 6, 2, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (590, 8, 2, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (591, 10, 2, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (592, 12, 2, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (593, 1, 3, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (594, 2, 3, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (595, 3, 3, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (596, 4, 3, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (597, 6, 3, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (598, 8, 3, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (599, 10, 3, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (600, 12, 3, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (601, 1, 4, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (602, 2, 4, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (603, 3, 4, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (604, 4, 4, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (605, 6, 4, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (606, 8, 4, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (607, 10, 4, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (608, 12, 4, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (609, 1, 6, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (610, 2, 6, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (611, 3, 6, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (612, 4, 6, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (613, 6, 6, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (614, 8, 6, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (615, 10, 6, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (616, 12, 6, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (617, 1, 8, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (618, 2, 8, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (619, 3, 8, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (620, 4, 8, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (621, 6, 8, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (622, 8, 8, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (623, 10, 8, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (624, 12, 8, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (625, 1, 10, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (626, 2, 10, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (627, 3, 10, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (628, 4, 10, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (629, 6, 10, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (630, 8, 10, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (631, 10, 10, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (632, 12, 10, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (633, 1, 12, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (634, 2, 12, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (635, 3, 12, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (636, 4, 12, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (637, 6, 12, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (638, 8, 12, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (639, 10, 12, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (640, 12, 12, 0.33, '#00bfff');
INSERT INTO legos.brique VALUES (641, 1, 1, 1, '#0000cd');
INSERT INTO legos.brique VALUES (642, 2, 1, 1, '#0000cd');
INSERT INTO legos.brique VALUES (643, 3, 1, 1, '#0000cd');
INSERT INTO legos.brique VALUES (644, 4, 1, 1, '#0000cd');
INSERT INTO legos.brique VALUES (645, 6, 1, 1, '#0000cd');
INSERT INTO legos.brique VALUES (646, 8, 1, 1, '#0000cd');
INSERT INTO legos.brique VALUES (647, 10, 1, 1, '#0000cd');
INSERT INTO legos.brique VALUES (648, 12, 1, 1, '#0000cd');
INSERT INTO legos.brique VALUES (649, 1, 2, 1, '#0000cd');
INSERT INTO legos.brique VALUES (650, 2, 2, 1, '#0000cd');
INSERT INTO legos.brique VALUES (651, 3, 2, 1, '#0000cd');
INSERT INTO legos.brique VALUES (652, 4, 2, 1, '#0000cd');
INSERT INTO legos.brique VALUES (653, 6, 2, 1, '#0000cd');
INSERT INTO legos.brique VALUES (654, 8, 2, 1, '#0000cd');
INSERT INTO legos.brique VALUES (655, 10, 2, 1, '#0000cd');
INSERT INTO legos.brique VALUES (656, 12, 2, 1, '#0000cd');
INSERT INTO legos.brique VALUES (657, 1, 3, 1, '#0000cd');
INSERT INTO legos.brique VALUES (658, 2, 3, 1, '#0000cd');
INSERT INTO legos.brique VALUES (659, 3, 3, 1, '#0000cd');
INSERT INTO legos.brique VALUES (660, 4, 3, 1, '#0000cd');
INSERT INTO legos.brique VALUES (661, 6, 3, 1, '#0000cd');
INSERT INTO legos.brique VALUES (662, 8, 3, 1, '#0000cd');
INSERT INTO legos.brique VALUES (663, 10, 3, 1, '#0000cd');
INSERT INTO legos.brique VALUES (664, 12, 3, 1, '#0000cd');
INSERT INTO legos.brique VALUES (665, 1, 4, 1, '#0000cd');
INSERT INTO legos.brique VALUES (666, 2, 4, 1, '#0000cd');
INSERT INTO legos.brique VALUES (667, 3, 4, 1, '#0000cd');
INSERT INTO legos.brique VALUES (668, 4, 4, 1, '#0000cd');
INSERT INTO legos.brique VALUES (669, 6, 4, 1, '#0000cd');
INSERT INTO legos.brique VALUES (670, 8, 4, 1, '#0000cd');
INSERT INTO legos.brique VALUES (671, 10, 4, 1, '#0000cd');
INSERT INTO legos.brique VALUES (672, 12, 4, 1, '#0000cd');
INSERT INTO legos.brique VALUES (673, 1, 6, 1, '#0000cd');
INSERT INTO legos.brique VALUES (674, 2, 6, 1, '#0000cd');
INSERT INTO legos.brique VALUES (675, 3, 6, 1, '#0000cd');
INSERT INTO legos.brique VALUES (676, 4, 6, 1, '#0000cd');
INSERT INTO legos.brique VALUES (677, 6, 6, 1, '#0000cd');
INSERT INTO legos.brique VALUES (678, 8, 6, 1, '#0000cd');
INSERT INTO legos.brique VALUES (679, 10, 6, 1, '#0000cd');
INSERT INTO legos.brique VALUES (680, 12, 6, 1, '#0000cd');
INSERT INTO legos.brique VALUES (681, 1, 8, 1, '#0000cd');
INSERT INTO legos.brique VALUES (682, 2, 8, 1, '#0000cd');
INSERT INTO legos.brique VALUES (683, 3, 8, 1, '#0000cd');
INSERT INTO legos.brique VALUES (684, 4, 8, 1, '#0000cd');
INSERT INTO legos.brique VALUES (685, 6, 8, 1, '#0000cd');
INSERT INTO legos.brique VALUES (686, 8, 8, 1, '#0000cd');
INSERT INTO legos.brique VALUES (687, 10, 8, 1, '#0000cd');
INSERT INTO legos.brique VALUES (688, 12, 8, 1, '#0000cd');
INSERT INTO legos.brique VALUES (689, 1, 10, 1, '#0000cd');
INSERT INTO legos.brique VALUES (690, 2, 10, 1, '#0000cd');
INSERT INTO legos.brique VALUES (691, 3, 10, 1, '#0000cd');
INSERT INTO legos.brique VALUES (692, 4, 10, 1, '#0000cd');
INSERT INTO legos.brique VALUES (693, 6, 10, 1, '#0000cd');
INSERT INTO legos.brique VALUES (694, 8, 10, 1, '#0000cd');
INSERT INTO legos.brique VALUES (695, 10, 10, 1, '#0000cd');
INSERT INTO legos.brique VALUES (696, 12, 10, 1, '#0000cd');
INSERT INTO legos.brique VALUES (697, 1, 12, 1, '#0000cd');
INSERT INTO legos.brique VALUES (698, 2, 12, 1, '#0000cd');
INSERT INTO legos.brique VALUES (699, 3, 12, 1, '#0000cd');
INSERT INTO legos.brique VALUES (700, 4, 12, 1, '#0000cd');
INSERT INTO legos.brique VALUES (701, 6, 12, 1, '#0000cd');
INSERT INTO legos.brique VALUES (702, 8, 12, 1, '#0000cd');
INSERT INTO legos.brique VALUES (703, 10, 12, 1, '#0000cd');
INSERT INTO legos.brique VALUES (704, 12, 12, 1, '#0000cd');
INSERT INTO legos.brique VALUES (705, 1, 1, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (706, 2, 1, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (707, 3, 1, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (708, 4, 1, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (709, 6, 1, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (710, 8, 1, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (711, 10, 1, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (712, 12, 1, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (713, 1, 2, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (714, 2, 2, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (715, 3, 2, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (716, 4, 2, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (717, 6, 2, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (718, 8, 2, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (719, 10, 2, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (720, 12, 2, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (721, 1, 3, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (722, 2, 3, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (723, 3, 3, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (724, 4, 3, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (725, 6, 3, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (726, 8, 3, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (727, 10, 3, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (728, 12, 3, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (729, 1, 4, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (730, 2, 4, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (731, 3, 4, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (732, 4, 4, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (733, 6, 4, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (734, 8, 4, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (735, 10, 4, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (736, 12, 4, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (737, 1, 6, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (738, 2, 6, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (739, 3, 6, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (740, 4, 6, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (741, 6, 6, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (742, 8, 6, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (743, 10, 6, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (744, 12, 6, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (745, 1, 8, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (746, 2, 8, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (747, 3, 8, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (748, 4, 8, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (749, 6, 8, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (750, 8, 8, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (751, 10, 8, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (752, 12, 8, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (753, 1, 10, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (754, 2, 10, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (755, 3, 10, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (756, 4, 10, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (757, 6, 10, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (758, 8, 10, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (759, 10, 10, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (760, 12, 10, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (761, 1, 12, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (762, 2, 12, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (763, 3, 12, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (764, 4, 12, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (765, 6, 12, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (766, 8, 12, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (767, 10, 12, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (768, 12, 12, 0.33, '#0000cd');
INSERT INTO legos.brique VALUES (769, 1, 1, 1, '#006400');
INSERT INTO legos.brique VALUES (770, 2, 1, 1, '#006400');
INSERT INTO legos.brique VALUES (771, 3, 1, 1, '#006400');
INSERT INTO legos.brique VALUES (772, 4, 1, 1, '#006400');
INSERT INTO legos.brique VALUES (773, 6, 1, 1, '#006400');
INSERT INTO legos.brique VALUES (774, 8, 1, 1, '#006400');
INSERT INTO legos.brique VALUES (775, 10, 1, 1, '#006400');
INSERT INTO legos.brique VALUES (776, 12, 1, 1, '#006400');
INSERT INTO legos.brique VALUES (777, 1, 2, 1, '#006400');
INSERT INTO legos.brique VALUES (778, 2, 2, 1, '#006400');
INSERT INTO legos.brique VALUES (779, 3, 2, 1, '#006400');
INSERT INTO legos.brique VALUES (780, 4, 2, 1, '#006400');
INSERT INTO legos.brique VALUES (781, 6, 2, 1, '#006400');
INSERT INTO legos.brique VALUES (782, 8, 2, 1, '#006400');
INSERT INTO legos.brique VALUES (783, 10, 2, 1, '#006400');
INSERT INTO legos.brique VALUES (784, 12, 2, 1, '#006400');
INSERT INTO legos.brique VALUES (785, 1, 3, 1, '#006400');
INSERT INTO legos.brique VALUES (786, 2, 3, 1, '#006400');
INSERT INTO legos.brique VALUES (787, 3, 3, 1, '#006400');
INSERT INTO legos.brique VALUES (788, 4, 3, 1, '#006400');
INSERT INTO legos.brique VALUES (789, 6, 3, 1, '#006400');
INSERT INTO legos.brique VALUES (790, 8, 3, 1, '#006400');
INSERT INTO legos.brique VALUES (791, 10, 3, 1, '#006400');
INSERT INTO legos.brique VALUES (792, 12, 3, 1, '#006400');
INSERT INTO legos.brique VALUES (793, 1, 4, 1, '#006400');
INSERT INTO legos.brique VALUES (794, 2, 4, 1, '#006400');
INSERT INTO legos.brique VALUES (795, 3, 4, 1, '#006400');
INSERT INTO legos.brique VALUES (796, 4, 4, 1, '#006400');
INSERT INTO legos.brique VALUES (797, 6, 4, 1, '#006400');
INSERT INTO legos.brique VALUES (798, 8, 4, 1, '#006400');
INSERT INTO legos.brique VALUES (799, 10, 4, 1, '#006400');
INSERT INTO legos.brique VALUES (800, 12, 4, 1, '#006400');
INSERT INTO legos.brique VALUES (801, 1, 6, 1, '#006400');
INSERT INTO legos.brique VALUES (802, 2, 6, 1, '#006400');
INSERT INTO legos.brique VALUES (803, 3, 6, 1, '#006400');
INSERT INTO legos.brique VALUES (804, 4, 6, 1, '#006400');
INSERT INTO legos.brique VALUES (805, 6, 6, 1, '#006400');
INSERT INTO legos.brique VALUES (806, 8, 6, 1, '#006400');
INSERT INTO legos.brique VALUES (807, 10, 6, 1, '#006400');
INSERT INTO legos.brique VALUES (808, 12, 6, 1, '#006400');
INSERT INTO legos.brique VALUES (809, 1, 8, 1, '#006400');
INSERT INTO legos.brique VALUES (810, 2, 8, 1, '#006400');
INSERT INTO legos.brique VALUES (811, 3, 8, 1, '#006400');
INSERT INTO legos.brique VALUES (812, 4, 8, 1, '#006400');
INSERT INTO legos.brique VALUES (813, 6, 8, 1, '#006400');
INSERT INTO legos.brique VALUES (814, 8, 8, 1, '#006400');
INSERT INTO legos.brique VALUES (815, 10, 8, 1, '#006400');
INSERT INTO legos.brique VALUES (816, 12, 8, 1, '#006400');
INSERT INTO legos.brique VALUES (817, 1, 10, 1, '#006400');
INSERT INTO legos.brique VALUES (818, 2, 10, 1, '#006400');
INSERT INTO legos.brique VALUES (819, 3, 10, 1, '#006400');
INSERT INTO legos.brique VALUES (820, 4, 10, 1, '#006400');
INSERT INTO legos.brique VALUES (821, 6, 10, 1, '#006400');
INSERT INTO legos.brique VALUES (822, 8, 10, 1, '#006400');
INSERT INTO legos.brique VALUES (823, 10, 10, 1, '#006400');
INSERT INTO legos.brique VALUES (824, 12, 10, 1, '#006400');
INSERT INTO legos.brique VALUES (825, 1, 12, 1, '#006400');
INSERT INTO legos.brique VALUES (826, 2, 12, 1, '#006400');
INSERT INTO legos.brique VALUES (827, 3, 12, 1, '#006400');
INSERT INTO legos.brique VALUES (828, 4, 12, 1, '#006400');
INSERT INTO legos.brique VALUES (829, 6, 12, 1, '#006400');
INSERT INTO legos.brique VALUES (830, 8, 12, 1, '#006400');
INSERT INTO legos.brique VALUES (831, 10, 12, 1, '#006400');
INSERT INTO legos.brique VALUES (832, 12, 12, 1, '#006400');
INSERT INTO legos.brique VALUES (833, 1, 1, 0.33, '#006400');
INSERT INTO legos.brique VALUES (834, 2, 1, 0.33, '#006400');
INSERT INTO legos.brique VALUES (835, 3, 1, 0.33, '#006400');
INSERT INTO legos.brique VALUES (836, 4, 1, 0.33, '#006400');
INSERT INTO legos.brique VALUES (837, 6, 1, 0.33, '#006400');
INSERT INTO legos.brique VALUES (838, 8, 1, 0.33, '#006400');
INSERT INTO legos.brique VALUES (839, 10, 1, 0.33, '#006400');
INSERT INTO legos.brique VALUES (840, 12, 1, 0.33, '#006400');
INSERT INTO legos.brique VALUES (841, 1, 2, 0.33, '#006400');
INSERT INTO legos.brique VALUES (842, 2, 2, 0.33, '#006400');
INSERT INTO legos.brique VALUES (843, 3, 2, 0.33, '#006400');
INSERT INTO legos.brique VALUES (844, 4, 2, 0.33, '#006400');
INSERT INTO legos.brique VALUES (845, 6, 2, 0.33, '#006400');
INSERT INTO legos.brique VALUES (846, 8, 2, 0.33, '#006400');
INSERT INTO legos.brique VALUES (847, 10, 2, 0.33, '#006400');
INSERT INTO legos.brique VALUES (848, 12, 2, 0.33, '#006400');
INSERT INTO legos.brique VALUES (849, 1, 3, 0.33, '#006400');
INSERT INTO legos.brique VALUES (850, 2, 3, 0.33, '#006400');
INSERT INTO legos.brique VALUES (851, 3, 3, 0.33, '#006400');
INSERT INTO legos.brique VALUES (852, 4, 3, 0.33, '#006400');
INSERT INTO legos.brique VALUES (853, 6, 3, 0.33, '#006400');
INSERT INTO legos.brique VALUES (854, 8, 3, 0.33, '#006400');
INSERT INTO legos.brique VALUES (855, 10, 3, 0.33, '#006400');
INSERT INTO legos.brique VALUES (856, 12, 3, 0.33, '#006400');
INSERT INTO legos.brique VALUES (857, 1, 4, 0.33, '#006400');
INSERT INTO legos.brique VALUES (858, 2, 4, 0.33, '#006400');
INSERT INTO legos.brique VALUES (859, 3, 4, 0.33, '#006400');
INSERT INTO legos.brique VALUES (860, 4, 4, 0.33, '#006400');
INSERT INTO legos.brique VALUES (861, 6, 4, 0.33, '#006400');
INSERT INTO legos.brique VALUES (862, 8, 4, 0.33, '#006400');
INSERT INTO legos.brique VALUES (863, 10, 4, 0.33, '#006400');
INSERT INTO legos.brique VALUES (864, 12, 4, 0.33, '#006400');
INSERT INTO legos.brique VALUES (865, 1, 6, 0.33, '#006400');
INSERT INTO legos.brique VALUES (866, 2, 6, 0.33, '#006400');
INSERT INTO legos.brique VALUES (867, 3, 6, 0.33, '#006400');
INSERT INTO legos.brique VALUES (868, 4, 6, 0.33, '#006400');
INSERT INTO legos.brique VALUES (869, 6, 6, 0.33, '#006400');
INSERT INTO legos.brique VALUES (870, 8, 6, 0.33, '#006400');
INSERT INTO legos.brique VALUES (871, 10, 6, 0.33, '#006400');
INSERT INTO legos.brique VALUES (872, 12, 6, 0.33, '#006400');
INSERT INTO legos.brique VALUES (873, 1, 8, 0.33, '#006400');
INSERT INTO legos.brique VALUES (874, 2, 8, 0.33, '#006400');
INSERT INTO legos.brique VALUES (875, 3, 8, 0.33, '#006400');
INSERT INTO legos.brique VALUES (876, 4, 8, 0.33, '#006400');
INSERT INTO legos.brique VALUES (877, 6, 8, 0.33, '#006400');
INSERT INTO legos.brique VALUES (878, 8, 8, 0.33, '#006400');
INSERT INTO legos.brique VALUES (879, 10, 8, 0.33, '#006400');
INSERT INTO legos.brique VALUES (880, 12, 8, 0.33, '#006400');
INSERT INTO legos.brique VALUES (881, 1, 10, 0.33, '#006400');
INSERT INTO legos.brique VALUES (882, 2, 10, 0.33, '#006400');
INSERT INTO legos.brique VALUES (883, 3, 10, 0.33, '#006400');
INSERT INTO legos.brique VALUES (884, 4, 10, 0.33, '#006400');
INSERT INTO legos.brique VALUES (885, 6, 10, 0.33, '#006400');
INSERT INTO legos.brique VALUES (886, 8, 10, 0.33, '#006400');
INSERT INTO legos.brique VALUES (887, 10, 10, 0.33, '#006400');
INSERT INTO legos.brique VALUES (888, 12, 10, 0.33, '#006400');
INSERT INTO legos.brique VALUES (889, 1, 12, 0.33, '#006400');
INSERT INTO legos.brique VALUES (890, 2, 12, 0.33, '#006400');
INSERT INTO legos.brique VALUES (891, 3, 12, 0.33, '#006400');
INSERT INTO legos.brique VALUES (892, 4, 12, 0.33, '#006400');
INSERT INTO legos.brique VALUES (893, 6, 12, 0.33, '#006400');
INSERT INTO legos.brique VALUES (894, 8, 12, 0.33, '#006400');
INSERT INTO legos.brique VALUES (895, 10, 12, 0.33, '#006400');
INSERT INTO legos.brique VALUES (896, 12, 12, 0.33, '#006400');
INSERT INTO legos.brique VALUES (897, 1, 1, 1, '#ffff00');
INSERT INTO legos.brique VALUES (898, 2, 1, 1, '#ffff00');
INSERT INTO legos.brique VALUES (899, 3, 1, 1, '#ffff00');
INSERT INTO legos.brique VALUES (900, 4, 1, 1, '#ffff00');
INSERT INTO legos.brique VALUES (901, 6, 1, 1, '#ffff00');
INSERT INTO legos.brique VALUES (902, 8, 1, 1, '#ffff00');
INSERT INTO legos.brique VALUES (903, 10, 1, 1, '#ffff00');
INSERT INTO legos.brique VALUES (904, 12, 1, 1, '#ffff00');
INSERT INTO legos.brique VALUES (905, 1, 2, 1, '#ffff00');
INSERT INTO legos.brique VALUES (906, 2, 2, 1, '#ffff00');
INSERT INTO legos.brique VALUES (907, 3, 2, 1, '#ffff00');
INSERT INTO legos.brique VALUES (908, 4, 2, 1, '#ffff00');
INSERT INTO legos.brique VALUES (909, 6, 2, 1, '#ffff00');
INSERT INTO legos.brique VALUES (910, 8, 2, 1, '#ffff00');
INSERT INTO legos.brique VALUES (911, 10, 2, 1, '#ffff00');
INSERT INTO legos.brique VALUES (912, 12, 2, 1, '#ffff00');
INSERT INTO legos.brique VALUES (913, 1, 3, 1, '#ffff00');
INSERT INTO legos.brique VALUES (914, 2, 3, 1, '#ffff00');
INSERT INTO legos.brique VALUES (915, 3, 3, 1, '#ffff00');
INSERT INTO legos.brique VALUES (916, 4, 3, 1, '#ffff00');
INSERT INTO legos.brique VALUES (917, 6, 3, 1, '#ffff00');
INSERT INTO legos.brique VALUES (918, 8, 3, 1, '#ffff00');
INSERT INTO legos.brique VALUES (919, 10, 3, 1, '#ffff00');
INSERT INTO legos.brique VALUES (920, 12, 3, 1, '#ffff00');
INSERT INTO legos.brique VALUES (921, 1, 4, 1, '#ffff00');
INSERT INTO legos.brique VALUES (922, 2, 4, 1, '#ffff00');
INSERT INTO legos.brique VALUES (923, 3, 4, 1, '#ffff00');
INSERT INTO legos.brique VALUES (924, 4, 4, 1, '#ffff00');
INSERT INTO legos.brique VALUES (925, 6, 4, 1, '#ffff00');
INSERT INTO legos.brique VALUES (926, 8, 4, 1, '#ffff00');
INSERT INTO legos.brique VALUES (927, 10, 4, 1, '#ffff00');
INSERT INTO legos.brique VALUES (928, 12, 4, 1, '#ffff00');
INSERT INTO legos.brique VALUES (929, 1, 6, 1, '#ffff00');
INSERT INTO legos.brique VALUES (930, 2, 6, 1, '#ffff00');
INSERT INTO legos.brique VALUES (931, 3, 6, 1, '#ffff00');
INSERT INTO legos.brique VALUES (932, 4, 6, 1, '#ffff00');
INSERT INTO legos.brique VALUES (933, 6, 6, 1, '#ffff00');
INSERT INTO legos.brique VALUES (934, 8, 6, 1, '#ffff00');
INSERT INTO legos.brique VALUES (935, 10, 6, 1, '#ffff00');
INSERT INTO legos.brique VALUES (936, 12, 6, 1, '#ffff00');
INSERT INTO legos.brique VALUES (937, 1, 8, 1, '#ffff00');
INSERT INTO legos.brique VALUES (938, 2, 8, 1, '#ffff00');
INSERT INTO legos.brique VALUES (939, 3, 8, 1, '#ffff00');
INSERT INTO legos.brique VALUES (940, 4, 8, 1, '#ffff00');
INSERT INTO legos.brique VALUES (941, 6, 8, 1, '#ffff00');
INSERT INTO legos.brique VALUES (942, 8, 8, 1, '#ffff00');
INSERT INTO legos.brique VALUES (943, 10, 8, 1, '#ffff00');
INSERT INTO legos.brique VALUES (944, 12, 8, 1, '#ffff00');
INSERT INTO legos.brique VALUES (945, 1, 10, 1, '#ffff00');
INSERT INTO legos.brique VALUES (946, 2, 10, 1, '#ffff00');
INSERT INTO legos.brique VALUES (947, 3, 10, 1, '#ffff00');
INSERT INTO legos.brique VALUES (948, 4, 10, 1, '#ffff00');
INSERT INTO legos.brique VALUES (949, 6, 10, 1, '#ffff00');
INSERT INTO legos.brique VALUES (950, 8, 10, 1, '#ffff00');
INSERT INTO legos.brique VALUES (951, 10, 10, 1, '#ffff00');
INSERT INTO legos.brique VALUES (952, 12, 10, 1, '#ffff00');
INSERT INTO legos.brique VALUES (953, 1, 12, 1, '#ffff00');
INSERT INTO legos.brique VALUES (954, 2, 12, 1, '#ffff00');
INSERT INTO legos.brique VALUES (955, 3, 12, 1, '#ffff00');
INSERT INTO legos.brique VALUES (956, 4, 12, 1, '#ffff00');
INSERT INTO legos.brique VALUES (957, 6, 12, 1, '#ffff00');
INSERT INTO legos.brique VALUES (958, 8, 12, 1, '#ffff00');
INSERT INTO legos.brique VALUES (959, 10, 12, 1, '#ffff00');
INSERT INTO legos.brique VALUES (960, 12, 12, 1, '#ffff00');
INSERT INTO legos.brique VALUES (961, 1, 1, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (962, 2, 1, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (963, 3, 1, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (964, 4, 1, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (965, 6, 1, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (966, 8, 1, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (967, 10, 1, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (968, 12, 1, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (969, 1, 2, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (970, 2, 2, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (971, 3, 2, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (972, 4, 2, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (973, 6, 2, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (974, 8, 2, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (975, 10, 2, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (976, 12, 2, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (977, 1, 3, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (978, 2, 3, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (979, 3, 3, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (980, 4, 3, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (981, 6, 3, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (982, 8, 3, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (983, 10, 3, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (984, 12, 3, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (985, 1, 4, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (986, 2, 4, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (987, 3, 4, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (988, 4, 4, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (989, 6, 4, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (990, 8, 4, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (991, 10, 4, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (992, 12, 4, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (993, 1, 6, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (994, 2, 6, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (995, 3, 6, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (996, 4, 6, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (997, 6, 6, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (998, 8, 6, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (999, 10, 6, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1000, 12, 6, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1001, 1, 8, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1002, 2, 8, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1003, 3, 8, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1004, 4, 8, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1005, 6, 8, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1006, 8, 8, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1007, 10, 8, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1008, 12, 8, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1009, 1, 10, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1010, 2, 10, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1011, 3, 10, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1012, 4, 10, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1013, 6, 10, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1014, 8, 10, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1015, 10, 10, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1016, 12, 10, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1017, 1, 12, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1018, 2, 12, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1019, 3, 12, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1020, 4, 12, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1021, 6, 12, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1022, 8, 12, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1023, 10, 12, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1024, 12, 12, 0.33, '#ffff00');
INSERT INTO legos.brique VALUES (1025, 1, 1, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1026, 2, 1, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1027, 3, 1, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1028, 4, 1, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1029, 6, 1, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1030, 8, 1, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1031, 10, 1, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1032, 12, 1, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1033, 1, 2, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1034, 2, 2, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1035, 3, 2, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1036, 4, 2, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1037, 6, 2, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1038, 8, 2, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1039, 10, 2, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1040, 12, 2, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1041, 1, 3, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1042, 2, 3, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1043, 3, 3, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1044, 4, 3, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1045, 6, 3, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1046, 8, 3, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1047, 10, 3, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1048, 12, 3, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1049, 1, 4, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1050, 2, 4, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1051, 3, 4, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1052, 4, 4, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1053, 6, 4, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1054, 8, 4, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1055, 10, 4, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1056, 12, 4, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1057, 1, 6, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1058, 2, 6, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1059, 3, 6, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1060, 4, 6, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1061, 6, 6, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1062, 8, 6, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1063, 10, 6, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1064, 12, 6, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1065, 1, 8, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1066, 2, 8, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1067, 3, 8, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1068, 4, 8, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1069, 6, 8, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1070, 8, 8, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1071, 10, 8, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1072, 12, 8, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1073, 1, 10, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1074, 2, 10, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1075, 3, 10, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1076, 4, 10, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1077, 6, 10, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1078, 8, 10, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1079, 10, 10, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1080, 12, 10, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1081, 1, 12, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1082, 2, 12, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1083, 3, 12, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1084, 4, 12, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1085, 6, 12, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1086, 8, 12, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1087, 10, 12, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1088, 12, 12, 1, '#7b68ee');
INSERT INTO legos.brique VALUES (1089, 1, 1, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1090, 2, 1, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1091, 3, 1, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1092, 4, 1, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1093, 6, 1, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1094, 8, 1, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1095, 10, 1, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1096, 12, 1, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1097, 1, 2, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1098, 2, 2, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1099, 3, 2, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1100, 4, 2, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1101, 6, 2, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1102, 8, 2, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1103, 10, 2, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1104, 12, 2, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1105, 1, 3, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1106, 2, 3, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1107, 3, 3, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1108, 4, 3, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1109, 6, 3, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1110, 8, 3, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1111, 10, 3, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1112, 12, 3, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1113, 1, 4, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1114, 2, 4, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1115, 3, 4, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1116, 4, 4, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1117, 6, 4, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1118, 8, 4, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1119, 10, 4, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1120, 12, 4, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1121, 1, 6, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1122, 2, 6, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1123, 3, 6, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1124, 4, 6, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1125, 6, 6, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1126, 8, 6, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1127, 10, 6, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1128, 12, 6, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1129, 1, 8, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1130, 2, 8, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1131, 3, 8, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1132, 4, 8, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1133, 6, 8, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1134, 8, 8, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1135, 10, 8, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1136, 12, 8, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1137, 1, 10, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1138, 2, 10, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1139, 3, 10, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1140, 4, 10, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1141, 6, 10, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1142, 8, 10, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1143, 10, 10, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1144, 12, 10, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1145, 1, 12, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1146, 2, 12, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1147, 3, 12, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1148, 4, 12, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1149, 6, 12, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1150, 8, 12, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1151, 10, 12, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1152, 12, 12, 0.33, '#7b68ee');
INSERT INTO legos.brique VALUES (1153, 1, 1, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1154, 2, 1, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1155, 3, 1, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1156, 4, 1, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1157, 6, 1, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1158, 8, 1, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1159, 10, 1, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1160, 12, 1, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1161, 1, 2, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1162, 2, 2, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1163, 3, 2, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1164, 4, 2, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1165, 6, 2, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1166, 8, 2, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1167, 10, 2, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1168, 12, 2, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1169, 1, 3, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1170, 2, 3, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1171, 3, 3, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1172, 4, 3, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1173, 6, 3, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1174, 8, 3, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1175, 10, 3, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1176, 12, 3, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1177, 1, 4, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1178, 2, 4, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1179, 3, 4, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1180, 4, 4, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1181, 6, 4, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1182, 8, 4, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1183, 10, 4, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1184, 12, 4, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1185, 1, 6, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1186, 2, 6, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1187, 3, 6, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1188, 4, 6, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1189, 6, 6, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1190, 8, 6, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1191, 10, 6, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1192, 12, 6, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1193, 1, 8, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1194, 2, 8, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1195, 3, 8, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1196, 4, 8, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1197, 6, 8, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1198, 8, 8, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1199, 10, 8, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1200, 12, 8, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1201, 1, 10, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1202, 2, 10, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1203, 3, 10, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1204, 4, 10, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1205, 6, 10, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1206, 8, 10, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1207, 10, 10, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1208, 12, 10, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1209, 1, 12, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1210, 2, 12, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1211, 3, 12, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1212, 4, 12, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1213, 6, 12, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1214, 8, 12, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1215, 10, 12, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1216, 12, 12, 1, '#ff0000');
INSERT INTO legos.brique VALUES (1217, 1, 1, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1218, 2, 1, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1219, 3, 1, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1220, 4, 1, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1221, 6, 1, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1222, 8, 1, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1223, 10, 1, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1224, 12, 1, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1225, 1, 2, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1226, 2, 2, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1227, 3, 2, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1228, 4, 2, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1229, 6, 2, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1230, 8, 2, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1231, 10, 2, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1232, 12, 2, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1233, 1, 3, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1234, 2, 3, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1235, 3, 3, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1236, 4, 3, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1237, 6, 3, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1238, 8, 3, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1239, 10, 3, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1240, 12, 3, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1241, 1, 4, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1242, 2, 4, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1243, 3, 4, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1244, 4, 4, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1245, 6, 4, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1246, 8, 4, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1247, 10, 4, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1248, 12, 4, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1249, 1, 6, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1250, 2, 6, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1251, 3, 6, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1252, 4, 6, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1253, 6, 6, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1254, 8, 6, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1255, 10, 6, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1256, 12, 6, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1257, 1, 8, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1258, 2, 8, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1259, 3, 8, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1260, 4, 8, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1261, 6, 8, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1262, 8, 8, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1263, 10, 8, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1264, 12, 8, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1265, 1, 10, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1266, 2, 10, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1267, 3, 10, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1268, 4, 10, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1269, 6, 10, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1270, 8, 10, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1271, 10, 10, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1272, 12, 10, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1273, 1, 12, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1274, 2, 12, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1275, 3, 12, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1276, 4, 12, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1277, 6, 12, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1278, 8, 12, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1279, 10, 12, 0.33, '#ff0000');
INSERT INTO legos.brique VALUES (1280, 12, 12, 0.33, '#ff0000');