-- -----------------------------------------
-- hydratation de la bdd
-- via requètes 'handmade'
-- -----------------------------------------


-- -----------------------------------------
-- creation des utilisateurs
-- -----------------------------------------
INSERT INTO utilisateur (nom, prenom, email, password) VALUES
-- admin
    ('Allard', 'Philippe', 'allard.philippe@allphil.com', 'braininvacation1977'),
-- livreurs
    ('Morrison', 'Jean', 'jeamo@gamil.com', 'ouistiti++'),
    ('Labringe', 'Yvan', 'lbryv@yahoo.fr', 'gpasmal13'),
-- cuisinier
    ('Robiscoun', 'Joseph', 'robijo@protonmail.com', 'youpala'),
-- clients
    ('Giboubu', 'Hélène', 'giboustar@gmail.com', 'holliday84'),
    ('Savoy', 'Claire', 'yourt13@yahoo.fr', 'elisa+valentine'),
    ('Posterki', 'Richard', 'kikiki@protonmail.com', 'toutenbleu+partout+'),
    ('Lacreme', 'Boris', 'randalflepetit@gmail.com', '8888super33lelay'),
    ('Paspeur', 'Orst', 'monseigneur@guingan.fr', 'derrriQ2000++THX'),
    ('Amersmith', 'Peter', 'amerszmithpet@caramail.fr', 'ieuvBCP1900'),
    ('Klein', 'Henry', 'fritssswepperr@protonmail.com', '17081941---MNCH'),
    ('Vetaire', 'Sophie', 'sosolabrune@gmail.com', 'gxckqSPO2561RGDQhe');
    
    
-- -----------------------------------------
-- creation des statuts et types
-- -----------------------------------------
INSERT INTO statut_livreur (statut) VALUES ('indisponible'), ('libre'), ('en livraison');
INSERT INTO type_produit (type) VALUES ('plat'), ('dessert');
INSERT INTO statut_commande (statut) VALUES ('en attente de prise en charge'), ('en cours de livraison'), ('livrée');

    
-- -----------------------------------------
-- affectation des utilisateurs
-- -----------------------------------------
INSERT INTO admin (utilisateur_id) (SELECT id FROM utilisateur WHERE email = 'allard.philippe@allphil.com');
INSERT INTO livreur (utilisateur_id, telephone) VALUES 
    ((SELECT id FROM utilisateur WHERE email = 'jeamo@gamil.com'), '0665124879'),
    ((SELECT id FROM utilisateur WHERE email = 'lbryv@yahoo.fr'), '0765128833');
INSERT INTO cuisinier (utilisateur_id) (SELECT id FROM utilisateur WHERE email= 'robijo@protonmail.com');
INSERT INTO client (utilisateur_id, telephone) VALUES
	((SELECT id FROM utilisateur WHERE email = 'giboustar@gmail.com'), '0442789546'),
    ((SELECT id FROM utilisateur WHERE email = 'yourt13@yahoo.fr'), '0492230723');
    

-- -----------------------------------------
-- creation des adresses de livrason
-- -----------------------------------------
INSERT INTO adresse_client (numero, type_de_voie, nom_de_voie, code_postal, ville, longitude, latitude, principale, client_utilisateur_id) VALUES
	(4, 'chemin', 'des Espigoules', 13390, 'Auriol', 4.564219, 45.598764, 1, (SELECT id FROM utilisateur WHERE email = 'giboustar@gmail.com')),
    (125, 'quartier', 'Notre Dame de bon voyage', 13390, 'Auriol', 5.846975, 44.136245, 1, (SELECT id FROM utilisateur WHERE email = 'yourt13@yahoo.fr'));


-- -----------------------------------------
-- creation des fiches produits
-- -----------------------------------------
INSERT INTO fiche_produit (nom, img_file_path, description, type_produit_id, prix) VALUES
	-- plats
	('Boeuf bourguigon', '/path/to/file/prod001.jpg', 'Le bœuf bourguignon est composé de morceaux de viande de bœuf, cuits à la cocotte dans une sauce bourguignonne, à base de vin rouge, avec une garniture aromatique.', 1, 7.5),
    ('Langoustines gratinées', '/path/to/file/prod002.jpg', 'Langoustines du bassin méditéranéen gratinées, beurre, ail, accompagnée de riz pilaf', 1, 7.5),
    ('Liguini alle vongole' , '/path/to/file/prod003.jpg', 'Recette traditionelle napolitaine de pates accompagnées de palourdes, piments, tomates cerises confites et aromates', 1, 7.5),
    ('Paela negra', '/path/to/file/prod004.jpg', 'Paela et encre de seiche, recette typique de catalogne qui vous fera oublier la traditionnelle valanciana', 1, 7.5),
    ('Canard à la périgourdine', '/path/to/file/prod005.jpg', 'Confit de canard du périgord, agrémenté de foie gras et truffes, accompagné de pommes de terre façon landaise', 1, 7.5),
    ('Pavé de Saumon', '/path/to/file/prod006.jpg', 'Pavé de saumon cuit à l''unilatérale, assaisonné ,d''anteh et zests de citron, accompagné d''un riz au fenoil', 1, 7.5),
    ('Hampe de boeuf grillée', '/path/to/file/prod007.jpg', 'Pièce de boeuf de 280gr, saisie au grill, accompagnée de légumes du jour', 1, 7.5),
    ('Fish and Chips', '/path/to/file/prod008.jpg', 'L''incontournable de la cuisine de rue britanique, poisson pané à l''anglaise accompagné de frites', 1, 7.5),
    ('Raviolis fungi e ricotta', '/path/to/file/prod009.jpg', 'Gros raviollis aux cèpes, girolles et ricotta AOP de Lombardie', 1, 7.5),
    ('Calamars farcis', '/path/to/file/prod010.jpg', 'Recette méridionnale de calamars farcis aux trois viandes et pignons de pin, accompagnés de riz pilaf', 1, 7.5),
    ('Salade César', '/path/to/file/prod011.jpg', 'La traditionnalle sallade César, reine de la cuisine de bistrot', 1, 7.5),
    ('Porc laqué', '/path/to/file/prod012.jpg', 'Recette de porc laqué au miel, accompagné de riz cantonais', 1, 7.5),
    ('Couscous royal', '/path/to/file/prod013.jpg', 'On ne le présente plus: le couscous royal revisité par nos chefs', 1, 7.5),
    ('Tielle Sétoise', '/path/to/file/prod0014.jpg', 'Tielle sétoise à la seiche et au pimenbt, accompagnée d''éépautre et blé bio', 1, 7.5),
    -- desserts
    ('Cheescake au mures', '/path/to/file/prod015.jpg', 'Variante du célèbre dessert américain, réalisé avec des mures bio de Provence', 2, 3.5),
    ('Panacota', '/path/to/file/prod016.jpg', 'Incontournable dessert italien', 2, 3.5),
    ('Tartelette alpine', '/path/to/file/prod017.jpg', 'Dessert traditionnel du sud des ales françaises, réalisé avec des mirtilles bio des Hautes Alpes', 2, 3.5),
    ('Tartellete citron meringuée', '/path/to/file/prod018.jpg', 'Le grand classique de tratorias italiennes revisité par nos chefs', 2, 3.5),
    ('Crème brulée', '/path/to/file/prod019.jpg', 'On ne présente plus ce dessert de la cuisine bistrot', 2, 3.5),
    ('Fondant au chocolat', '/path/to/file/prod020.jpg', 'Fondant au chocolat issu de cacao bio du Guatémala', 2, 3.5),
    ('Salade de fruits', '/path/to/file/prod021.jpg', 'Salade de fruits du jour bio, préparée dans nos ateliers', 2, 3.5),
    ('Tiramissu', '/path/to/file/prod022.jpg', 'Grand classique revisité par notre chef patissier', 2, 3.5),
    ('Tarte amandine', '/path/to/file/prod023.jpg', 'Tarte amandine aux poires bio de Provence', 2, 3.5),
    ('Ile flottante', '/path/to/file/prod024.jpg', 'L''incontournable de notre enfance... réalisé entièrement à partir d''ingrédients bio', 2, 3.5),
    ('salade de melon et pastèque', '/path/to/file/prod025.jpg', 'Salade fraiche de melons bio de Charaente et pastèque bio de Sicile', 2, 3.5),
    ('Poire belle hélène', '/path/to/file/prod026.jpg', 'Poire bio de provence, pochée dans un vin bio aux épices et nappée de chocolat noir', 2, 3.5),
    ('Eclairs café et chocolat', '/path/to/file/prod027.jpg', 'Deux petits éclairs patissiers, un au café, l''autre au chocolat', 2, 3.5),
    ('Tartelette frangipane', '/path/to/file/prod028.jpg', 'Classique de la cuisine provençale, la tartelette frangipane est réalié à partir d''amandes bio du Lubéron', 2, 3.5);
    
    
-- -----------------------------------------
-- creation des menus du jour
-- -----------------------------------------
INSERT INTO ligne_menu_du_jour (date, fiche_produit_id) VALUES
	-- semaine 32
	('2021/08/09', 1), ('2021/08/09', 2), ('2021/08/09', 15), ('2021/08/09', 16),
    ('2021/08/10', 3), ('2021/08/10', 4), ('2021/08/10', 17), ('2021/08/10', 18),
	('2021/08/11', 5), ('2021/08/11', 6), ('2021/08/11', 15), ('2021/08/11', 20),
    ('2021/08/12', 7), ('2021/08/12', 8), ('2021/08/12', 21), ('2021/08/12', 22),
    ('2021/08/13', 9), ('2021/08/13', 10), ('2021/08/13', 23), ('2021/08/13', 24),
    -- semaine 33
	('2021/08/16', 11), ('2021/08/16', 12), ('2021/08/16', 25), ('2021/08/16', 26),
    ('2021/08/17', 13), ('2021/08/17', 14), ('2021/08/17', 27), ('2021/08/17', 28),
	('2021/08/18', 1), ('2021/08/18', 3), ('2021/08/18', 15), ('2021/08/18', 16),
    ('2021/08/19', 5), ('2021/08/19', 7), ('2021/08/19', 17), ('2021/08/19', 18),
    ('2021/08/20', 9), ('2021/08/20', 11), ('2021/08/20', 19), ('2021/08/20', 20),
    -- semaine 34
    ('2021/08/23', 13), ('2021/08/23', 14), ('2021/08/23', 21), ('2021/08/23', 22),
    ('2021/08/24', 2), ('2021/08/24', 4), ('2021/08/24', 23), ('2021/08/24', 24),
	('2021/08/25', 6), ('2021/08/25', 8), ('2021/08/25', 25), ('2021/08/25', 26),
    ('2021/08/26', 10), ('2021/08/26', 12), ('2021/08/26', 27), ('2021/08/26', 28),
    ('2021/08/27', 1), ('2021/08/27', 2), ('2021/08/27', 15), ('2021/08/27', 16),
    -- semaine 35
    ('2021/08/30', 3), ('2021/08/30', 4), ('2021/08/30', 17), ('2021/08/30', 18),
    ('2021/08/31', 5), ('2021/08/31', 6), ('2021/08/31', 19), ('2021/08/31', 20),
	('2021/09/01', 5), ('2021/09/01', 8), ('2021/09/01', 21), ('2021/09/01', 22),
    ('2021/09/02', 9), ('2021/09/02', 10), ('2021/09/02', 23), ('2021/09/02', 24),
    ('2021/09/03', 11), ('2021/09/03', 12), ('2021/09/03', 25), ('2021/09/03', 26),
    -- semaine 36
    ('2021/09/06', 13), ('2021/09/06', 14), ('2021/09/06', 27), ('2021/09/06', 28),
    ('2021/09/07', 1), ('2021/09/07', 3), ('2021/09/07', 15), ('2021/09/07',16),
	('2021/09/08', 5), ('2021/09/08', 5), ('2021/09/08', 17), ('2021/09/08', 18),
    ('2021/09/09', 9), ('2021/09/09', 11), ('2021/09/09', 19), ('2021/09/09', 20),
    ('2021/09/10', 13), ('2021/09/10', 14), ('2021/09/10', 21), ('2021/09/10', 22),
    -- semaine 37
    ('2021/09/12', 2), ('2021/09/12', 4), ('2021/09/12', 23), ('2021/09/12', 24),
    ('2021/09/13', 6), ('2021/09/13', 8), ('2021/09/13', 25), ('2021/09/13', 26),
	('2021/09/14', 10), ('2021/09/14', 12), ('2021/09/14', 27), ('2021/09/14', 28),
    ('2021/09/15', 1), ('2021/09/15', 2), ('2021/09/15', 15), ('2021/09/15', 16),
    ('2021/09/16', 3), ('2021/09/16', 4), ('2021/09/16', 17), ('2021/09/16', 18);


-- -----------------------------------------
-- creation des produits
-- -----------------------------------------
-- détail pour le 09/08/2021

-- remises à livreur
INSERT INTO produit (ligne_menu_du_jour_id, ligne_menu_du_jour_fiche_produit_id, cuisinier_utilisateur_id, livreur_utilisateur_id) VALUES
	-- item 1 menu du 09/08/2021
    	(1, 1, 4, 2), (1, 1, 4, 2), (1, 1, 4, 2), (1, 1, 4, 2), (1, 1, 4, 2), (1, 1, 4, 2), (1, 1, 4, 2), (1, 1, 4, 2), (1, 1, 4, 2), (1, 1, 4, 2),
        (1, 1, 4, 3), (1, 1, 4, 3), (1, 1, 4, 3), (1, 1, 4, 3), (1, 1, 4, 3), (1, 1, 4, 3), (1, 1, 4, 3), (1, 1, 4, 3), (1, 1, 4, 3), (1, 1, 4, 3),
    -- item 1 menu du 10/08/2021
        (2, 2, 4, 2), (2, 2, 4, 2), (2, 2, 4, 2), (2, 2, 4, 2), (2, 2, 4, 2), (2, 2, 4, 2), (2, 2, 4, 2), (2, 2, 4, 2), (2, 2, 4, 2), (2, 2, 4, 2),
        (2, 2, 4, 3), (2, 2, 4, 3), (2, 2, 4, 3), (2, 2, 4, 3), (2, 2, 4, 3), (2, 2, 4, 3), (2, 2, 4, 3), (2, 2, 4, 3), (2, 2, 4, 3), (2, 2, 4, 3),
    -- item 3 menu du 09/08/2021
        (3, 15, 4, 2), (3, 15, 4, 2), (3, 15, 4, 2), (3, 15, 4, 2), (3, 15, 4, 2), (3, 15, 4, 2), (3, 15, 4, 2), (3, 15, 4, 2), (3, 15, 4, 2), (3, 15, 4, 2),
        (3, 15, 4, 3), (3, 15, 4, 3), (3, 15, 4, 3), (3, 15, 4, 3), (3, 15, 4, 3), (3, 15, 4, 3), (3, 15, 4, 3), (3, 15, 4, 3), (3, 15, 4, 3), (3, 15, 4, 3),
    -- item 4 menu du 09/08/2021
        (4, 16, 4, 2), (4, 16, 4, 2), (4, 16, 4, 2), (4, 16, 4, 2), (4, 16, 4, 2), (4, 16, 4, 2), (4, 16, 4, 2), (4, 16, 4, 2), (4, 16, 4, 2), (4, 16, 4, 2),
        (4, 16, 4, 3), (4, 16, 4, 3), (4, 16, 4, 3), (4, 16, 4, 3), (4, 16, 4, 3), (4, 16, 4, 3), (4, 16, 4, 3), (4, 16, 4, 3), (4, 16, 4, 3), (4, 16, 4, 3);

-- non remises à livreur (réassort éventuel) le 09/08/2021
INSERT INTO produit (ligne_menu_du_jour_id, ligne_menu_du_jour_fiche_produit_id, cuisinier_utilisateur_id) VALUES
	-- item 1 menu du jour, quantité 1
    (1, 1, 4), (1, 1, 4), (1, 1, 4), (1, 1, 4);

-- A la volée pour les autres jours
INSERT INTO produit (ligne_menu_du_jour_id, ligne_menu_du_jour_fiche_produit_id, cuisinier_utilisateur_id, livreur_utilisateur_id) VALUES
    (5, 3, 4, 2), (5, 3, 4, 2), (5, 3, 4, 2), (5, 3, 4, 2), (5, 3, 4, 2), (5, 3, 4, 2), (5, 3, 4, 2), (5, 3, 4, 2), (5, 3, 4, 2), (5, 3, 4, 2), 
	(5, 3, 4, 3), (5, 3, 4, 3), (5, 3, 4, 3), (5, 3, 4, 3), (5, 3, 4, 3), (5, 3, 4, 3), (5, 3, 4, 3), (5, 3, 4, 3), (5, 3, 4, 3), (5, 3, 4, 3),
    (6, 4, 4, 2), (6, 4, 4, 2), (6, 4, 4, 2), (6, 4, 4, 2), (6, 4, 4, 2), (6, 4, 4, 2), (6, 4, 4, 2), (6, 4, 4, 2), (6, 4, 4, 2), (6, 4, 4, 2),
    (6, 4, 4, 3), (6, 4, 4, 3), (6, 4, 4, 3), (6, 4, 4, 3), (6, 4, 4, 3), (6, 4, 4, 3), (6, 4, 4, 3), (6, 4, 4, 3), (6, 4, 4, 3), (6, 4, 4, 3),
    (7, 17, 4, 2), (7, 17, 4, 2), (7, 17, 4, 2), (7, 17, 4, 2), (7, 17, 4, 2), (7, 17, 4, 2), (7, 17, 4, 2), (7, 17, 4, 2), (7, 17, 4, 2), (7, 17, 4, 2),
    (7, 17, 4, 3), (7, 17, 4, 3), (7, 17, 4, 3), (7, 17, 4, 3), (7, 17, 4, 3), (7, 17, 4, 3), (7, 17, 4, 3), (7, 17, 4, 3), (7, 17, 4, 3), (7, 17, 4, 3),
    (8, 18, 4, 2), (8, 18, 4, 2), (8, 18, 4, 2), (8, 18, 4, 2), (8, 18, 4, 2), (8, 18, 4, 2), (8, 18, 4, 2), (8, 18, 4, 2), (8, 18, 4, 2), (8, 18, 4, 2),
    (8, 18, 4, 3), (8, 18, 4, 3), (8, 18, 4, 3), (8, 18, 4, 3), (8, 18, 4, 3), (8, 18, 4, 3), (8, 18, 4, 3), (8, 18, 4, 3), (8, 18, 4, 3), (8, 18, 4, 3),
    (9, 5, 4, 2), (9, 5, 4, 2), (9, 5, 4, 2), (9, 5, 4, 2), (9, 5, 4, 2), (9, 5, 4, 2), (9, 5, 4, 2), (9, 5, 4, 2), (9, 5, 4, 2), (9, 5, 4, 2),
    (9, 5, 4, 3), (9, 5, 4, 3), (9, 5, 4, 3), (9, 5, 4, 3), (9, 5, 4, 3), (9, 5, 4, 3), (9, 5, 4, 3), (9, 5, 4, 3), (9, 5, 4, 3), (9, 5, 4, 3),
    (10, 6, 4, 2), (10, 6, 4, 2), (10, 6, 4, 2), (10, 6, 4, 2), (10, 6, 4, 2), (10, 6, 4, 2), (10, 6, 4, 2), (10, 6, 4, 2), (10, 6, 4, 2), (10, 6, 4, 2),
    (10, 6, 4, 3), (10, 6, 4, 3), (10, 6, 4, 3), (10, 6, 4, 3), (10, 6, 4, 3), (10, 6, 4, 3), (10, 6, 4, 3), (10, 6, 4, 3), (10, 6, 4, 3), (10, 6, 4, 3),
    (11, 15, 4, 2), (11, 15, 4, 2), (11, 15, 4, 2), (11, 15, 4, 2), (11, 15, 4, 2), (11, 15, 4, 2), (11, 15, 4, 2), (11, 15, 4, 2), (11, 15, 4, 2), (11, 15, 4, 2),
    (11, 15, 4, 3), (11, 15, 4, 3), (11, 15, 4, 3), (11, 15, 4, 3), (11, 15, 4, 3), (11, 15, 4, 3), (11, 15, 4, 3), (11, 15, 4, 3), (11, 15, 4, 3), (11, 15, 4, 3),
    (12, 20, 4, 2), (12, 20, 4, 2), (12, 20, 4, 2), (12, 20, 4, 2), (12, 20, 4, 2), (12, 20, 4, 2), (12, 20, 4, 2), (12, 20, 4, 2), (12, 20, 4, 2), (12, 20, 4, 2),
    (12, 20, 4, 3), (12, 20, 4, 3), (12, 20, 4, 3), (12, 20, 4, 3), (12, 20, 4, 3), (12, 20, 4, 3), (12, 20, 4, 3), (12, 20, 4, 3), (12, 20, 4, 3), (12, 20, 4, 3),
    (13, 7, 4, 2), (13, 7, 4, 2), (13, 7, 4, 2), (13, 7, 4, 2), (13, 7, 4, 2), (13, 7, 4, 2), (13, 7, 4, 2), (13, 7, 4, 2), (13, 7, 4, 2), (13, 7, 4, 2),
    (13, 7, 4, 3), (13, 7, 4, 3), (13, 7, 4, 3), (13, 7, 4, 3), (13, 7, 4, 3), (13, 7, 4, 3), (13, 7, 4, 3), (13, 7, 4, 3), (13, 7, 4, 3), (13, 7, 4, 3),
    (14, 8, 4, 2), (14, 8, 4, 2), (14, 8, 4, 2), (14, 8, 4, 2), (14, 8, 4, 2), (14, 8, 4, 2), (14, 8, 4, 2), (14, 8, 4, 2), (14, 8, 4, 2), (14, 8, 4, 2),
    (14, 8, 4, 3), (14, 8, 4, 3), (14, 8, 4, 3), (14, 8, 4, 3), (14, 8, 4, 3), (14, 8, 4, 3), (14, 8, 4, 3), (14, 8, 4, 3), (14, 8, 4, 3), (14, 8, 4, 3),
    (15, 21, 4, 2), (15, 21, 4, 2), (15, 21, 4, 2), (15, 21, 4, 2), (15, 21, 4, 2), (15, 21, 4, 2), (15, 21, 4, 2), (15, 21, 4, 2), (15, 21, 4, 2), (15, 21, 4, 2),
    (15, 21, 4, 3), (15, 21, 4, 3), (15, 21, 4, 3), (15, 21, 4, 3), (15, 21, 4, 3), (15, 21, 4, 3), (15, 21, 4, 3), (15, 21, 4, 3), (15, 21, 4, 3), (15, 21, 4, 3),
    (16, 22, 4, 2), (16, 22, 4, 2), (16, 22, 4, 2), (16, 22, 4, 2), (16, 22, 4, 2), (16, 22, 4, 2), (16, 22, 4, 2), (16, 22, 4, 2), (16, 22, 4, 2), (16, 22, 4, 2),
    (16, 22, 4, 3), (16, 22, 4, 3), (16, 22, 4, 3), (16, 22, 4, 3), (16, 22, 4, 3), (16, 22, 4, 3), (16, 22, 4, 3), (16, 22, 4, 3), (16, 22, 4, 3), (16, 22, 4, 3),
    (17, 9, 4, 2), (17, 9, 4, 2), (17, 9, 4, 2), (17, 9, 4, 2), (17, 9, 4, 2), (17, 9, 4, 2), (17, 9, 4, 2), (17, 9, 4, 2), (17, 9, 4, 2), (17, 9, 4, 2),
    (17, 9, 4, 3), (17, 9, 4, 3), (17, 9, 4, 3), (17, 9, 4, 3), (17, 9, 4, 3), (17, 9, 4, 3), (17, 9, 4, 3), (17, 9, 4, 3), (17, 9, 4, 3), (17, 9, 4, 3),
    (18, 10, 4, 2), (18, 10, 4, 2), (18, 10, 4, 2), (18, 10, 4, 2), (18, 10, 4, 2), (18, 10, 4, 2), (18, 10, 4, 2), (18, 10, 4, 2), (18, 10, 4, 2), (18, 10, 4, 2),
    (18, 10, 4, 3), (18, 10, 4, 3), (18, 10, 4, 3), (18, 10, 4, 3), (18, 10, 4, 3), (18, 10, 4, 3), (18, 10, 4, 3), (18, 10, 4, 3), (18, 10, 4, 3), (18, 10, 4, 3),
    (19, 23, 4, 2), (19, 23, 4, 2), (19, 23, 4, 2), (19, 23, 4, 2), (19, 23, 4, 2), (19, 23, 4, 2), (19, 23, 4, 2), (19, 23, 4, 2), (19, 23, 4, 2), (19, 23, 4, 2),
    (19, 23, 4, 3), (19, 23, 4, 3), (19, 23, 4, 3), (19, 23, 4, 3), (19, 23, 4, 3), (19, 23, 4, 3), (19, 23, 4, 3), (19, 23, 4, 3), (19, 23, 4, 3), (19, 23, 4, 3),
    (20, 24, 4, 2), (20, 24, 4, 2), (20, 24, 4, 2), (20, 24, 4, 2), (20, 24, 4, 2), (20, 24, 4, 2), (20, 24, 4, 2), (20, 24, 4, 2), (20, 24, 4, 2), (20, 24, 4, 2),
    (20, 24, 4, 3), (20, 24, 4, 3), (20, 24, 4, 3), (20, 24, 4, 3), (20, 24, 4, 3), (20, 24, 4, 3), (20, 24, 4, 3), (20, 24, 4, 3), (20, 24, 4, 3), (20, 24, 4, 3),
    (21, 11, 4, 2), (21, 11, 4, 2), (21, 11, 4, 2), (21, 11, 4, 2), (21, 11, 4, 2), (21, 11, 4, 2), (21, 11, 4, 2), (21, 11, 4, 2), (21, 11, 4, 2), (21, 11, 4, 2),
    (21, 11, 4, 3), (21, 11, 4, 3), (21, 11, 4, 3), (21, 11, 4, 3), (21, 11, 4, 3), (21, 11, 4, 3), (21, 11, 4, 3), (21, 11, 4, 3), (21, 11, 4, 3), (21, 11, 4, 3),
    (22, 12, 4, 2), (22, 12, 4, 2), (22, 12, 4, 2), (22, 12, 4, 2), (22, 12, 4, 2), (22, 12, 4, 2), (22, 12, 4, 2), (22, 12, 4, 2), (22, 12, 4, 2), (22, 12, 4, 2),
    (22, 12, 4, 3), (22, 12, 4, 3), (22, 12, 4, 3), (22, 12, 4, 3), (22, 12, 4, 3), (22, 12, 4, 3), (22, 12, 4, 3), (22, 12, 4, 3), (22, 12, 4, 3), (22, 12, 4, 3),
    (23, 25, 4, 2), (23, 25, 4, 2), (23, 25, 4, 2), (23, 25, 4, 2), (23, 25, 4, 2), (23, 25, 4, 2), (23, 25, 4, 2), (23, 25, 4, 2), (23, 25, 4, 2), (23, 25, 4, 2),
    (23, 25, 4, 3), (23, 25, 4, 3), (23, 25, 4, 3), (23, 25, 4, 3), (23, 25, 4, 3), (23, 25, 4, 3), (23, 25, 4, 3), (23, 25, 4, 3), (23, 25, 4, 3), (23, 25, 4, 3),
    (24, 26, 4, 2), (24, 26, 4, 2), (24, 26, 4, 2), (24, 26, 4, 2), (24, 26, 4, 2), (24, 26, 4, 2), (24, 26, 4, 2), (24, 26, 4, 2), (24, 26, 4, 2), (24, 26, 4, 2),
    (24, 26, 4, 3), (24, 26, 4, 3), (24, 26, 4, 3), (24, 26, 4, 3), (24, 26, 4, 3), (24, 26, 4, 3), (24, 26, 4, 3), (24, 26, 4, 3), (24, 26, 4, 3), (24, 26, 4, 3);
