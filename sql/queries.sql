-- afficher menu du jour 2021/08/12
-- --------------------------------
SELECT nom FROM fiche_produit WHERE (id IN (SELECT fiche_produit_id FROM ligne_menu_du_jour WHERE date = '2021/08/12'));


-- afficher menu du jour 2021/08/13 avec le type de produit
-- --------------------------------------------------------
SELECT fprod.nom, type.type
FROM fiche_produit AS fprod
JOIN type_produit AS type
	ON type.id = fprod.type_produit_id
WHERE (fprod.id IN (SELECT fiche_produit_id FROM ligne_menu_du_jour WHERE date = '2021/08/13'));


-- afficher tous les menus du jour, classés par date
-- -------------------------------------------------
SELECT fprod.id, fprod.nom, type.type, line.date
FROM fiche_produit AS fprod
INNER JOIN type_produit AS type
	ON type.id = fprod.type_produit_id
INNER JOIN ligne_menu_du_jour AS line
	ON line.fiche_produit_id = fprod.id
ORDER BY DATE;
	

-- afficher les produits (avec fiche prod id 15) confiés à livreur id 3 le 2021/08/09 et non livrés
-- -----------------------------------------------------------------------------------------------
SELECT p.id, l.date 
FROM produit AS p 
JOIN ligne_menu_du_jour AS l 
	ON l.id = p.ligne_menu_du_jour_id 
WHERE p.commande_id IS NULL
	AND l.fiche_produit_id = 15 
	AND p.livreur_utilisateur_id = 3
	AND l.date = '2021-08-09';


-- Afficher la liste des commandes du client avec id utilisateur 6
-- ---------------------------------------------------------------
SELECT com.id, pay.montant, pay.date_paiement
FROM commande AS com
JOIN reglement AS pay ON pay.id = com.reglement_id
WHERE client_utilisateur_id = 6;


-- --------------------------------------------------------------------------------------------------

-- création d'un user comme si il se créait un compte
-- --------------------------------------------------
-- champs renseignés dans l'interface de l'appli:
-- nom : Vetaire
-- prénom : Sophie
-- numéro de téléphone : 0442446185
-- email : sosolabrune@gmail.com
-- mot de passe : xckqSPO2561RGDQhe

START TRANSACTION;
INSERT INTO utilisateur (nom, prenom, email, password) VALUES ('Vetaire', 'Sophie', 'sosolabrune@gmail.com', 'gxckqSPO2561RGDQhe');
INSERT INTO client (utilisateur_id, telephone) VALUES ((SELECT MAX(id) FROM utilisateur), '0442446185');
COMMIT;


-- le select des menus du jour comme si il voulait choisir son menu
-- ----------------------------------------------------------------
SELECT fprod.nom, type.type, fprod.prix
FROM fiche_produit AS fprod
JOIN type_produit AS type
	ON type.id = fprod.type_produit_id
WHERE (fprod.id
	IN (SELECT fiche_produit_id
		FROM ligne_menu_du_jour
		WHERE date = ( SELECT DATE( NOW() ) ) ) );


-- le create d'une commande comme si le client sélectionnait son repas
-- -------------------------------------------------------------------
-- le panier se situe en cache de l'application (array dans $_SESSION)
-- on peut imaginer une table temporaire créée dès la connexion du client, pour contenir les données de cet array
CREATE TEMPORARY TABLE tmp_cart (
	fiche_produit_id SMALLINT UNSIGNED NOT NULL,
	quantite TINYINT UNSIGNED NOT NULL,
	prix_unitaire DECIMAL(4,2),
    commande_id INT UNSIGNED DEFAULT NULL);

-- le client sélectionne des produits qu'il rajoute à son panier (dans $_SESSION['cart'])
-- à chaque ajout, on met à jour tmp_cart, exemple:
INSERT INTO tmp_cart VALUES (11, 2, 7.5, NULL);
INSERT INTO tmp_cart VALUES (5, 1, 7.5, NULL);

-- pour afficher le prix total du panier, qui sera réclamé en montant du règlement si panier basculé en commande
SELECT SUM(quantite*prix_unitaire) "montant total du panier"
FROM tmp_cart;

-- le client (id 5) est satisfait par le délai de livraison estimé et bascule son panier en commande
-- il effectue le règlement, validé par sa banque
START TRANSACTION;
INSERT INTO reglement (client_utilisateur_id, montant, date_paiement) VALUES
	(5,
	 (SELECT SUM(quantite*prix_unitaire) FROM tmp_cart),
	 NOW()
     );

-- on créé l'entrée dans la table commande
INSERT INTO commande (client_utilisateur_id, adresse_client_id, reglement_id, estimation_delais_livraison)
VALUES (5,
		1,
		(SELECT MAX(id) FROM reglement),
        '00:15:21');

-- on affecte chaque ligne du panier à une ligne (de ligne_commande) associée à la commande crée
UPDATE tmp_cart SET commande_id = (SELECT MAX(id) FROM commande);
INSERT INTO ligne_commande (commande_id, quantite, fiche_produit_id)
SELECT commande_id, quantite, fiche_produit_id FROM tmp_cart;

DROP TEMPORARY TABLE tmp_cart;

COMMIT;


-- le select de ses commandes
-- --------------------------
SELECT c.id, s.statut, c.heure_prise_en_charge, c.heure_remise_client
FROM commande AS c
JOIN statut_commande AS s
	ON c.statut_commande_id = s.id
WHERE client_utilisateur_id = 5;



-- le select de la commande non livrée pour voir quand le livreur arriverait
-- -------------------------------------------------------------------------
SELECT c.id, s.statut, c.estimation_delais_livraison
FROM commande AS c
JOIN statut_commande AS s
	ON c.statut_commande_id = s.id
WHERE client_utilisateur_id = 5 AND statut_commande_id != 3;




-- à partir de cas d'utilisation et diag de séquence:
-- --------------------------------------------------
-- l'admin recherche un produit par nom ou description pour l'affecter à un menu du jour, ou le créer le cas échéant
-- -----------------------------------------------------------------------------------------------------------------
-- par ex : terme recherché : pates palourdes / on lui propose un résultat contenant au moins un des deux termes et 
-- renvoyant l'id, le type, le nom et la description (ici pour cet exemple, les termes recherchés ne sont pas dans l'intitulé mais la description)
SELECT f.id, t.type, f.nom, f.description
FROM fiche_produit AS f
JOIN type_produit AS t
	ON f.type_produit_id = t.id
WHERE (f.nom like "%pates%" OR "%palourdes%") OR (f.description like "%pates%" OR "%palourdes%");

-- l'admin associe un produit à un menu du jour
-- --------------------------------------------
-- la requète précédente a renvoyé le résultat suivant:
-- id	+ type	+ nom						+ description							+
-- 3	+ plat	+ Linguini alle vongole		+ Recette traditionnelle de pates....	+
-- on affecte ce plat au menu du jour : 17 sept 2021
INSERT INTO ligne_menu_du_jour (fiche_produit_id, date) VALUES (3, "2021/09/17");











