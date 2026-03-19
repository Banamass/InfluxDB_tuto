# Tutoriel InfluxDB

L'objectiff de ce tutoriel est de découvrir InfluxDB et plus globalement les Time Series (données temporelles).

## Setup

Expliquer comment tout lancer et pré-requis

## Partie 1 : Pourquoi InfluxDB ?

### Qu'est-ce qu'une time series ?
-> données qui arrive au compte goutte avec un timestamp
-> on ajoute juste, on modifie pas
-> Cas d'utilisation classiques

### SQL vs InfluxDB
-> On montre que SQL c'est pas efficace pour faire des requêtes dans ce genre de données
-> Notebook : sql_vs_influxdb.ipynb 
(cacher ce qui se passe en arrière mais ça serait bien d'avoir une grosse base de donnée de pouvoir faire des requêtes sql et infludb dessus et de montrer qu'influxdb est plus rapide)

### Explications  : Pourquoi InfluxDB est plus rapide ?
explications pas techniques pour l'instant : 
- stockage orienté temps, données stockés dans l'ordre chronologique
- ecriture en ajout uniquement donc optimisation pour ça
- données ont des pattern (valeurs proches/régulières) -> influxdb utilise des techniques de compression adaptées 



-> Peux-être supprimer les données entre la partie 1 et 2 pour repartir de zéro

## Partie 2 : Présentation InfluxDB

### Organisation des données
bucket, measurement, tags, fields, timestamp
-> exemple de modèle

### Ecriture des données 
- Méthode 1 : Avec l'UI d'InfluxDB (expliquer comment faire/la syntaxe)
- Méthode 2 : CLI (soit on donne une doc soit on explique comment faire)
- Méthode 3 : Python (donner une documentation, enlever les parties importantes et mettre des commentaire)

### Concepts
Point, Series
Pourquoi cette organisation est optimale ?

-> Question à poser : Pourquoi ne faut-il pas mettre user_id en tag



## Partie 3 : Exploitation des données

### Requêtes avec Flux

Donner documentation

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


