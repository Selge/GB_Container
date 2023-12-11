FROM node:14 as dev

WORKDIR /app

COPY package.json .
COPY package-lock.json .
RUN npm ci

COPY . .

CMD [ "npm", "start" ]


FROM node:14 as prod

WORKDIR /app

COPY package.json .
COPY package-lock.json .
RUN npm ci --only=production

COPY . .

CMD [ "npm", "start" ]


FROM node:14 as lab

WORKDIR /app

COPY package.json .
COPY package-lock.json .
RUN npm ci

COPY . .

CMD [ "npm", "start" ]