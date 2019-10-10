-- OC PIZZA Database : USER AND PRIVILEGES' USER CREATION --



CREATE USER 'ocp6'@'localhost' IDENTIFIED BY 'mdp';
GRANT ALL PRIVILEGES ON ocPizza.* TO 'ocp6'@'localhost';


-- CONNEXION DATABASE

MYSQL -u ocp6 -p ocPizza
SOURCE OCP6_BD.sql;
SOURCE importdata.sql;
