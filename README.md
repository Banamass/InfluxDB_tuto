# Tutoriel InfluxDB

## Overview
InfluxDB est une plateforme qui permet de collecter, stocker, intéragir et visualiser avec des données temporelles (Time Series). La particularité de ces données est qu'elles sont indexées par des valeurs temporelles. On les utilise notamment pour tracker des données au  cours du temps.

Ce tutoriel montre notamment comment utiliser InfluxDB 2 pour :
* importer un dataset
* interroger les données
* visualiser les résultats


## Setup

- Clone du github 
```bash 
git clone https://github.com/Banamass/InfluxDB_tuto
cd InfluxDB_tuto
```
- Lancer pour la première fois : 

```bash
docker compose up --build -d
```
Sinon :

```bash
docker compose up -d
```

- Pour aller sur le Dashboard InfluxDB :

Aller à http://localhost:8086

- Pour lancer un notebook :

- Connecter le kernel à http://localhost:8888

## Partie 0 : Script d'initialisation

Dans cette partie, nous allons lancer un script qui génère des données pour alimenter la base InfluxDB et une autre base SQL (MySQL).

### Etapes
1. Ouvrir le notebook: **notebooks/0-db-filler.ipynb**
2. Sélectionner le Kernel:
    - Cliquer sur Select Kernel
    - Puis Select Another Kernel...
    - Choisir Existing Jupyter Server...
    - Entrer l'URL : http://localhost:8888 
    - Confirmer (Yes)
    - Sélectionner Python3

Puis, lancer le script et laisser tourner. Au bout de quelques minutes, vous pouvez l'arrêter si vous le souhaiter
Pas besoin d'essayer de comprendre ce que fait ce script.

### Exécution

- Lancer la cellule du notebook
- Le script va commencer à générer des données en continu
- Le script n'empêche pas de continuer le TP    

Si vous souhaitez l'arrêter, laissez-le tourner au moins quelques dizaines de secondes afin de générer assez de données.

### Les données
- expliquer rapidement quelles données sont écrites dans la DB

## Partie 1 : Pourquoi InfluxDB ?

Notebook `1_sql_vs_influxdb.ipynb`

### Qu'est-ce qu'une time series ?
- données qui arrive au compte goutte avec un timestamp
- on ajoute juste, on modifie pas
- Cas d'utilisation classiques

### SQL vs InfluxDB
- On montre que SQL c'est pas efficace pour faire des requêtes dans ce genre de données
- Voir 1_sql_vs_influxdb.ipynb

### Explications  : Pourquoi InfluxDB est plus rapide ?
explications pas techniques pour l'instant : 
- stockage orienté temps, données stockés dans l'ordre chronologique
- ecriture en ajout uniquement donc optimisation pour ça
- données ont des pattern (valeurs proches/régulières) -> influxdb utilise des techniques de compression adaptées 


## Partie 2 : Présentation InfluxDB

Notebook `2_ecriture_donnees.ipynb`

### Organisation des données

* **Bucket** : où sont stockées les données
    * **Measurement** : groupe de données, équivalent d'une table
        * Tags : metadata sur laquelle on peut filtrer - ex : location
        * Fields : valeurs mesurées - ex : temperature
        * Timestamp : date/heure du point, permet d'indexer les valeurs au cours du temps

### Ecriture des données - cf Notebook
- Méthode 1 : Avec l'UI d'InfluxDB 
- Méthode 2 : CLI (soit on donne une doc soit on explique comment faire)
- Méthode 3 : Python (donner une documentation, enlever les parties importantes et mettre des commentaires)

### Concepts clés

Un point = une mesure à un instant donné -> Ex : `temperature,room=salon value=22.5`

Une series = measurement + tags -> Ex : `temperature,room=salon` \
Tous les points avec un tel tag appartiennent à la même series.

**Pourquoi cette organisation est optimale ?**

1. Les tags sont indexés donc les requêtes sont très rapides. On peut filtrer très facilement - cf Partie 3
2. Les données sont stockées par series ce qui prend moins de place :
    - timestamp proches donc on stocke plutôt le delta de temps
    - valeurs similaires donc on stocke la différence
    - on ne répète pas les tags
3. InfluxDB est optimisé pour le temps réel (requêtes temporelles, agrégations...)
4. Flexible car pas de schéma : on peut ajouter des tags et des fields à tout moment

-> Question à poser : Pourquoi ne faut-il pas mettre user_id en tag

### Dataset
Pour la suite, on utilisera 
- Bucket : home
    - Measurement : home
        - Tags : 
            - room 
            - floor
        - Fields : 
            - temp 
            - hum 
            - co2 
            - power 
            - occupied

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
- La visualisation temps réel se fait dans le notebook `4_visualisation_temps_reel.ipynb`

Questions ?
Quelles pièces est la plus chaude (en moyenne) ?
Quelle est la valeur max de ??
etc ...

## Partie 4 : Visualisation temps réel

Notebook `4_visualisation_temps_reel.ipynb`

### Description

Ce notebook affiche les données InfluxDB en direct avec une fenêtre glissante.

Il inclut une UI interactive (widgets) pour piloter la visualisation.

- Source : bucket `home`, measurement `home`
- Champs visualisables : `temp`, `hum`, `co2`, `power`, `occupied`
- Rafraîchissement configurable (par défaut toutes les 2 secondes)
- Contrôles UI : choix du champ, choix de la fenêtre, bouton Démarrer/Arrêter
