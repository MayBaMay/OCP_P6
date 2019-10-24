-- Réinitialisation des données

DELETE FROM livraison;
DELETE FROM adresse_client;
DELETE FROM contact_tel_client;
DELETE FROM facture;
DELETE FROM ligne_commande;
DELETE FROM commande;
DELETE FROM client;
DELETE FROM affectation_staff;
DELETE FROM mouvement_stock;
DELETE FROM stock_actuel;
DELETE FROM pizzeria;
DELETE FROM ingredient_pizza;
DELETE FROM ingredient;
DELETE FROM produit;
DELETE FROM categorie_ingredient;
DELETE FROM categorie_produit;
DELETE FROM mb_staff;
DELETE FROM niv_autorisation;
DELETE FROM mb_staff;


-- Import des données

SELECT 'IMPORT NIV AUTORISATION';
SOURCE Demo/niv_autorisation.sql;
SELECT 'IMPORT DU STAFF';
SOURCE Demo/staffDemo.sql;
SELECT 'IMPORT DES CLIENTS';
SOURCE Demo/clientDemo.sql;
SELECT 'IMPORT DES ADRESSE CLIENTS';
SOURCE Demo/adresse_clientDemo.sql;
SELECT 'IMPORT DES TEL CLIENTS';
SOURCE Demo/contact_tel_clientDemo.sql;
SELECT 'IMPORT DES PIZZERIAS';
SOURCE Demo/pizzeriaDemo.sql;
SELECT 'IMPORT DES AFFECTATION DU STAFF';
SOURCE Demo/affectation_staffDemo.sql;
SELECT 'IMPORT DES CATEGORIES DE PRODUITS';
SOURCE Demo/categorie_produitDemo.sql;
SELECT 'IMPORT DES CATEGORIES INGREDIENTS';
SOURCE Demo/categorie_ingredientDemo.sql;
SELECT 'IMPORT DES PRODUITS';
SOURCE Demo/produitDemo.sql;
SELECT 'IMPORT DES INGREDIENTS';
SOURCE Demo/ingredientDemo.sql;
SELECT 'IMPORT DES RECETTES';
SOURCE Demo/ingredient_pizzaDemo.sql;
SELECT 'IMPORT DES COMMANDES';
SOURCE Demo/commandeDemo.sql;
SELECT 'IMPORT DES LIVRAISONS';
SOURCE Demo/livraisonDemo.sql;
SELECT 'IMPORT DES FACTURES';
SOURCE Demo/factureDemo.sql;
SELECT 'IMPORT DES LIGNE DE COMMANDE';
SOURCE Demo/ligne_commandeDemo.sql;
SELECT 'IMPORT DES MVT DE STOCK';
SOURCE Demo/mouvement_stockDemo.sql;
SELECT 'IMPORT DES STOCKS ACTUELS';
SOURCE Demo/stock_actuel.sql;
