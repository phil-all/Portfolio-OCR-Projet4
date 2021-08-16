-- Prénom des employés et numéro de région de leurs départements
-- -------------------------------------------------------------
SELECT e.emp, d.noregion
FROM emp AS e
JOIN dept AS d
ON e.nodept = d.nodept;


-- Noms des employés et noms de la région
-- --------------------------------------
SELECT e.nom, r.nom
FROM emp AS e
INNER JOIN dept AS d
ON e.nodept = d.nodept
INNER JOIN region AS r
ON d.noregion = r.noregion;


-- Non, salaire des employés, non, salaire des patrons, les employés qui gagne plus que leur patron (auto jointure)
-- ----------------------------------------------------------------------------------------------------------------
	-- 1 - nosupr, non, salaire des employés, nosupr, nom, salaire des patrons
	-- ---------------------------------------------------------------------
	SELECT e1.nosupr, e1.nodept, e1.nom, e1.salaire, e2.nosupr, e2.nodept, e2.nom, e2.salaire
	FROM emp AS e1
	LEFT OUTER JOIN emp AS e2
	ON e2.noemp = e1.nosupr
	ORDER BY e1.nosupr;

	-- 2 - Les employés qui gagne plus que leur patron
	-- --------------------------------------------------------
	-- raisonnement: d'après la liste ci dessus, je veux la liste  lorsque e1.supr > e2.supr ET e1.salaire > e2.salaire

	SELECT e1.nom, e1.salaire, e2.nom, e2.salaire
	FROM emp AS e1
	LEFT OUTER JOIN emp AS e2
	ON e2.noemp = e1.nosupr
	WHERE e1.nosupr > e2.nosupr AND e1.salaire > e2.salaire;


-- Non, salaire des employés qui gagne plus que Dumas
-- --------------------------------------------------
SELECT nom, salaire
FROM emp
WHERE salaire > (SELECT salaire FROM emp WHERE nom = 'DUMAS');


-- Nom des employés qui ont le même titre que Dumas
-- ------------------------------------------------
SELECT nom, titre
FROM emp
WHERE titre = (SELECT titre FROM emp WHERE nom = 'DUMAS') AND nom != 'DUMAS';


-- Non, salaire des employés qui gagne plus (au moins) que tous des employés du département 31
-- -------------------------------------------------------------------------------------------
-- > la somme de tous les salire du dpt 31
SELECT nom, salaire FROM emp WHERE salaire > (SELECT SUM(salaire) FROM emp WHERE nodept = 31);

ou

-- > plus gors salire dpt 31
SELECT nom, salaire FROM emp WHERE salaire > (SELECT TOP 1 salaire FROM emp WHERE nodept = 31);




















