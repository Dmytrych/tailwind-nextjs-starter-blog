FROM node:20-alpine

WORKDIR /usr/src/app

COPY package.json .
COPY package-lock.json .
RUN npm install

COPY . .

WORKDIR /usr/src/app

RUN EXPORT=1 UNOPTIMIZED=1 npm run build

EXPOSE 3000

CMD ["npx", "serve", "out"]