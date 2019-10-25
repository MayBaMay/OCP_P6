# OCP_P6
Dossier de spécification technique - OCPizza


## CRÉATION BASE DE DONNÉES, UTILISATEUR ET PRIVILÈGES
```console
$ Mysql -h localhost -u root -p
# insert your root password
```
```mysql
mysql> CREATE USER 'ocp6'@'localhost' IDENTIFIED BY 'mdp';
mysql> GRANT ALL PRIVILEGES ON ocPizza.* TO 'ocp6'@'localhost';

mysql> QUIT
```

## CONNEXION À LA BASE DE DONNÉES

### Ouverture de la base de donnée MySQl
```console
$ MYSQL -u ocp6 -p ocPizza
# Enter password: 'mdp'
```

### Run tests files to download datas in database
```mysql
mysql> SOURCE SQL/OCP6_BD.sql;
mysql> SOURCE SQL/importdata.sql;
```
