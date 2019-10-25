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
SOURCE SQL/Demo/niv_autorisation.sql;
SELECT 'IMPORT DU STAFF';
SOURCE SQL/Demo/staffDemo.sql;
SELECT 'IMPORT DES CLIENTS';
SOURCE SQL/Demo/clientDemo.sql;
SELECT 'IMPORT DES ADRESSE CLIENTS';
SOURCE SQL/Demo/adresse_clientDemo.sql;
SELECT 'IMPORT DES TEL CLIENTS';
SOURCE SQL/Demo/contact_tel_clientDemo.sql;
SELECT 'IMPORT DES PIZZERIAS';
SOURCE SQL/Demo/pizzeriaDemo.sql;
SELECT 'IMPORT DES AFFECTATION DU STAFF';
SOURCE SQL/Demo/affectation_staffDemo.sql;
SELECT 'IMPORT DES CATEGORIES DE PRODUITS';
SOURCE SQL/Demo/categorie_produitDemo.sql;
SELECT 'IMPORT DES CATEGORIES INGREDIENTS';
SOURCE SQL/Demo/categorie_ingredientDemo.sql;
SELECT 'IMPORT DES PRODUITS';
SOURCE SQL/Demo/produitDemo.sql;
SELECT 'IMPORT DES INGREDIENTS';
SOURCE SQL/Demo/ingredientDemo.sql;
SELECT 'IMPORT DES RECETTES';
SOURCE SQL/Demo/ingredient_pizzaDemo.sql;
SELECT 'IMPORT DES COMMANDES';
SOURCE SQL/Demo/commandeDemo.sql;
SELECT 'IMPORT DES LIVRAISONS';
SOURCE SQL/Demo/livraisonDemo.sql;
SELECT 'IMPORT DES FACTURES';
SOURCE SQL/Demo/factureDemo.sql;
SELECT 'IMPORT DES LIGNE DE COMMANDE';
SOURCE SQL/Demo/ligne_commandeDemo.sql;
SELECT 'IMPORT DES MVT DE STOCK';
SOURCE SQL/Demo/mouvement_stockDemo.sql;
SELECT 'IMPORT DES STOCKS ACTUELS';
SOURCE SQL/Demo/stock_actuel.sql;
