# OCP_P6
Dossier de spécification technique - OCPizza

Afin d'illustrer le dossier de spécification technique, une base de données fictive à été créée :

## CRÉATION BASE DE DONNÉES, UTILISATEUR ET PRIVILÈGES
```console
$ Mysql -h localhost -u root -p
# Enter password: (votre mot de passe root)
```
```mysql
mysql> CREATE USER 'ocp6'@'localhost' IDENTIFIED BY 'mdp';
mysql> GRANT ALL PRIVILEGES ON ocPizza.* TO 'ocp6'@'localhost';
mysql> QUIT
```

## CONNEXION À LA BASE DE DONNÉES

### Ouverture de la base de donnée MySQL
```console
$ MYSQL -u ocp6 -p ocPizza
# Enter password: 'mdp'
```

### Création de la structure de la base et insertion des données fictives.
```mysql
mysql> SOURCE SQL/OCP6_BD.sql;
mysql> SOURCE SQL/importdata.sql;
```
