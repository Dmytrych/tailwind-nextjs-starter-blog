FROM node:20-alpine

WORKDIR /usr/src/app

COPY package.json .
COPY yarn.lock .
RUN yarn install

COPY . .

WORKDIR /usr/src/app

RUN EXPORT=1 UNOPTIMIZED=1 yarn build

EXPOSE 3000

RUN yarn global add serve

CMD ["npx", "serve", "out"]