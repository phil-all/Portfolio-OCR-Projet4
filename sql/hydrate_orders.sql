-- -----------------------------------------------------------------------------------
-- création commande 1 le 2021/08/09 (livraison à l'adresse par défaut du client id 6)
-- -----------------------------------------------------------------------------------
-- On initialise la transaction
BEGIN;

-- création table temporaire
CREATE TABLE tmp_cart (
	id INT UNSIGNED NOT NULL,
	prix DECIMAL(4,2) UNSIGNED NOT NULL);

-- création d'un règlement à partir de données panier en cache de l'appli
-- (ex $_SESSION['panier'] contient produits > fiche_prod id 1 et 15)
    -- calcul montant total
    INSERT INTO tmp_cart (id, prix) VALUES (1, (SELECT prix FROM fiche_produit WHERE id = 1));
    INSERT INTO tmp_cart (id, prix) VALUES (15, (SELECT prix FROM fiche_produit WHERE id= 15));
    -- création du règlement
    INSERT INTO reglement (client_utilisateur_id, montant, date_paiement) VALUES (6, (SELECT SUM(prix) FROM tmp_cart), '2021-08-09 11:45:37');

-- on créé une commande
INSERT INTO commande (reglement_client_utilisateur_id, adresse_client_id, reglement_id) VALUES
    (6,
    (SELECT id FROM adresse_client WHERE (client_utilisateur_id = 6 AND principale = 1)),
    (SELECT MAX( id ) FROM reglement));

-- création des lignes commande
INSERT INTO ligne_commande (fiche_produit_id, quantite, commande_id) VALUES
    (1, (SELECT COUNT(id) FROM tmp_cart WHERE id = 1), (SELECT MAX( id ) FROM commande)),
    (15, (SELECT COUNT(id) FROM tmp_cart WHERE id = 15), (SELECT MAX( id ) FROM commande));

-- suppression table temporaire
DROP TABLE IF EXISTS tmp_cart;

-- on valide la transaction
COMMIT;

-- LIVRIASON par livreur id 2 de la commande id 1
	-- traçabilité produits livrés, flashés par livreur lors de livraison (produits id 1 et 41)
	UPDATE produit SET commande_id = 1 WHERE id = 1;
	UPDATE produit SET commande_id = 1 WHERE id = 41;

	-- mise à jour de la commande
	UPDATE commande SET
		livreur_utilisateur_id = 2,
		statut_commande_id = 3,
		heure_prise_en_charge = '2021-08-09 11:45:58',
		heure_remise_client = '2021-08-09 11:59:25'
		WHERE id = 1;


-- -------------------------------------------------------------------
-- création commande 2, client 5, produits > fiche_prod id 2, 15 et 16
-- -------------------------------------------------------------------
BEGIN;

CREATE TABLE tmp_cart (
	id INT UNSIGNED NOT NULL,
	prix DECIMAL(4,2) UNSIGNED NOT NULL);

INSERT INTO tmp_cart (id, prix) VALUES (2, (SELECT prix FROM fiche_produit WHERE id = 1));
INSERT INTO tmp_cart (id, prix) VALUES (15, (SELECT prix FROM fiche_produit WHERE id= 15));
INSERT INTO tmp_cart (id, prix) VALUES (15, (SELECT prix FROM fiche_produit WHERE id= 16));

INSERT INTO reglement (client_utilisateur_id, montant, date_paiement) VALUES (5, (SELECT SUM(prix) FROM tmp_cart), '2021-08-09 11:52:03');

INSERT INTO commande (reglement_client_utilisateur_id, adresse_client_id, reglement_id) VALUES
    (5,
    (SELECT id FROM adresse_client WHERE (client_utilisateur_id = 5 AND principale = 1)),
    (SELECT MAX( id ) FROM reglement));

INSERT INTO ligne_commande (fiche_produit_id, quantite, commande_id) VALUES
    (1, (SELECT COUNT(id) FROM tmp_cart WHERE id = 1), (SELECT MAX( id ) FROM commande)),
    (15, (SELECT COUNT(id) FROM tmp_cart WHERE id = 15), (SELECT MAX( id ) FROM commande)),
	(16, (SELECT COUNT(id) FROM tmp_cart WHERE id = 15), (SELECT MAX( id ) FROM commande));

DROP TABLE IF EXISTS tmp_cart;

COMMIT;

-- LIVRIASON par livreur id 3 de la commande id 2
UPDATE produit SET commande_id = 2 WHERE id = 31;
UPDATE produit SET commande_id = 2 WHERE id = 51;
UPDATE produit SET commande_id = 2 WHERE id = 71;

UPDATE commande SET
	livreur_utilisateur_id = 2,
	statut_commande_id = 3,
	heure_prise_en_charge = '2021-08-09 11:53:18',
	heure_remise_client = '2021-08-09 12:17:01'
	WHERE id = 2;




