#stage1 

FROM node:latest as node 
WORKDIR /app
COPY . .
RUN npm install 
run npm run build --prod 

#stage2 

FROM nginx:alpine
COPY --from=node /app/dist/angular-app usr/share/nginx/html 

