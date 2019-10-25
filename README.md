# OCP_P6
Dossier de spécification technique - OCPizza


## OC PIZZA Database : USER AND PRIVILEGES' USER CREATION
```console
$ Mysql -h localhost -u root -p
# insert your root password
```
```mysql
mysql> CREATE USER 'ocp6'@'localhost' IDENTIFIED BY 'mdp';
mysql> GRANT ALL PRIVILEGES ON ocPizza.* TO 'ocp6'@'localhost';
```

## CONNEXION DATABASE

### Launch MySQl
```console
$ MYSQL -u ocp6 -p ocPizza
```

### Run tests files to download datas in database
```mysql
mysql> SOURCE SQL/OCP6_BD.sql;
mysql> SOURCE SQL/importdata.sql;
```
