# FILROUGE

***
Image Docker - Front end
Repo dockerhub de l'image wordpress avec intégration des sources personnalisées : barnz/wordpress-filrouge

* docker build -t barnz/wordpress-filrouge:[tag] .
* docker push barnz/wordpress-filrouge:[tag]

***
Déploiement HELM

Modifier la valeur de wordpress:host: dans values-[xxx].yaml en fonction de l'environnement :
- test : http://filrouge-test.barnz.cloudns.ph
- prod : http://filrouge-prod.barnz.cloudns.ph


* le chart utilise les secrets déjà installés pour chaque namespace (secrets-db-wordpress)

Environnement TEST (dans namespace 'filrouge-test'):
* helm [install/upgrade] filrouge-chart-test ./filrouge_chart --values=./filrouge_chart/values-test.yaml -n filrouge-test

Environnement PROD (dans namespace 'filrouge-prod'):
* helm [install/upgrade] filrouge-chart-prod ./filrouge_chart --values=./filrouge_chart/values-prod.yaml -n filrouge-prod

