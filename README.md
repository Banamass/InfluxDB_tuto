# Tutoriel InfluxDB

## Overview
InfluxDB est une plateforme qui permet de collecter, stocker, intéragir et visualiser avec des données temporelles (Time Series). La particularité de ces données est qu'elles sont indexées par des valeurs temporelles. On les utilise notamment pour tracker des données au  cours du temps.

Ce tutoriel montre notamment comment utiliser InfluxDB 2 pour :
* importer un dataset
* interroger les données
* visualiser les résultats


## Setup

Clone du github 
```bash 
git clone https://github.com/Banamass/InfluxDB_tuto
cd InfluxDB_tuto
```
Lancer pour la première fois : 

```bash
docker compose up --build -d
```
Sinon :

```bash
docker compose up -d
```

Pour aller sur le Dashboard InfluxDB :

- Aller à http://localhost:8086

Pour lancer un notebook :

- Connecter le kernel à http://localhost:8888

## Partie 1 : Pourquoi InfluxDB ?

### Qu'est-ce qu'une time series ?
- données qui arrive au compte goutte avec un timestamp
- on ajoute juste, on modifie pas
- Cas d'utilisation classiques

### SQL vs InfluxDB
- On montre que SQL c'est pas efficace pour faire des requêtes dans ce genre de données
- Notebook : sql_vs_influxdb.ipynb 
(cacher ce qui se passe en arrière mais ça serait bien d'avoir une grosse base de donnée de pouvoir faire des requêtes sql et infludb dessus et de montrer qu'influxdb est plus rapide)

### Explications  : Pourquoi InfluxDB est plus rapide ?
explications pas techniques pour l'instant : 
- stockage orienté temps, données stockés dans l'ordre chronologique
- ecriture en ajout uniquement donc optimisation pour ça
- données ont des pattern (valeurs proches/régulières) -> influxdb utilise des techniques de compression adaptées 



-> Peux-être supprimer les données entre la partie 1 et 2 pour repartir de zéro

## Partie 2 : Présentation InfluxDB

Notebook `2_importation_donnees.ipynb`

### Organisation des données

* **Bucket** : où sont stockées les données
    * **Measurement** : groupe de données
        * Tags : Pairs clé-valeur qui ne changent pas souvent, metadata - ex : location
        * Fields : Pairs clé-valeur qui changent au cours du temps - ex : temperature
        * Timestamp : permet d'indexer les valeurs au cours du temps

**Dataset** \
On utilisera un dataset fourni par InfluxDB qui représente un cas d'utilisation IoT ("Internet of Things") simulant les niveaux de température, d'humidité et de monoxyde de carbone dans différentes pièces d'un bâtiment.

### Ecriture des données 
- Méthode 1 : Avec l'UI d'InfluxDB (expliquer comment faire/la syntaxe)
- Méthode 2 : CLI (soit on donne une doc soit on explique comment faire)
- Méthode 3 : Python (donner une documentation, enlever les parties importantes et mettre des commentaire)

### Concepts
Point, Series
Pourquoi cette organisation est optimale ?

-> Question à poser : Pourquoi ne faut-il pas mettre user_id en tag



## Partie 3 : Exploitation des données

Notebook `3_requetes.ipynb`

### Requêtes avec Flux

Lien vers la documentation InfluxDB 2 :  `https://docs.influxdata.com/influxdb/v2/get-started/`


Exercices :

Requêtes de base :
- Récupérer toutes les données dans home depuis 15 min
- Récupérer toutes les données dans home depuis 15 min et filter par un field (à voir lequel)
- Récupérer toutes les données dans home depuis 15 min et filter par un tag (à voir lequel)
    -> Question : qu'est-ce qui est mieux ? Les filtres par tag ou par field ?

Agrégations : 
- Moyenne de ??
- Moyenne par fenêtre de ??

Visualisation :
- Montrer différentes vues de ??
- Comparer des courbes (quelles courbes ?)

Questions ?
Quelles pièces est la plus chaude (en moyenne) ?
Quelle est la valeur max de ??
etc ...


