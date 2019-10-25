# OCP_P6 - Dossier de spécification technique - OCPizza

Afin d'illustrer le dossier de spécification technique, une base de données fictive à été créée. Télécharger ce dossier et lancez le terminal de votre ordinateur en positionnant le répertoire courant dans OCP_P6/SQL.

## CRÉATION BASE DE DONNÉES, UTILISATEUR ET PRIVILÈGES
Si besoin, documentation installation MySQL : [ici](https://openclassrooms.com/fr/courses/1959476-administrez-vos-bases-de-donnees-avec-mysql/1959969-installez-mysql)
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
mysql> SOURCE OCP6_BD.sql;
mysql> SOURCE importdata.sql;
```

NB : Vous pouvez également utiliser le dump :  **OCPizza_dump.sql**
