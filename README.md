
# PayMyBuddy – DevOps Docker POC

PayMyBuddy est une application de gestion de transactions financières entre amis.
Ce projet est un Proof of Concept (POC) visant à améliorer le déploiement et la gestion de l’application grâce aux pratiques DevOps et à la conteneurisation avec Docker.

L’application est composée :
-	d’un backend Spring Boot
-	d’une base de données MySQL
-	d’une orchestration via Docker Compose
-	d’un déploiement d’images via un Docker Registry privé

## Objectives

Ce projet a pour objectifs :
-	Dockeriser une application backend Java
-	Externaliser la base de données MySQL
-	Mettre en place une infrastructure Infrastructure as Code
-	Sécuriser la configuration via des variables d’environnement
-	Versionner et déployer les images via un registry privé

## Architecture

<img width="205" height="273" alt="Architecture" src="https://github.com/user-attachments/assets/358eae5b-21df-4b67-b2ea-7f52534cf55a" />

## Technologies Used
-	Java 17
-	Spring Boot
-	MySQL 8
-	Docker
-	Docker Compose
-	Docker Registry

## Project Structure

<img width="203" height="218" alt="structure_projet" src="https://github.com/user-attachments/assets/0919c7f3-4f30-41e7-b36b-54fb68ce63bd" />

## Dockerfile (Backend)
Le backend est dockerisé à l’aide de l’image amazoncorretto:17-alpine.

Le fichier JAR est copié dans le conteneur et exposé sur le port 8080.

Principes :
-	Image légère
-	Port exposé
-	Commande de démarrage unique

## Database Initialization
La base MySQL est initialisée automatiquement au premier démarrage grâce au dossier initdb.
Le scripts SQL sont montés dans :

/docker-entrypoint-initdb.d

Ils permettent :
-	la création des tables
-	l’initialisation des données

## Security & Configuration
Les informations sensibles (identifiants, mots de passe) ne sont pas stockées en dur.

Elles sont externalisées dans un fichier .env :
- MYSQL_DATABASE
-	MYSQL_USER
-	MYSQL_PASSWORD
-	MYSQL_ROOT_PASSWORD
-	SPRING_DATASOURCE_URL
-	SPRING_DATASOURCE_USERNAME
-	SPRING_DATASOURCE_PASSWORD
  
Cela permet :
-	une meilleure sécurité
-	une configuration adaptable selon l’environnement

## Docker Compose Orchestration
Docker Compose permet de :
-	Déployer les services backend et base de données
-	Gérer le réseau interne
-	Définir les dépendances (depends_on)
-	Assurer la persistance des données via des volumes
Commande de lancement :
```
docker-compose up --build
```
Accès à l’application :
http://localhost:8080

## Docker Registry
Un registry privé local est utilisé pour stocker les images Docker.

Lancement du registry :
```
docker run -d -p 5000:5000 --name registry registry:2
```
Build, tag et push des images :
```
docker build -t paymybuddy-backend:1.0
docker tag paymybuddy-backend:1.0 localhost:5000/paymybuddy-backend:V1
docker push localhost:5000/paymybuddy-backend:V1
```
Les images sont ensuite utilisées directement dans docker-compose_Registry.yml.

## Screenshots

-	Conteneurs en cours d’exécution


<img width="945" height="159" alt="image" src="https://github.com/user-attachments/assets/2d92dd0f-52a2-4f3f-a528-20cbe7d79bc7" />

-	Accès à l’application via navigateur

<img width="945" height="446" alt="image" src="https://github.com/user-attachments/assets/c96b6f62-49ef-4bb9-9118-f0d6486ae0e1" />

-	Base de données initialisée

<img width="409" height="367" alt="image" src="https://github.com/user-attachments/assets/6ca058b1-2bcf-47d0-a815-8ad833a24d1f" />

-	Registry contenant les images

 <img width="945" height="71" alt="image" src="https://github.com/user-attachments/assets/937608a1-fb97-49c7-af47-c3af10e8e377" />

## Conclusion
Ce projet démontre la mise en place d’une infrastructure Dockerisée moderne permettant :
-	un déploiement reproductible
-	une meilleure maintenabilité
-	une séparation claire entre build et run
-	une approche DevOps orientée production


