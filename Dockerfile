FROM node:13.12.0-alpine

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm i 

COPY . .

RUN npm run build


FROM nginx:1.19.2-alpine

COPY --from=0 /app/build /usr/share/nginx/html
