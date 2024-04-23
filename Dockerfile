FROM node:alpine as baseimage
WORKDIR /app
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=baseimage /app/build /usr/share/nginx/html