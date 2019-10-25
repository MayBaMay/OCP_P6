-- CRÉATION BASE DE DONNÉES, UTILISATEUR ET PRIVILÈGES --

   -- $ Mysql -h localhost -u root -p
CREATE USER 'ocp6'@'localhost' IDENTIFIED BY 'mdp';
GRANT ALL PRIVILEGES ON ocPizza.* TO 'ocp6'@'localhost';
QUIT


-- CONNEXION À LA BASE DE DONNÉES ET INSERTION DES DONNÉES

-- $ MYSQL -u ocp6 -p ocPizza
SOURCE OCP6_BD.sql;
SOURCE importdata.sql;
