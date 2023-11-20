# FILROUGE

*********
- 1 - kubectl create namespace v0
- 2 - kubectl apply -f resources.yml -n v0
- 3 - kubectl apply -f satefulset mariadb.yml -n v0
- 4 - kubectl apply -f service-mariadb.yml -n v0
- 5 - kubectl apply -f deployment-wordpress.yml -n v0
- 6 - kubectl apply -f hpa-wordpress.yml -n v0
- 7 - kubectl apply -f service-wordpress.yml -n v0
*********

- 1 - Création du namespace V0
  - v0 = espace de travail initial

- 2 - Création des pv et pvc sur v0
  - pv en rwo type local sur /mnt/data
  - pvc mariadb
  - pvc wordpress

- 3 - Création de la base mariadb sur v0 
  - Choix d'un statefulset car application avec état
  - Utilisation de l'image officielle mariadb
  - 1 replica
  - Définition des variables d'environnement de création et accès base
  - port container : 3306
  - Montage volume persistant sur /var/lib/mysql en utilisant pvc mariadb
    - A VOIR : 
      - Redondance
      - Créer notre propre image mariadb ou image version fixe ?
      - VPC et montage de volume nécessaire même si statefulset ?

- 4 - Création du service mariadb
  - ClusterIP
  - port 3306

- 5 - Création du déploiement wordpress sur v0 
  - utilisation de l'image officielle wordpress
  - 2 replicats
  - stratégie : RollingUpdate
  - port container : 80
  - définition des variables d'environnement d'accès à la base wordpress (via service mariadb)
  - montage volume persistant sur /var/www/html via vpc wordpress
    - A VOIR :
      - créer de notre image web avec install nginx et wordpress ?
      - quelle stratégie de mise à jour des pods ?
      - volume persistant pour www/html ou intégré (quid des éventuels besoin des utilisateurs wordpress?)

- 6 - Création du scaling horizontal sur déploiement wordpress sur v0
  - min: 2 / max: 10
  - %CPU : 50
    - A VOIR :
      - stratégie de scaling

- 7 - Création du service wordpress sur v0
  - NodePort pour accès extérieur
  - port : 80
  - nodePort : 30000 



- xxx - A VOIR / A FAIRE
  - secrets et configmaps pour accès mariadb
  - Ingress
  - Sécurisation ssl
  - Sauvegarde
  - helm
  - kustomize
  - Pipelines CI/CD
  - Environnements test / prod
  - Go AWS ?
