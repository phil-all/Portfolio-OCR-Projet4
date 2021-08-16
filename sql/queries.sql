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
WHERE p.commande_id IS NULL AND l.fiche_produit_id = 15 AND p.livreur_utilisateur_id = 3 AND l.date = '2021-08-09'; 


-- Afficher la liste des commandes du client avec id utilisateur 6
-- ---------------------------------------------------------------
SELECT com.id, pay.montant, pay.date_paiement
FROM commande AS com
JOIN reglement AS pay ON pay.id = com.reglement_id
WHERE client_utilisateur_id = 6;


-- Afficher le détail de la dernière commande du client id 6
-- ---------------------------------------------------------
SELECT fp.nom, fp.prix, line.date, 
