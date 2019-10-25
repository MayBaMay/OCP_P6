-- aj-je une perte de précision sur les prix?
-- ma commande peut-elle contenir plusieurs pizzas?
-- puis-je retrouver le contenu d'une commande?
SELECT SUM(prix_unitaire_HT * quantite * (1 + taux_TVA_100 / 100)) AS TOTAL_TTC
FROM ligne_commande
WHERE numero_cmde = 'C10_201903_1';

SELECT ligne_commande.numero_cmde AS NUM_CMDE,
      ligne_commande.numero_ligne AS NUM_LGN,
      produit.nom AS NOM,
      ligne_commande.quantite AS QUANTITE,
      ligne_commande.prix_unitaire_HT AS HT_CMDE,
      ligne_commande.taux_TVA_100 AS TVA_CMDE,
      (ligne_commande.prix_unitaire_HT * ligne_commande.quantite * (1 + ligne_commande.taux_TVA_100 / 100)) AS TTC_LG_CMDE
FROM ligne_commande
INNER JOIN produit
  ON produit.id = ligne_commande.produit
WHERE numero_cmde = 'C6_210906_678';

-- ai-je une perte d'info sur les numéros de téléphone?
UPDATE contact_tel_client
SET num_tel = '+33 1 23 45 67 89'
WHERE identifiant_client = 1;

SELECT num_tel FROM contact_tel_client
WHERE identifiant_client = 1;

UPDATE contact_tel_client
SET num_tel = '+61 1 2345 6789'
WHERE identifiant_client = 2;

SELECT num_tel FROM contact_tel_client
WHERE identifiant_client = 2;

-- ai-je suffisamment de caractères pour enregistrer un mot de passe chiffré ?
UPDATE client
SET password = '$pbkdf2-sha256$29000$N2YMIWQsBWBMae09x1jrPQ$1t8iyB2A.WF/Z5JZv.lfCIhXXN33N23OSgQYThBYRfksfdqdfbhsdfhqhfd'
WHERE identifiant = 1;

SELECT identifiant, prenom, nom, password
FROM client
WHERE identifiant < 5;

-- puis-je afficher les commandes en attente dans un resto particulier?
SELECT lg.numero_cmde AS NUM_CMDE,
      lg.numero_ligne AS NUM_LGN,
      prod.nom AS NOM,
      lg.quantite AS QUANTITE,
      lg.prix_unitaire_HT AS HT_CMDE,
      lg.taux_TVA_100 AS TVA_CMDE,
      (lg.prix_unitaire_HT * lg.quantite * (1 + lg.taux_TVA_100 / 100)) AS TTC_LG_CMDE,
      cmd.statut AS STATUT
FROM ligne_commande AS lg
INNER JOIN commande AS cmd
  ON cmd.numero_cmde = lg.numero_cmde
INNER JOIN produit AS prod
  ON prod.id = lg.produit
WHERE cmd.statut = 'En attente de préparation'
  OR cmd.statut = 'En attente de livraison'
  AND cmd.pizzeria_id = 6
ORDER BY lg.numero_cmde, lg.numero_ligne;

-- puis-je afficher les commandes en attente d'un client?
SELECT CONCAT (cl.nom, ' ', cl.prenom),
      lg.numero_cmde AS NUM_CMDE,
      lg.numero_ligne AS NUM_LGN,
      prod.nom AS NOM,
      lg.quantite AS QUANTITE,
      lg.prix_unitaire_HT AS HT_CMDE,
      lg.taux_TVA_100 AS TVA_CMDE,
      (lg.prix_unitaire_HT * lg.quantite * (1 + lg.taux_TVA_100 / 100)) AS TTC_LG_CMDE,
      cmd.statut AS STATUT
FROM ligne_commande AS lg
INNER JOIN commande AS cmd
  ON cmd.numero_cmde = lg.numero_cmde
INNER JOIN produit AS prod
  ON prod.id = lg.produit
INNER JOIN client AS cl
  ON cmd.identifiant_client = cl.identifiant
WHERE cmd.identifiant_client = 11
  AND cmd.statut = 'En attente de préparation'
  OR cmd.statut = 'En attente de livraison'
ORDER BY lg.numero_cmde, lg.numero_ligne;

SELECT numero_cmde,
  identifiant_client,
  statut
FROM commande
WHERE identifiant_client = 11;

-- puis-je afficher l'adresse de livraison d'une commande terminée même après que le client a changé son adresse?
UPDATE adresse_client SET adresse_actuelle = false
WHERE identifiant_client = 15;
insert into  adresse_client (identifiant_client, adresse_actuelle, voie, num_voie, complement_adresse, commentaire, code_postal, commune) values (15, true, 'rue de belleville', 18, 'cedex 26', 'chez Mme Irma', '33000', 'Bordeaux');

SELECT commande.numero_cmde,
      client.identifiant,
      adresse_client.id
FROM client
INNER JOIN commande ON client.identifiant = commande.identifiant_client
INNER JOIN adresse_client ON adresse_client.id = client.identifiant
WHERE numero_cmde = 'C6_201908_489'
ORDER BY commande.numero_cmde;

-- puis retrouver le prix payé pour une pizza dans une commande terminé même si le prix a changé depuis?
UPDATE produit SET prix_unitaire_HT = prix_unitaire_HT * 1.002;
SELECT ligne_commande.prix_unitaire_HT AS prix_cmde,
      produit.prix_unitaire_HT AS prix_actuels
FROM ligne_commande
INNER JOIN produit ON produit.id = ligne_commande.produit
WHERE ligne_commande.numero_cmde = 'C6_201908_489';

-- puis-je lister les pizzas pour lesquelles tous les ingrédients sont en stock?

-- Dans une pizzeria spécifique
SELECT produit.nom
FROM produit
WHERE produit.nom NOT IN (
      SELECT produit.nom
      FROM ingredient_pizza AS recette
      INNER JOIN produit ON produit.id = recette.produit_id
      INNER JOIN stock_actuel AS stock ON stock.ingredient_id = recette.ingredient_id
      WHERE stock.pizzeria_id = 1
          AND recette.quantite > stock.quantite
      )
    ORDER BY produit.nom;
