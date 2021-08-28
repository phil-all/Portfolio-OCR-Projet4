-- Prénom des employés et numéro de région de leurs départements
-- -------------------------------------------------------------
SELECT e.emp, d.noregion
FROM emp AS e
JOIN dept AS d
	ON e.nodept = d.nodept;

-- solution:
-- e.emp -> e.prenom

select prenom, noregion 
from emp, dept 
where emp.nodept = dept.nodept;
-- (préférer une jointure avec 'on')

-- Noms des employés et noms de la région
-- --------------------------------------
SELECT e.nom, r.nom
FROM emp AS e
INNER JOIN dept AS d
	ON e.nodept = d.nodept
INNER JOIN region AS r
	ON d.noregion = r.noregion;

-- solution (mieux chez toi):
select emp.nom, region.nom
from emp, dept, region
where emp.nodept = dept.nodept
    and dept.noregion = region.noregion;
-- (préférer une jointure avec 'on')


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

-- solution (mieux chez toi):
select e.nom, e.salaire, p.nom, p.salaire
from emp e, emp p
where e.nosupr = p.noemp
    and e.salaire > p.salaire;


-- Non, salaire des employés qui gagne plus que Dumas
-- --------------------------------------------------
SELECT nom, salaire
FROM emp
WHERE salaire > (SELECT salaire FROM emp WHERE nom = 'DUMAS');

-- solution (equivalent):
select e.nom, e.salaire
from emp e, emp D
where D.nom = 'Dumas'
    and e.salaire > D.salaire;


-- Nom des employés qui ont le même titre que Dumas
-- ------------------------------------------------
SELECT nom, titre
FROM emp
WHERE titre = (SELECT titre FROM emp WHERE nom = 'DUMAS') AND nom != 'DUMAS';

-- solution (attention à l'énoncé ;) et les selects imbriqués à la ligne en tabulation)
select nom
from emp
where titre = (
    select titre
    from emp
    where nom = 'Dumas'
);


-- Non, salaire des employés qui gagne plus (au moins) que tous des employés du département 31
-- -------------------------------------------------------------------------------------------
-- > la somme de tous les salire du dpt 31
SELECT nom, salaire FROM emp WHERE salaire > (SELECT SUM(salaire) FROM emp WHERE nodept = 31);

-- ou

-- > plus gors salire dpt 31
SELECT nom, salaire FROM emp WHERE salaire > (SELECT TOP1 salaire FROM emp WHERE nodept = 31);

-- solution (mon mysql 5.7 n'accepte pas le top : Erreur de syntaxe près de '1) :
-- Non, salaire des employés qui gagne plus que tous des employés du département 31  
select nom, salaire 
from emp 
where salaire > all (
    select salaire 
    from emp 
    where nodept=31
);


-- Non, salaire des employés qui gagne moins que tous des employés du département 31 (suite)
select nom, salaire 
from emp 
where salaire > any (
    select salaire 
    from emp 
    where nodept=31
);


-- -- Noms des employés du service 31 qui ont un titre du service 32
-- --------------------------------------------------------------
SELECT e1.nom
FROM emp AS e1
JOIN emp AS e2
	ON e1.titre = e2.titre
WHERE e1.nodept = 31 AND e2.nodept = 32;

-- solution (8ms pour moi et 9ms pour toi, mais à approfondir)
select nom 
from emp 
where nodept = 31
    and titre in (
    select titre 
    from emp 
    where nodept=32
);

-- Noms des employés du service 31 qui ont un titre différents du service 32 
-- -------------------------------------------------------------------------
SELECT e1.nom
FROM emp AS e1
JOIN emp AS e2
	ON e1.titre != e2.titre
WHERE e1.nodept = 31 AND e2.nodept =32;

-- solution (équivalent, mais à approfondir)
select nom 
from emp 
where nodept = 31
    and titre not in (
    select titre 
    from emp 
    where nodept=32
);


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

-- solution (équivalent, mais à approfondir)
select nom 
from emp 
where (titre, salaire) = (
    select titre , salaire
    from emp 
    where nom='Nicolas'
);


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

-- solution (en moyenne je suis plus rapide, mais à approfondir)
select nodept, nom 
from emp e
where salaire > (
    select avg(salaire)
    from emp 
    where nodept = e.nodept
);

-- Noms des employés pour qui il existe au moins un représentant dans leurs départements 
-- -------------------------------------------------------------------------------------
SELECT nom
FROM emp
WHERE nodept = ANY (SELECT nodept FROM emp WHERE titre = "Representant");

-- solution (en moyenne tu es plus rapide, mais à approfondir)
select nom 
from emp e
where exists (
    select null
    from emp 
    where titre = 'Representant'
        and nodept = e.nodept
);


-- Non dont le salaire est le plus grand 
-- -------------------------------------
SELECT nom
FROM emp
WHERE salaire = (SELECT MAX(salaire) FROM emp);

-- j'ai exactement la même 😃


-- Nombre de titres différents 
-- ---------------------------
SELECT COUNT(titre) FROM titre;

-- solution (plus classique)
select count(distinct titre) 
from emp;


-- BONUS ;)
-- 
-- 2eme proposition pour exo semaine dernière, avec TOP non reconnu (remplacé par un LIMIT 1)
-- 
-- Non, salaire des employés qui gagne plus (au moins) que tous des employés du département 31
-- -------------------------------------------------------------------------------------------
SELECT nom, salaire FROM emp WHERE salaire > (SELECT salaire FROM emp WHERE nodept = 31 LIMIT 1);

-- le temps à l'air équivalent :)








-- to do

-- Moyenne des salaires de chaque département
-- ------------------------------------------
SELECT AVG(salaire), nodept FROM emp GROUP BY nodept;


-- Nombre d'employés par département et par titre
-- ----------------------------------------------
SELECT COUNT(*) "Nb Emp", nodept, titre FROM emp GROUP BY titre, nodept;


-- Nom département titre nombre d'employés par département titre 
-- -------------------------------------------------------------
SELECT e.nom, e.nodept, e.titre, t.Nb "Nb Emp du dept de même titre"
FROM emp AS e
JOIN (SELECT COUNT(*) "Nb", nodept, titre FROM emp GROUP BY titre, nodept) AS t
	ON e.nodept = t.nodept AND e.titre = t.titre;


-- Titre nombre d'employés pour (ayant) les titres représenter plus de 2 fois
-- --------------------------------------------------------------------------
SELECT titre, COUNT(*) "Nombre" FROM emp GROUP BY titre HAVING Nombre > 2;
 

-- Titre moyenne des salaires par titre dont (ayant) la moyenne est supérieure à la moyenne des représentants
-- ----------------------------------------------------------------------------------------------------------
SELECT titre, AVG(salaire)
FROM emp
GROUP BY titre HAVING AVG(salaire) > (SELECT AVG(salaire) FROM emp WHERE titre = "Representant");













