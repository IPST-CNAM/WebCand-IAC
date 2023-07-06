# Utilisez une image de base Node.js avec un environnement de production
FROM node:14-alpine as build-stage

# Définit le répertoire de travail dans le conteneur
WORKDIR /app

# Copie les fichiers package.json et package-lock.json dans le répertoire de travail
COPY package*.json ./

# Installe les dépendances du projet
RUN npm install

# Copie tous les fichiers du répertoire actuel dans le répertoire de travail du conteneur
COPY . .

EXPOSE 3000

# Construit l'application React
CMD ["npm","start"]