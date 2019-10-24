-- OC PIZZA Database : DATABASE AND TABLES CREATION --



-- Create the ocPizza database after droping the previous one if exists
DROP DATABASE IF EXISTS ocPizza;
CREATE DATABASE ocPizza CHARACTER SET 'utf8';


-- Use oc_pizza database
USE ocPizza;


-- Create tables in ocPizza database.

CREATE TABLE niv_autorisation (
                id INT DEFAULT 4 NOT NULL,
                nom VARCHAR(150) NOT NULL,
                PRIMARY KEY (id)
);

CREATE TABLE categorie_produit (
                id INT AUTO_INCREMENT NOT NULL,
                nom_categorie VARCHAR(50) NOT NULL,
                PRIMARY KEY (id)
);

CREATE TABLE categorie_ingredient (
                id INT AUTO_INCREMENT NOT NULL,
                nom_categorie VARCHAR(50) NOT NULL,
                PRIMARY KEY (id)
);

CREATE TABLE ingredient (
                id INT NOT NULL,
                nom VARCHAR(100) NOT NULL,
                unite_de_mesure VARCHAR(20) DEFAULT 'unité',
                categorie_id INT,
                PRIMARY KEY (id)
);

CREATE TABLE produit (
                id INT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(50) NOT NULL,
                prix_unitaire_HT DECIMAL(7, 3),
                taux_TVA_100 DECIMAL(3, 1) DEFAULT 5.5,
                type_produit VARCHAR(150) DEFAULT 'Revente' NOT NULL,
                categorie_id INT,
                PRIMARY KEY (id)
);

CREATE TABLE ingredient_pizza (
                produit_id INT NOT NULL,
                ingredient_id INT NOT NULL,
                quantite DECIMAL NOT NULL,
                PRIMARY KEY (produit_id, ingredient_id)
);

CREATE TABLE pizzeria (
                id INT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(100) NOT NULL,
                tel CHAR(20) NOT NULL,
                num_voie INT,
                voie VARCHAR(250) NOT NULL,
                complement_adresse VARCHAR(250),
                commentaire TEXT,
                code_postal INT NOT NULL,
                commune VARCHAR(150) NOT NULL,
                PRIMARY KEY (id)
);

CREATE TABLE stock_actuel (
                ingredient_id INT NOT NULL,
                pizzeria_id INT NOT NULL,
                quantite INT NOT NULL,
                quantite_alerte INT,
                alerte BOOLEAN,
                PRIMARY KEY (ingredient_id, pizzeria_id)
);

CREATE TABLE mouvement_stock (
                id INT AUTO_INCREMENT NOT NULL,
                pizzeria_id INT NOT NULL,
                quantite DECIMAL NOT NULL,
                ingredient_id INT NOT NULL,
                PRIMARY KEY (id)
);

CREATE TABLE mb_staff (
                identifiant INT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                poste_principal VARCHAR(100) NOT NULL,
                autorisation INTEGER NOT NULL,
                tel VARCHAR(20) NOT NULL,
                mail VARCHAR(250) NOT NULL,
                password VARCHAR(250) NOT NULL,
                PRIMARY KEY (identifiant)
);

CREATE TABLE affectation_staff (
                pizzeria_id INT NOT NULL,
                identifiant_staff INT NOT NULL,
                date_debut DATETIME,
                date_fin DATETIME,
                PRIMARY KEY (pizzeria_id, identifiant_staff)
);

CREATE TABLE client (
                identifiant INT AUTO_INCREMENT NOT NULL,
                cpte_en_ligne BOOLEAN NOT NULL,
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                mail VARCHAR(250) NOT NULL,
                password VARCHAR(250) NOT NULL,
                PRIMARY KEY (identifiant)
);

CREATE TABLE commande (
                numero_cmde VARCHAR(150) NOT NULL,
                pizzeria_id INT NOT NULL,
                identifiant_client INT NOT NULL,
                adresse_client INT,
                date_cmde DATETIME DEFAULT NOW() NOT NULL,
                statut VARCHAR(100) DEFAULT 'En attente de préparation' NOT NULL,
                reduction_100 INT,
                paiement BOOLEAN DEFAULT false,
                type_paiement VARCHAR(20),
                serveur INT,
                pizzaiolo INT,
                prepa_time_debut TIME,
                prepa_time_fin TIME,
                pb_cmde TEXT,
                PRIMARY KEY (numero_cmde)
);

CREATE TABLE ligne_commande (
                numero_ligne INT AUTO_INCREMENT NOT NULL,
                numero_cmde VARCHAR(150) NOT NULL,
                produit INT NOT NULL,
                quantite INT NOT NULL,
                prix_unitaire_HT DECIMAL(7, 3),
                taux_TVA_100 DECIMAL(3, 1) DEFAULT 5.5,
                PRIMARY KEY (numero_ligne)
);

CREATE TABLE facture (
                numero_fact VARCHAR(150) NOT NULL,
                numero_cmde VARCHAR(150) NOT NULL,
                date_fact DATETIME NOT NULL,
                PRIMARY KEY (numero_fact)
);

CREATE TABLE adresse_client (
                id INT AUTO_INCREMENT NOT NULL,
                identifiant_client INT NOT NULL,
                adresse_actuelle BOOLEAN DEFAULT true,
                num_voie VARCHAR(20),
                voie VARCHAR(250) NOT NULL,
                complement_adresse VARCHAR(250),
                commentaire TEXT,
                code_postal INT NOT NULL,
                commune VARCHAR(150) NOT NULL,
                PRIMARY KEY (id)
);

CREATE TABLE livraison (
                numero_cmde VARCHAR(150) NOT NULL,
                id_adresse INT NOT NULL,
                date_souhait_livr DATETIME NOT NULL,
                contact_client INTEGER,
                type_livraison VARCHAR(150) DEFAULT 'À emporter' NOT NULL,
                livreur INT,
                livr_time_debut TIME,
                livr_time_fin TIME,
                pb_livraison TEXT,
                PRIMARY KEY (numero_cmde, id_adresse)
);

CREATE TABLE contact_tel_client (
                id INT AUTO_INCREMENT NOT NULL,
                identifiant_client INT NOT NULL,
                num_tel VARCHAR(20) NOT NULL,
                PRIMARY KEY (id)
);


-- create the Foreign Keys in ocPizza tables.

ALTER TABLE mb_staff ADD CONSTRAINT niv_autorisation_mb_staff_fk
FOREIGN KEY (autorisation)
REFERENCES niv_autorisation (id);

ALTER TABLE produit ADD CONSTRAINT categorie_produit_produit_fk
FOREIGN KEY (categorie_id)
REFERENCES categorie_produit (id);

ALTER TABLE ingredient ADD CONSTRAINT categorie_ingredient_ingredient_fk
FOREIGN KEY (categorie_id)
REFERENCES categorie_ingredient (id);

ALTER TABLE stock_actuel ADD CONSTRAINT ingredient_stock_actuel_fk
FOREIGN KEY (ingredient_id)
REFERENCES ingredient (id);

ALTER TABLE ingredient_pizza ADD CONSTRAINT ingredient_ingredient_pizza_fk
FOREIGN KEY (ingredient_id)
REFERENCES ingredient (id);

ALTER TABLE mouvement_stock ADD CONSTRAINT ingredient_mouvement_stock_fk
FOREIGN KEY (ingredient_id)
REFERENCES ingredient (id);

ALTER TABLE ingredient_pizza ADD CONSTRAINT produit_ingredient_pizza_fk
FOREIGN KEY (produit_id)
REFERENCES produit (id);

ALTER TABLE ligne_commande ADD CONSTRAINT produit_ligne_commande_fk
FOREIGN KEY (produit)
REFERENCES produit (id);

ALTER TABLE commande ADD CONSTRAINT pizzeria_commande_fk
FOREIGN KEY (pizzeria_id)
REFERENCES pizzeria (id);

ALTER TABLE mouvement_stock ADD CONSTRAINT restaurant_mouvement_stock_fk
FOREIGN KEY (pizzeria_id)
REFERENCES pizzeria (id);

ALTER TABLE stock_actuel ADD CONSTRAINT restaurant_stock_actuel_fk
FOREIGN KEY (pizzeria_id)
REFERENCES pizzeria (id);

ALTER TABLE affectation_staff ADD CONSTRAINT pizzeria_affectation_staff_fk
FOREIGN KEY (pizzeria_id)
REFERENCES pizzeria (id);

ALTER TABLE commande ADD CONSTRAINT mb_staff_commande_fk
FOREIGN KEY (serveur)
REFERENCES mb_staff (identifiant);

ALTER TABLE commande ADD CONSTRAINT mb_staff_commande_fk1
FOREIGN KEY (pizzaiolo)
REFERENCES mb_staff (identifiant);

ALTER TABLE affectation_staff ADD CONSTRAINT mb_staff_affectation_staff_fk
FOREIGN KEY (identifiant_staff)
REFERENCES mb_staff (identifiant);

ALTER TABLE livraison ADD CONSTRAINT mb_staff_livraisons_fk
FOREIGN KEY (livreur)
REFERENCES mb_staff (identifiant);

ALTER TABLE contact_tel_client ADD CONSTRAINT client_contact_tel_fk
FOREIGN KEY (identifiant_client)
REFERENCES client (identifiant);

ALTER TABLE adresse_client ADD CONSTRAINT client_adresse_fk
FOREIGN KEY (identifiant_client)
REFERENCES client (identifiant);

ALTER TABLE commande ADD CONSTRAINT client_commande_fk
FOREIGN KEY (identifiant_client)
REFERENCES client (identifiant);

ALTER TABLE facture ADD CONSTRAINT commande_facture_fk
FOREIGN KEY (numero_cmde)
REFERENCES commande (numero_cmde);

ALTER TABLE ligne_commande ADD CONSTRAINT commande_ligne_commande_fk
FOREIGN KEY (numero_cmde)
REFERENCES commande (numero_cmde);

ALTER TABLE livraison ADD CONSTRAINT commande_livraisons_fk
FOREIGN KEY (numero_cmde)
REFERENCES commande (numero_cmde);

ALTER TABLE livraison ADD CONSTRAINT adresse_client_livraisons_fk
FOREIGN KEY (id_adresse)
REFERENCES adresse_client (id);

ALTER TABLE livraison ADD CONSTRAINT contact_tel_client_livraison_fk
FOREIGN KEY (contact_client)
REFERENCES contact_tel_client (id);
