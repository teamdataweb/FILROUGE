# FILROUGE

Repo dockerhub de l'image wordpress avec intégration des sources personnalisées : barnz/wordpress-filrouge
* docker build -t barnz/wordpress-filrouge:[tag] .

Déploiement HELM test (namespace = filrouge-test):
* helm upgrade filrouge-chart-test ./filrouge_chart --values=./filrouge_chart/values-test.yaml -n filrouge-test

Déploiement HELM prod (namespace = filrouge-prod):
* helm upgrade filrouge-chart-prod ./filrouge_chart --values=./filrouge_chart/values-prod.yaml -n filrouge-prod

*********
Modifier la valeur de wordpress:host: dans values-[xxx].yaml en fonction de l'environnement :
- test : http://filrouge-test.barnz.cloudns.ph
- prod : http://filrouge-prod.barnz.cloudns.ph
*********
