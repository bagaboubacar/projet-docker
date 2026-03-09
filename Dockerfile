# 1. Image de base 
FROM amazoncorretto:17-alpine

# 2. Dossier de travail dans le conteneur
WORKDIR /app

# 3. Copier ton JAR dans le conteneur
COPY target/paymybuddy.jar app.jar

# 4. Exposer le port de Spring Boot
EXPOSE 8080

# 5. Commande pour démarrer l'application
CMD ["java", "-jar", "app.jar"]

