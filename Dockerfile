FROM node:13.12.0-alpine AS build-stage

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm i 

COPY . .

CMD ["npm", "run", "build"]


FROM baseImage