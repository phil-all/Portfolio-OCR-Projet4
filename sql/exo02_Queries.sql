-- Noms des employés du service 31 qui ont un titre du service 32
-- --------------------------------------------------------------
SELECT e1.nom
FROM emp AS e1
JOIN emp AS e2
	ON e1.titre = e2.titre
WHERE e1.nodept = 31 AND e2.nodept = 32;


-- Noms des employés du service 31 qui ont un titre différents du service 32 
-- -------------------------------------------------------------------------
SELECT e1.nom
FROM emp AS e1
JOIN emp AS e2
	ON e1.titre != e2.titre
WHERE e1.nodept = 31 AND e2.nodept =32;


-- Nom des employés qui ont le même titre et salaire que Nicolas
-- -------------------------------------------------------------
-- Deux interprétations possibles, généralement, la question (ambigue) sous-entend la version sans Nicolas dans le résultat,
-- mais bon, c'est selon chacun, suivant sa compréhension de la chose:

-- Avec Nicolas dans le résultat
SELECT e1.nom, e1.titre, e1.salaire
FROM emp AS e1
INNER JOIN emp as e2
	ON e1.titre = e2.titre AND e1.salaire = e2.salaire
WHERE e2.nom = "Nicolas";

-- Sans Nicolas dans le résultat
SELECT e1.nom, e1.titre, e1.salaire
FROM emp AS e1
INNER JOIN emp as e2
	ON e1.titre = e2.titre AND e1.salaire = e2.salaire AND e1.nom != "Nicolas"
WHERE e2.nom = "Nicolas";


-- Moyenne des salaires de chaque département
-- ------------------------------------------
SELECT nodept, AVG(salaire) "salaire moyen"
FROM emp
GROUP BY nodept;


-- Numéro département, nom des employés qui gagne plus que la moyenne de leurs départements
-- ----------------------------------------------------------------------------------------  
SELECT e.nodept, e.nom
FROM emp AS e
INNER JOIN	(SELECT nodept, AVG(salaire) AS salaire FROM emp GROUP BY nodept) AS d
	ON e.nodept = d.nodept
WHERE e.salaire > d.salaire;


-- Noms des employés pour qui il existe au moins un représentant dans leurs départements 
-- -------------------------------------------------------------------------------------
SELECT nom
FROM emp
WHERE nodept = ANY (SELECT nodept FROM emp WHERE titre = "Representant");


-- Non dont le salaire est le plus grand 
-- -------------------------------------
SELECT nom
FROM emp
WHERE salaire = (SELECT MAX(salaire) FROM emp);


-- Nombre de titres différents 
-- ---------------------------
SELECT COUNT(titre) FROM titre;


-- BONUS ;)
-- 
-- 2eme proposition pour exo semaine dernière, avec TOP non reconnu (remplacé par un LIMIT 1)
-- 
-- Non, salaire des employés qui gagne plus (au moins) que tous des employés du département 31
-- -------------------------------------------------------------------------------------------
SELECT nom, salaire FROM emp WHERE salaire > (SELECT salaire FROM emp WHERE nodept = 31 LIMIT 1);





















