#Etapa de construcción
FROM node:18 AS build

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

#Etapa de produccción
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html



