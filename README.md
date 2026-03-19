# Tutoriel InfluxDB
## Overview

InfluxDB est une plateforme qui permet de collecter, stocker, intéragir et visualiser avec des données de séries chronologiques (time series data). La particularité de ces données est qu'elles sont indexées par des valeurs temporelles. On les utilise notamment pour tracker des données au  cours du temps.

Ce tutoriel montre comment utiliser InfluxDB 2 pour :
* importer un dataset
* interroger les données
* visualiser les résultats

Lien vers la documentation InfluxDB 2 :  `https://docs.influxdata.com/influxdb/v2/get-started/`

## Setup

Clone du github et lancement de docker
``` 
git clone https://github.com/Banamass/InfluxDB_tuto
cd InfluxDB_tuto
docker-compose up -d 
```

**Rappel - Pour se connecter au notebook jupyter dans le conteneur :**

Cliquez sur "Select Kernel" (en haut à droite quand le notebook est sélectionné), "Select another kernel", "Existing Jupyter Server", "Enter the URL of the running Jupyter Server" (ou `localhost` si vous l'avez déjà créé), saisissez http://localhost:8888, cliquez ensuite sur Yes, et indiquez comme nom `localhost`. Sélectionnez ensuite Python 3. 

Pour les Mac : si vous avez des soucis (SSL) et que vous ne trouvez pas de moyen de les régler, utilisez un navigateur. Dans ce cas, et si un serveur Jupyter a été lancé par Vscode, il peut être nécessaire de modifier le port exposé (par exemple par 8889) dans le fichier `docker-compose.yml`.

## Dataset
On utilisera un dataset fourni par InfluxDB qui représente un cas d'utilisation IoT ("Internet of Things") qui simule les niveaux de température, d'humidité et de monoxyde de carbone dans différentes pièces d'un bâtiment.

**A partir de maintenant, vous pouvez suivre le déroulement du tutoriel dans le notebook `tutoriel_influxdb.ipynb`**

## Guide langagne Flux