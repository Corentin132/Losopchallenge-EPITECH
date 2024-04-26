# Monitoring - Prometheus et grafana

### Prometheus Server
Est composé de 3 partie
- **Storage TSDB chronologique** -> stock toutes les données de métriques (CPU usage, nb d'exceptions dans une app,...)
- **Data Retrieval Worker** - Agent de récupération de données -> responsable de get ou pull les metriques depuis les app, les services, servers et autres target + stockage dans la DB
- **HTTP server, API** -> qui accepte les requêtes PromQL pour ses données pour les afficher dans un tableau de bord prometheus ou un outil de visualisation (Grafana).

### Targets and Metrics
Prometheus surveille des Targets et chaque target a des unités de surveillance.
Métriques -> Format: Human-readable text-based   
Les entrées de métriques ont des attribues :    
\- de HELP (description)   
\- de TYPE (3 types: les counter, les Gauge -jauge-, les Histogramme)


### Target endpoints and Exporters
Prometheus pull les données de métriques des targets depuis un endpoints HTTP qui par défaut est `hostadress/metrics`

Soit la target a déjà un endpoint natif, soit elle a besoin d'un composant supplémentaire 
-> un **Exporter** : un script ou un service qui    
	- récupère les métriques de la target    
	- les converti au format prometheus   
	- les exposent /metrics   
Pour que le Retrieval puisse les récupérer

Official Prometheus Exporters List -> https://prometheus.io/docs/instrumenting/exporters/   

Les exporters sont disponible sous forme d'image Docker


### Monitoring your own app
Utiliser les librairies client en fonction du langage   
Prometheus Client Libraries -> https://prometheus.io/docs/instrumenting/clientlibs/   
Même principe, exposer sur l'endpoint /metrics les métriques qui sont pertinentes.

### Pull mechanism
Avantage de prometheus c'est d'extraire les données depuis un endpoint. Par rapport à d'autres systèmes de monitoring (Amazon Cloud Watch, New Relic, etc...) qui utilise un push systems (risque de charge élevée de trafic, installation des démons..), Prometheus ne necessite qu'un endpoint de scrapping.

\- Les métrics peuvent être extraite par plusieurs instance de prometheus   
\- meilleure détection/information si le service est opérationnel avec l'utilisation du pull

### Pushgateway
Il existe des cas où la target qui doit être surveillé ne s'execute que pendant une courte periode (pas assez longue pour être scrapé) ex une batch job (tâche par lot), schedule job (tâche planifiée), cleanup d'une old data, un backup, etc..

Pour de tel jobs prometheus offre un composant pushgateway afin que ses services puissent transmettre leurs métrics directement à la DB prometheus (mais ça devrait être une exception) 

["short-lived job"] -> push metrics at exit -> [Pushgateway]


### Configuration de Prometheus
prometheus.yml   
-> définir les targets à scrapper et à quel interval
Prometheus utilise un service discovery pour trouver ces endpoints
- config global (interval de scrape et fréquence d'évaluation des règles)
- rules files (règles specifique, agréger les valeurs matricielles, créer des alertes lorsqu'une condition est remplie - utilisation du processeur à 80% par exemple) prometheus utilise les règles pour créer de nouvelles entrées de time séries et générer les alertes
- scrape config contrôle les ressources que prometheus surveille

prometheus peut surveiller sa propre santé -> localhost:9090

#### Définir ses propres jobs
```yaml
- job_name: node_exporter
  scrape_interval: 1m
  scrape_timeout: 1m
  static_config:
     - targets: ['localhost:91000']
```

### Alert Manager
Comment prometheus trigger les alert définit par les règles ?    
-> [Prometheus read alert rules of config] -> push alerts -> [composant Alertmanager] -> notify -> Email, Slack...


### Data Storage
Prometheus stock les data sur disk (HDD/SDD) Local TSDB. Une fois les données collectées ont peut interroger les métrics des targets via son API de server avec PromQL Query Language

#### PromQL Query Language
\- utiliser le dashboard Prometheus web UI    
\- ou utiliser Grafana un outil de visualisation qui utilise PromQL    

exemple de queries :
`http_requests_total{status!~"4.."}` -> Query all HTTP status codes except 4xx ones
`rate(http_requests_total[5m])[30m:]` -> sous requête pendant une période de 30minutes